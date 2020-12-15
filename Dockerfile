FROM ruby:2.2-onbuild

EXPOSE 4567
RUN chmod +x ./gui.rb
CMD ["./gui.rb"]
