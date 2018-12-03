require 'selenium-webdriver'

class SeleniumQaToolsForm

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
    @practice_form_url = 'http://toolsqa.com/automation-practice-form/'
  end

  def visit_practice_form
    @chrome_driver.get(@practice_form_url)
  end

end
