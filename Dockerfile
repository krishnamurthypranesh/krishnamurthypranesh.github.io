FROM ruby:3.0

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /site

# Install bundler
RUN gem install bundler -v 2.2.33

# Expose port 4000 for Jekyll server
EXPOSE 4000

# Default command - use bundle exec to respect Gemfile
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload", "--force_polling"]
