# Documentation Terraform - Provisionnement d'une Infrastructure AWS

Cette documentation explique ce que fait le code Terraform fourni, et décrit les étapes à suivre pour provisionner les ressources AWS. Le code crée un **Virtual Private Cloud (VPC)** et un **sous-réseau (subnet)** dans la région `eu-west-3` d'AWS (Paris).

## Étapes pour provisionner les ressources

### 1. Installation de Terraform

Avant de commencer, assurez-vous que Terraform est installé sur votre machine. Si ce n'est pas le cas, téléchargez et installez Terraform depuis le site officiel : [terraform.io](https://www.terraform.io/downloads.html).

### 2. Création du fichier de configuration Terraform

Créez un fichier nommé `main.tf` et copiez-y le code suivant :

```hcl
# Configuration du fournisseur AWS
provider "aws" {
  region     = "eu-west-3"
  access_key = "XXX"      # Remplacez par votre clé d'accès AWS
  secret_key = "XXXXX"     # Remplacez par votre clé secrète AWS
}

# Création d'un VPC
resource "aws_vpc" "dev-env-vpc" {
  cidr_block = "10.0.0.0/16"
}

# Création d'un sous-réseau dans le VPC
resource "aws_subnet" "dev-env-subnet-1" {
  vpc_id             = aws_vpc.dev-env-vpc.id
  cidr_block         = "10.0.10.0/24"
  availability_zone  = "eu-west-3a"
}
