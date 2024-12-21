# Terraform-Jenkins-Projects


# Terraform and Jenkins Installation on Windows 11

This guide provides a step-by-step process to install and set up Terraform and Jenkins on Windows 11. By the end, you'll have a functional setup for infrastructure automation and continuous integration.

---

## Prerequisites

Ensure your system meets the following requirements:

1. **Windows 11**: Latest updates installed.
2. **Admin Access**: Required to install software.
3. **PowerShell**: Installed by default on Windows 11.

---

## Step 1: Install Terraform

<img src="https://github.com/user-attachments/assets/4ebf3728-fa38-4480-8229-427e1c2ab856
" alt="Terraform Logo" width="300">

### 1. Download Terraform

1. Visit the [Terraform Download Page](https://www.terraform.io/downloads.html).
2. Select the version for **Windows** and download the ZIP file.

### 2. Extract and Add Terraform to PATH

1. Extract the downloaded ZIP file.
2. Move the `terraform.exe` file to a permanent directory, e.g., `C:\Terraform`.
3. Add the directory to the system PATH:
   - Press `Win + R`, type `sysdm.cpl`, and hit Enter.
   - Navigate to the **Advanced** tab and click **Environment Variables**.
   - Under **System Variables**, select `Path` and click **Edit**.
   - Add the directory where `terraform.exe` is located (e.g., `C:\Terraform`).
4. Verify the installation by opening a new PowerShell terminal and running:
   ```powershell
   terraform --version
   ```

---

## Step 2: Install Jenkins

<img src="https://www.jenkins.io/images/logos/jenkins/jenkins.png" alt="Jenkins Logo" width="300">

### 1. Download Jenkins

1. Visit the [Jenkins Download Page](https://www.jenkins.io/download/).
2. Select the **Windows** installer (`.msi`) and download it.

### 2. Install Jenkins

1. Run the downloaded `.msi` installer.
2. Follow the installation wizard:
   - Accept the license agreement.
   - Choose the installation path (default: `C:\Program Files (x86)\Jenkins`).
   - Jenkins will install as a Windows service.
3. Note the initial admin password, which is stored in:
   ```
   C:\Program Files (x86)\Jenkins\secrets\initialAdminPassword
   ```

### 3. Start Jenkins

1. Open a browser and navigate to:
   ```
   http://localhost:8080
   ```
2. Enter the initial admin password from the file above.
3. Follow the setup wizard to:
   - Install suggested plugins.
   - Create an admin user.
   - Complete the setup.

---

## Step 3: Configure Jenkins with Terraform

### 1. Install Terraform Plugin in Jenkins

1. In the Jenkins dashboard, navigate to:
   ```
   Manage Jenkins > Manage Plugins > Available
   ```
2. Search for `Terraform` and install the plugin.
3. Restart Jenkins if prompted.

### 2. Configure Global Tool for Terraform

1. Navigate to:
   ```
   Manage Jenkins > Global Tool Configuration
   ```
2. Scroll to the **Terraform** section.
3. Add a new Terraform installation:
   - Name: `Terraform-CLI`.
   - Leave the installation path blank (it will use the system PATH).

### 3. Create a Jenkins Pipeline with Terraform

1. Create a new pipeline job in Jenkins.
2. Define the pipeline script to use Terraform commands, for example:
   ```groovy
   pipeline {
       agent any
       stages {
           stage('Init') {
               steps {
                   sh 'terraform init'
               }
           }
           stage('Plan') {
               steps {
                   sh 'terraform plan'
               }
           }
           stage('Apply') {
               steps {
                   sh 'terraform apply -auto-approve'
               }
           }
       }
   }
   ```

---

## Step 4: Verify the Setup

1. Test Terraform:
   ```powershell
   terraform --version
   ```
2. Access Jenkins:
   ```
   http://localhost:8080
   ```
3. Run a sample Terraform job in Jenkins to verify functionality.

---

## Additional Notes

- **Terraform**: Ensure your scripts and configurations are in the project directory before running.
- **Jenkins**: Secure Jenkins by enabling SSL and configuring user roles.
- **AWS Integration**: For Terraform to manage AWS resources, configure AWS CLI and IAM credentials in Jenkins.

---

## Resources

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [Jenkins Documentation](https://www.jenkins.io/doc/)
- [Windows Environment Variable Guide](https://docs.microsoft.com/en-us/windows/win32/procthread/environment-variables)

Happy Automating!


