FROM ruby:2.2-onbuild

EXPOSE 4567
RUN chmod +x ./fibonacci.rb
CMD ["./fibonacci.rb"]
