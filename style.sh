# Primary prompt string
# user, pwd, git branch
if command -v gbranchf &> /dev/null
then
  export PS1="\[\033[00m\]\u 👾\[\033[00m\] \$(gbranchf) \[\033[35m\]\w\n\[\033[00m\] 🍄 "
else
  export PS1="\[\033[00m\]\u 👾 \[\033[35m\]\w\n\[\033[00m\] 🍄 "
fi

# Secondary prompt string
# Used for multi-line commands
export PS2="   ✨ "
