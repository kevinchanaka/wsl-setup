## wsl-setup

Setup steps for my WSL development environment


### Environment setup

1. Install WSL Ubuntu environment using distrod (https://github.com/nullpo-head/wsl-distrod)  
2. Install base packages (curl, git, wget, docker etc.)
```
sudo apt update
sudo apt install -y curl git wget telnet dnsutils
```
3. Install brew package manager - https://brew.sh/
4. Install rclone sync client via brew
```
brew install rclone
```

### Rclone configuration

1. Clone this repository into the root of your home directory
2. Perform initial, interactive configuration of rclone which generates an `rclone.conf` file (sample is within this repository)
```
rclone config
```
3. Run the `sync.sh` script to sync files to/from OneDrive
```
# Dry run
./sync.sh upload
./sync.sh download

# Perform actual sync, may lead to data loss, test with dry run first
./sync.sh upload -y
./sync.sh download -y
```