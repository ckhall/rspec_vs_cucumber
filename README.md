RSpec vs Cucumber
=================

Why use cucumber when you get all you need from rspec?
------------------------------------------------------

Basically I'm just trying to show that we can get the same otucome from using rspec and capybara
that we can from using cucumber without all the syntactic sugar.  From a developer point of view,
I don't see a need to have this non-programmer abstraction, gherkin, which requires more code with
no extra benefits.

For the rspec integration tests, it just uses straight capybara and rspec matchers.  Nothing else.

For the cucumber tests, we have to first write our feature using the Given/When/And/Then syntax.
Then we have to create our steps based off these feature steps, which are nothing more than wrappers
around capybara methods.  In addition, we must write path helpers so our path names are pretty in the
features.  None of this is necessarily difficult, it's just more work that doesn't get us anywhere.

Also, even for these 3 simple tests, the rspec test ran about 25% faster than their cucumber
counterparts.  Doesn't seem like much for such a small example, but when your cukes take ~ 10 minutes
to run, 25% starts to look a heck of a lot better.

In the end, we have to ask ourselves, what problem is cucumber solving for us.  We have tools that can
already do what it does, without all the extra layers.  I'm advocating simplifying our codebase by
getting rid of the things we don't need.

So take a look at the spec and the feature and compare.


```
git clone ...
bundle install --path=vendor/bundle
bundle exec rspec
bundle exec cucumber
```
