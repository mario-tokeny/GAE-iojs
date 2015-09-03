# GAE-iojs example

This is a sample Hello world app that runs with [io.js][1] on [Google App Engine Managed VMs][5] by using a [custom runtime][4].

It's a __unofficial__ modification of the [Hello world app for node.js][2] provided by Google in the official [Google Cloud Platform repository][6].

## Usage

Start by cloning this repository.

~~~~
git clone https://github.com/mariocsgit/GAE-iojs.git
~~~~

To run the app locally in the dev appserver:

~~~~
gcloud preview app run app.yaml
~~~~

To deploy the app in production:

~~~~
gcloud --project YOUR-PROJECT-ID preview app deploy app.yaml --set-default
~~~~

## Application layout

The script for the application is `app.js`.

## Modifications

The changes to use io.js instead of the node.js were:

1. To update the app.yaml file to use [custom runtimes][4] instead of the node.js runtime provided by Google.
2. To modify the [Dockerfile][3] to ADD io.js and make it the entry point for the container.

## Documentation

Further info about [custom runtimes][4].

## Improvements

A way to update a ENV variable of the Dockerfile as a result of RUN would allow the Dockerfile to ADD the latest stable version of io.js.

[1]: https://iojs.org/
[2]: https://github.com/GoogleCloudPlatform/nodejs-getting-started/tree/1-hello-world
[3]: https://docs.docker.com/reference/builder/
[4]: https://cloud.google.com/appengine/docs/managed-vms/custom-runtimes
[5]: https://cloud.google.com/appengine/docs/managed-vms/
[6]: https://github.com/GoogleCloudPlatform/
