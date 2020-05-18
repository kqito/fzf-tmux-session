# fzf-tmux-session
Quickly search and attach a tmux session with fzf.


## Demo
![Demo](https://user-images.githubusercontent.com/29191111/82120236-9efab680-97bf-11ea-8724-239b51fdb12d.gif)


## Dependencies
- `fzf-tmux` command is required. If you don't have it installed, you can install along with [fzf](https://github.com/junegunn/fzf)


## Installation
### with [tpm](https://github.com/tmux-plugins/tpm)
Add the following to your `.tmux.conf`.

```
set -g @plugin 'kqito/fzf-tmux-session'
```

Then reload `.tmux.conf` and install it with `prefix + I`.

Now you can use `fzf-tmux-session`.

### Manual
Clone this repository from github with the following command.

```
$ git clone https://github.com/kqito/fzf-tmux-session
```

Then add following code to your `.tmux.conf`

```
run-shell path/to/fzf-tmux-session
```

And reload `.tmux.conf`.

Now you can use `fzf-tmux-session`.


## Key binding
The default key binding is `prefix + a`.

You can change with like following code.

```
set -g @fzf-tmux-session C-a
```


### License
[MIT](https://github.com/kqito/fzf-tmux-session/blob/master/LICENSE)
