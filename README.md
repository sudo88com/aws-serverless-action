# sudo88com/aws-serverless-action

[![aws-serverless-action](https://img.shields.io/github/v/release/sudo88com/aws-serverless-action.svg)](https://github.com/sudo88com/aws-serverless-action/releases)

Deploy serverless applications seamlessly using GitHub Actions with `aws-serverless-action`. This GitHub Action enables you to deploy your serverless framework projects directly from your GitHub workflows, automating the deployment process for your serverless applications.

## Usage

To use this action, add the following step to your GitHub workflow YAML file. Ensure that you configure your AWS credentials and Serverless framework settings before deploying.

```yaml
      - name: Deploy Serverless Application
        uses: sudo88com/serverless-action@v1 # Check https://github.com/sudo88com/serverless-action/releases for latest release
        with:
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_region: ${{ secrets.AWS_DEFAULT_REGION }}
          serverless_access_key: ${{ secrets.SERVERLESS_ACCESS_KEY }}
          serverless_file: 'serverless.yml'
```

## Setting Up AWS Credentials

To deploy serverless applications, you need to set up AWS credentials. Follow these steps to configure your AWS credentials as GitHub secrets:

1. Create IAM User:

- Go to the [AWS IAM Console](https://console.aws.amazon.com/iam/).

- Click on "Users" and then "Add user".

- Enter a user name and select "Programmatic access".

- Attach the "AdministratorAccess" policy (or a more restrictive policy if preferred).

- Complete the process and save the access key ID and secret access key.

2. Add Secrets to GitHub:

- Go to your [GitHub repository](https://github.com/).

- Click on "Settings" and then "Secrets".

- Add new repository secrets for `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_DEFAULT_REGION` with the values from the IAM user creation process.

## Setting Up Serverless Access Key

1. Get Serverless Access Key:

- Log in to the [Serverless Dashboard](https://dashboard.serverless.com/).

- Go to your organization and select the app you want to deploy.

- Navigate to the "Providers" section.

- Click on "Add Provider" and follow the prompts to create a new access key.

2. Add Serverless Access Key to GitHub:

- Go to your [GitHub repository](https://github.com/).

- Click on "Settings" and then "Secrets".

- Add a new repository secret for `SERVERLESS_ACCESS_KEY` with the value from the Serverless Dashboard.

## License

This project is licensed under the [MIT License](./LICENSE).
