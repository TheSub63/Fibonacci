FROM ruby:2.2-onbuild

EXPOSE 4567

CMD ["./fibonacci.rb"]
