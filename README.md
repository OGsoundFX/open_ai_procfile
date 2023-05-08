# Procfile.dev setup

1- Create the 2 files:
- `touch Procfile.dev`
- `touch bin/dev`

2- Add the following script in the `Procfile.dev` file:
`web: bin/rails server -p 3000`

3- Add the following script in the `bin/dev` file:
```
#!/usr/bin/env sh

if ! gem list foreman -i --silent; then
  echo "Installing foreman..."
  gem install foreman
fi

exec foreman start -f Procfile.dev "$@"
```

4- **(optional I think)** add the following gem in your `gemfile`:
```
gem 'foreman', '~> 0.87.2'
```
And run `bundle install`

5- Run the 3 foloowing commands in the terminal:
- `chmod +x bin/dev`
- `export PATH="$PATH:$(pwd)/bin"`
- `source ~/.zshrc`

6- You are ready to add some more commands in your `Procfile.dev` and use the `dev` command in the terminal to run them all 🎉
