# 🚢 Docker with task scheduler

## Introduction

The goal is to create a docker container where various tasks are performed with different frequencies. For example, a task can be to send emails every day or every month, or perform analyzes on the database and extract reports to sent them to the user involved.

## Add new task

Within the `app/Console/Kernel.php` file in the `scheduler` method it is possible to schedule various tasks with different frequencies.

You can read more details by following this [documentation](https://laravel.com/docs/8.x/scheduling#scheduling-artisan-commands).

## Test locally

Create `.env` file with cp `.env.example .env` and fill all missing variables.

To test the Docker container just build the image with the following command:

```bash
docker build -t [CONTAINER_NAME] .
```

and launch the image with the following command:

```bash
docker run -t -i [CONTAINER_NAME]
```
