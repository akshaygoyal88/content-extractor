== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

run command
$ rails s

 This project should now be running locally on port `3000`.

# About
These instructions are a small documentation of the how the API should behave.

Example calls are made using JavaScript's `axios` npm package.

### Given URL

Saves H1, H2, H3 and links from a given URL to the database.

| URL Endpoint | Method | URL Params | Success Response |
| ----- | ----- | ----- | ----- |
| `/url` | `POST` | Required: `link=[string]` | `200` |

**Sample Call:**

  ```javascript
    axios.post('http://localhost:3000/v1/urls', { url: 'http://akshaygoyal.herokuapp.com' })
      .then(response => response.data)
      .catch(error => error)
  ```

### Get All H1, H2, H3 and Links

  Get back H1, H2, H3 and links from a previously saved URLs from the database.

  | URL Endpoint | Method | URL Params | Success Response |
  | ----- | ----- | ----- | ----- |
  | `/url` | `GET` | N/A | `200` |

  **Sample Call:**

  ```javascript
    axios.get('http://localhost:3000/v1/urls')
      .then(response => response.data)
      .cathc(error => error)
  ```

  **Content:**
  ```javascript
  [
  {
    "link": "https://akshaygoyal.herokuapp.com",
    "h1": [
      {
        "content": "About me",
        "link": null
      }
    ],
    "h2": [
      {
        "content": "Akshay GoyalRuby On Rails Developer & Designer",
        "link": null
      }
    ],
    "h3": [
      {
        "content": "Services",
        "link": null
      },
      {
        "content": "My Work",
        "link": null
      },
      {
        "content": "Contacts",
        "link": null
      }
    ],
    "a": [
      {
        "content": "send",
        "link": "#"
      },
      {
        "content": "clear",
        "link": "#"
      },
      {
        "content": "akshay.goyal1008@gmail.com",
        "link": "#"
      },
      {
        "content": "Offset Printing",
        "link": "#"
      },
      {
        "content": "Desigining",
        "link": "#"
      },
      {
        "content": "Development",
        "link": "#"
      },
      {
        "content": "Web",
        "link": "#"
      },
      ...
    ]
  }
]
  ```
