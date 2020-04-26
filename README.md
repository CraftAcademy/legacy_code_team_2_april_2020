# Legacy code challenge Team 2 april 2020

---

## By Steve, Jenny, Erik, Theodora

#### Scrum board:

[User stories](https://www.pivotaltracker.com/n/projects/2445151)

#### Deployed app:

[Craft Academy Mailboxer](https://leagacycodeteam2april2020.herokuapp.com/)

### The code:

Application to send and recieve messages to registered users.

Devise API for signing up and logging in.

### Dependencies:

- Ruby on Rails
- RSpec is needed to run the feature and unit tests available in ./spec/.
- Mailboxer
- FactoryBot
- Devise
- Warden helper
- Postgres DB
- Pry
- Capybara
- ShouldaMatcher

### Setup:<br>

Fork repo.
Run bundler to install gems.

### Instructions:<br>

Start the application by

```irb
rails start
```

### Acknowledgement:<br>

Built the structure out of this code base:
https://github.com/CraftAcademy/legacy_code_team_2_april_2020 <br>
Also used the Craft Academy course material and Devise and Rails documentation.

### Updates/improvment plans:

- Add unit tests for the conversation
- Coveralls for test coverage
- Semaphore setup needs to be fixed
- Instead of requiring subject and message, user should be asked to confirm sending incomplete message

#### Licensed under MIT license
