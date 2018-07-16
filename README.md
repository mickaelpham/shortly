# Link shortener

A simple implementation of [TinyURL](https://tinyurl.com/)

## Getting started

```sh
git clone https://github.com/mickaelpham/shortly
cd shortly
bin/setup
bin/rails server
```

## Usage

```sh
# Create a tiny URL
curl --request POST \
  --url http://localhost:3000/links \
  --header 'content-type: application/x-www-form-urlencoded' \
  --data 'original_url=https%3A%2F%2Fwww.zendesk.com%2Fresources%2Fgartner-magic-quadrant-crm%2F&='

# Retrieve the URL
curl --request GET \
  --url http://localhost:3000/links/b
```
