## dots

## no ansible or gnu-stow

dotfiles are dear to me, i am conditioned to the way i do things i.e.
muscle memory, so i cannot let go the linux way of doing things, hence
dotfiles. i have tried gnu-stow and ansible before this but none of
them worked, the stow symlinks broke too often and ansible is too
rigid, for example you cannot pass sudo passwords to commands like
yay. and ansible takes a lot more time than any other solution, you
have to create a role, create tasks in it, test those tasks.

## simplicity

so i ditched [ansible dotfiles] in favour of simplicity. i don't
want to be a dotfiles engineer, i just want to be able to use my
configuration as quickly as possible on as many platforms as possible.
if you were using ansible, you had to create one file for each
platform per role and there was a lot of duplication, or you put in a
lot of time to pick out common parts and organize things nicely...

[ansible dotfiles]: https://github.com/printfdebugging/dotfiles.git

## dots

it's simple. just one shell script `./package` which creates bash functions.
single file configs are stored in this repository without any folder
hierarchy (`eg. dunst, flameshot, gtk, gdb, zsh...`) and multi file configs
exist as git repositories which are cloned by the package script (eg.
[dwm], [st], [dmenu], [bin]..). please take a look into the script, it's
really simple.

[dwm]: https://github.com/printfdebugging/dwm
[st]: https://github.com/printfdebugging/st
[dmenu]: https://github.com/printfdebugging/dmenu
[bin]: https://github.com/printfdebugging/bin

if i want to add brew packages, i can just create another function
`install_brew_packages` and just by adding one simple function, apple
is supported.

## polishing dotfiles all day isn't my job

this is important. i can't count the number of hours i spent polishing
my dotfiles to perfection, it wasn't all a waste, i learnt a lot as i
was very involved in the process. but i think i could have invested some
of that time somewhere else like in learning opengl, or maybe reading the
c standard. i will try to keep the changes here to a minimum.
