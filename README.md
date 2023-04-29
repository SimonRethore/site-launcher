# Site Launcher

Site Launcher is a web application which has purpose to simplify the developer's life by saving their working web application's links under multiple environments.

Currently the application support 3 environments (Dev, Preprod and Prod) and 7 types of tags for link (front, back, extranet, api, github, gitlab and sentry)

## Project setup

First you can start by cloning the repository.

```bash
git clone https://github.com/SimonRethore/site-launcher.git
```

Then you can run locally:

```bash
npm install
```

For generating the build of the app to deploy it:

```bash
npm run build
```

## Usage

Add your data in the assets directory:
- `/images` for the site's image
- `data.json` to define data that will be used by the app

```json
[
    {
        "name" : "Hello World",
        "image" : "images/hello-world.jpg",
        "lead": true,
        "environments": [
            { 
                "name": "Prod", 
                "links": [
                    { 
                        "name": "Front-Office",
                        "tag": "front",
                        "link": "https://hello-world.fr"
                    },
                    { 
                        "name": "Back-Office",
                        "tag": "back",
                        "link": "https://hello-world.fr/admin"
                    }
                ] 
            },
            { 
                "name": "Dev", 
                "links": [
                    { 
                        "name": "Front-Office",
                        "tag": "front",
                        "link": "http://localhost:80"
                    },
                    { 
                        "name": "Back-Office",
                        "tag": "back",
                        "link": "http://localhost:80/admin"
                    }
                ] 
            }
        ]
    }
]
```