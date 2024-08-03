ji #!/bin/sh

# Replace placeholders in config.template.txt with environment variables and create config.txt
sed -e "s/YOUR_BOT_TOKEN/$DC_TOKEN/" -e "s/YOUR_OWNER_ID/$DC_OWNER_ID/" /app/config.template.txt > /app/config.txt