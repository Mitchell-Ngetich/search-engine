set -o errexit

bundle install
./bin/rails assets:precompile
./bin/rails assets:clean
# bundle exec rails assets:precompile
# bundle exec rails assets:clean
# bundle exec rails db:migrate