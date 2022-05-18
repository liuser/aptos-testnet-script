export WORKSPACE=testnet


#清理之前安装信息
rm -rf /opt/aptos*
rm -rf  ~/$WORKSPACE

cd /opt 
wget https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v0.1.1/aptos-cli-0.1.1-Ubuntu-x86_64.zip
unzip aptos-cli-0.1.1-Ubuntu-x86_64.zip
chmod +x aptos

ln -s /opt/aptos /usr/bin/


mkdir ~/$WORKSPACE
cd ~/$WORKSPACE

wget https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/aptos-node/docker-compose.yaml
wget https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/aptos-node/validator.yaml
wget https://raw.githubusercontent.com/aptos-labs/aptos-core/main/docker/compose/aptos-node/fullnode.yaml

aptos genesis generate-keys --output-dir ~/$WORKSPACE


aptos genesis set-validator-configuration \
    --keys-dir ~/$WORKSPACE --local-repository-dir ~/$WORKSPACE \
    --username aptosbot \
    --validator-host 35.232.235.205:6180 \
    --full-node-host 34.135.169.144:6182

    aptos genesis set-validator-configuration \
    --keys-dir ~/$WORKSPACE --local-repository-dir ~/$WORKSPACE \
    --username aptosbot \
    --validator-host bot.aptosdev.com:6180 \
    --full-node-host fn.bot.aptosdev.com:6182


# 
#使用默认root key
#echo     "---\nroot_key: \"0x5243ca72b0766d9e9cbf2debf6153443b01a1e0e6d086c7ea206eaf6f8043956\"\nusers:\n  - aptosbot\nchain_id: 23" > ~/$WORKSPACE/layout.yaml
#使用自己生成的key
aptos key generate --output-file ~/$WORKSPACE/key
_x="0x"
_y=$(cat ~/$WORKSPACE/key.pub)
echo       "---\nroot_key: \"$_x$_y\"\nusers:\n  - aptosbot\nchain_id: 23" > ~/$WORKSPACE/layout.yaml





wget https://github.com/aptos-labs/aptos-core/releases/download/aptos-framework-v0.1.0/framework.zip
unzip framework.zip




 aptos genesis generate-genesis --local-repository-dir ~/$WORKSPACE --output-dir ~/$WORKSPACE



 apt install docker.io


 sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
#后台运行
docker-compose up  -d 

cat  ~/$WORKSPACE/aptosbot.yaml







