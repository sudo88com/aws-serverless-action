# sudo88com/serverless-action

[![serverless-action](https://img.shields.io/github/v/release/sudo88com/serverless-action.svg)](https://github.com/sudo88com/serverless-action/releases)

Deploy serverless applications seamlessly using GitHub Actions with `serverless-action`. This GitHub Action enables you to deploy your serverless framework projects directly from your GitHub workflows, automating the deployment process for your serverless applications.

## Usage

To use this action, add the following step to your GitHub workflow YAML file. Ensure that you configure your AWS credentials and Serverless framework settings before deploying.

```yaml
    - name: Deploy Serverless Application
      uses: sudo88com/serverless-action@v1 # Check https://github.com/sudo88com/serverless-action/releases for latest release
      with:
        aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws_region: 'ap-south-1'
        serverless_config_file: 'serverless.yml'
```

## Setting Up AWS Credentials

To deploy serverless applications, you need to set up AWS credentials. Follow these steps to configure your AWS credentials as GitHub secrets:

1. Create IAM User:

- Go to the AWS IAM Console.

- Click on "Users" and then "Add user".

- Enter a user name and select "Programmatic access".

- Attach the "AdministratorAccess" policy (or a more restrictive policy if preferred).

- Complete the process and save the access key ID and secret access key.

2. Add Secrets to GitHub:

- Go to your GitHub repository.

- Click on "Settings" and then "Secrets".

- Add new repository secrets for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` with the values from the IAM user creation process.

## Example Workflow

```yaml
name: Deploy Serverless Application

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Install Serverless Framework
        run: npm install -g serverless

      - name: Deploy Serverless Application
        uses: sudo88com/serverless-action@v1
        with:
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_region: 'us-east-1'
          serverless_config_file: 'serverless.yml'
```

## License

This project is licensed under the [MIT License](./LICENSE).
