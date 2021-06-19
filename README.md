# README

## Installing the `pg` gem
If you don’t want to `brew install` the entire PostgreSQL app (because you're using
Docker or something), you can just install the PG developer library.

`brew install libpq`

Now, you can install the `pg` gem by pointing to where the development headers.

`gem install pg -- --with-opt-dir="/usr/local/opt/libpq"` (on an M1 Mac)

Or better yet, use `bundle config` to save this config locally in the project.

`bundle config --local build.pg --with-opt-dir="/opt/homebrew/opt/libpq"`

Now you can `brew install pg` successfully. See 
[this post](https://michaelrigart.be/install-pg-ruby-gem-without-postgresql/)
for more details