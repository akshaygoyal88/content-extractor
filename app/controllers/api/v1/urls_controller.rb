class Api::V1::UrlsController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def create
    link = params['url'] || "http://akshaygoyal.herokuapp.com"

    doc = Nokogiri::HTML(open(link))
    url = Url.find_or_create_by(link: link)

    h1_tags = doc.css('h1')
    h2_tags = doc.css('h2')
    h3_tags = doc.css('h3')
    a_tags = doc.css('a')

    h1_items = tags_parse(url.id, 'h1', h1_tags).compact
    h2_items = tags_parse(url.id, 'h2', h2_tags).compact
    h3_items = tags_parse(url.id, 'h3', h3_tags).compact
    a_items = tags_parse(url.id, 'a', a_tags).compact

    urls = Url.all
    render json: urls, status: 200
  end

  def index
    urls = Url.all
    render json: urls, status: 200
  end

  private

    def tags_parse(id, element, tags)
      tags.map do |tag|
        content = tag.text.strip
        link = tag.css('a').first['href'] unless tag.css('a').length == 0

        if !content.empty?
          case element
            when 'h1'
              H1.find_or_create_by(url_id: id, content: content, link: link )
            when 'h2'
              H2.find_or_create_by(url_id: id, content: content, link: link )
            when 'h3'
              H3.find_or_create_by(url_id: id, content: content, link: link )
            when 'a'
              link = tag['href']
              A.find_or_create_by(url_id: id, content: content, link: link )
          end

          content
        end
      end
    end
end
