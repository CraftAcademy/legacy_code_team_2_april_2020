Chromedriver.set_version '2.33'

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Option.new(
    args: %w( headless disable-popup-blocking diable-infobars)
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end
Capybara.javascript_driver = :selenium