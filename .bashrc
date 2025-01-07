#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export MANPAGER='nvim +Man!'
export PATH=/home/arch/.local/share/gem/ruby/3.3.0/bin:$PATH
export SSL_CERT_FILE=/etc/pki/tls/cert.pem
