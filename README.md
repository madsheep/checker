# Checker

A collection of modules for which every is designed to check syntax in files to be commited via git.

## Usage

### Install
Checker is available in rubygems, so you just need to do:
```
gem install checker
```
If you are using bundler, you can add it to your project via `Gemfile` file (best to put it under `:development` group):
```ruby
group :development do
  gem 'checker'
end
```

After installing the gem please follow [Git hook](#git-hook) section for further details.

### Git hook

To check your source code every time you commit, add to your `.git/hooks/pre-commit` line:

``` bash
#!/bin/bash
checker
```
or...

If you want every commit be appended with checker approved icon instead (:checkered_flag:) add to your `.git/hooks/prepare-commit-msg` following:

``` bash
#!/bin/bash
checker

if [ $? == 1 ]; then
  exit 1
fi

echo ":checkered_flag:" >> $1
```

Don't forget to make the hooks files executable:

``` bash
chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/prepare-commit-msg
```

Now checker will halt the commit if it finds problem with source code:

```
Checking app/models/user.rb...
FAIL app/models/user.rb found occurence of 'binding.pry'
46:binding.pry
```

### Advanced usage

To check only specific filetypes on commit, use `git config` :

``` bash
git config checker.check 'ruby, haml, coffeescript'
```

Available options are: ruby, haml, pry, coffeescript, sass
