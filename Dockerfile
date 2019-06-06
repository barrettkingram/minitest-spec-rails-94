FROM ruby:2.6.3
RUN gem install rails -v 6.0.0.beta2                                                              && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash -                                       && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -				  && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update										  && \
    apt-get install -y nodejs yarn vim

RUN rails _6.0.0.beta2_ new parallel-testing                                                      && \
    cd parallel-testing                                                                           && \
    bin/rails g scaffold User username:string							  && \
    echo "gem 'minitest-spec-rails'" >> Gemfile							  && \
    bundle											  && \
    bin/rails db:migrate

WORKDIR /parallel-testing
COPY users_controller_test.rb test/controllers/users_controller_test.rb
