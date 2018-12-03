require 'selenium-webdriver'

class SeleniumQaToolsForm

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
    @firstname_field_name = 'firstname'
    @lastname_field_name = 'lastname'
    @sex_male_id = 'sex-0'
    @sex_female_id = 'sex-1'
    @date_field_id = 'datepicker'
    @practice_form_url = 'http://toolsqa.com/automation-practice-form/'
    @manual_tester_id = 'profession-0'
    @automation_tester_id = 'profession-1'
    @QTP_id = 'tool-0'
    @Selenium_IDE_id = 'tool-1'
    @Selenium_webdriver_id = 'tool-2'

  end

  def visit_practice_form
    @chrome_driver.get(@practice_form_url)
  end

  def input_firstname_field(text)
    @chrome_driver.find_element(:name, @firstname_field_name).send_keys(text)
  end

  def input_lastname_field(text)
    @chrome_driver.find_element(:name, @lastname_field_name).send_keys(text)
  end

  def click_male_radio
    @chrome_driver.find_element(:id, @sex_male_id).click
  end

  def click_female_radio
    @chrome_driver.find_element(:id, @sex_female_id).click
  end

  def get_firstname_field_value
    @chrome_driver.find_element(:name, @firstname_field_name).attribute('value')
  end

  def get_lastname_field_value
    @chrome_driver.find_element(:name, @lastname_field_name).attribute('value')
  end

  def male_radio_selected?
    @chrome_driver.find_element(:id, @sex_male_id).selected?
  end

  def female_radio_selected?
    @chrome_driver.find_element(:id, @sex_female_id).selected?
  end

  def click_YoE_radio (years)
    @chrome_driver.find_element(:id,"exp-#{years}").click
  end

  def yoe_radio_selected? (years)
    @chrome_driver.find_element(:id,"exp-#{years}").selected?
  end

  def input_date_field (date)
    @chrome_driver.find_element(:id, @date_field_id).send_keys(date)
  end

  def get_date_field_value
    @chrome_driver.find_element(:id, @date_field_id).attribute('value')
  end

  def current_url
    @chrome_driver.current_url
  end

  def click_manual_tester_radio
    @chrome_driver.find_element(:id, @manual_tester_id).click
  end

  def manual_tester_radio_selected?
    @chrome_driver.find_element(:id, @manual_tester_id).selected?
  end

  def click_automation_tester_radio
    @chrome_driver.find_element(:id, @automation_tester_id).click
  end

  def automation_tester_radio_selected?
    @chrome_driver.find_element(:id, @automation_tester_id).selected?
  end

  def click_QTP_radio
    @chrome_driver.find_element(:id, @QTP_id).click
  end

  def qtp_radio_selected?
    @chrome_driver.find_element(:id, @QTP_id).selected?
  end

  def click_Selenium_IDE_radio
    @chrome_driver.find_element(:id, @Selenium_IDE_id).click
  end

  def selenium_IDE_radio_selected?
    @chrome_driver.find_element(:id, @Selenium_IDE_id).selected?
  end

  def click_Selenium_webdriver_radio
    @chrome_driver.find_element(:id, @Selenium_webdriver_id).click
  end

  def selenium_webdriver_radio_selected?
    @chrome_driver.find_element(:id, @Selenium_webdriver_id).selected?
  end
end

# test = SeleniumQaToolsForm.new
# test.visit_practice_form
# test.input_firstname_field('Mon')
# test.input_lastname_field('Goose')
# test.click_male_radio
# sleep 5
