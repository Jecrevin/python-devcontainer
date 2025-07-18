# set up mirror for uv/uvx
CONFIG_FILE=~/.config/uv/uv.toml
CONFIG_DIR=$(dirname "$CONFIG_FILE")

mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
    touch "$CONFIG_FILE"
fi

cat >> $CONFIG_FILE << EOF
[[index]]
url = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/"
default = true
EOF

# set up bash autocompletion for uv/uvx
echo 'eval "$(uv generate-shell-completion bash)"' >> ~/.bashrc
echo 'eval "$(uvx --generate-shell-completion bash)"' >> ~/.bashrc

# set up uv link mode using copy in dev container to avoid warning
echo 'export UV_LINK_MODE=copy' >> ~/.bashrc
