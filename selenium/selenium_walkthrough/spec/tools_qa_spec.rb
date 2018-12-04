describe 'testing the demoqa registration page' do

  before(:all) do
    @driver_class = SeleniumQaToolsForm.new
    @driver_class.visit_practice_form
    @wait = Selenium::WebDriver::Wait.new(timeout: 10)
    @fname = 'Mon'
    @lname = 'Goose'
    @driver_class.input_firstname_field(@fname)
    @driver_class.input_lastname_field(@lname)
    @driver_class.click_male_radio
    @years_of_experience_position = rand(7).floor
    @driver_class.click_YoE_radio(@years_of_experience_position)
    @date = '15/05/1555'
    @driver_class.input_date_field(@date)
    @driver_class.click_manual_tester_radio
    @driver_class.click_automation_tester_radio
    @driver_class.click_QTP_radio
    @driver_class.click_Selenium_IDE_radio
    @driver_class.click_Selenium_webdriver_radio
    @continent_index = rand(7).floor
    @driver_class.select_continents_option(@continent_index)
    @selenium_command_index = rand(4).floor
    @driver_class.select_selenium_command_option(@selenium_command_index)
  end

  it "should land on the registration page" do
    expect(@driver_class.current_url).to eq 'http://toolsqa.com/automation-practice-form/'
  end

  it "should accept a firstname" do
    expect(@driver_class.get_firstname_field_value).to eq @fname
  end

  it "should accept a lastname" do
    expect(@driver_class.get_lastname_field_value).to eq @lname
  end

  it "should accept a click on a sex radio button" do
    expect(@driver_class.male_radio_selected?).to be true
  end

  it "should not change a different sex radio button after a click" do
    expect(@driver_class.female_radio_selected?).to be false
  end

  it "should accept a click on a Years of Experience radio button, but not affect others" do
    i = 0
    while i <=6
      if i == @years_of_experience_position
        expect(@driver_class.yoe_radio_selected?(i)).to be true
      else
        expect(@driver_class.yoe_radio_selected?(i)).to be false
      end
      i += 1
    end
  end

  it "should accept a second click on a Years of Experience radio button, to change selection" do
    # reset the years of experience to new random choice

    @yoe_2 = @years_of_experience_position
    while @yoe_2 == @years_of_experience_position
      @yoe_2 = rand(7).ceil
    end
    @driver_class.click_YoE_radio(@yoe_2)

    j = 0
    while j <= 6
      if j == @yoe_2
        expect(@driver_class.yoe_radio_selected?(j)).to be true
      else
        expect(@driver_class.yoe_radio_selected?(j)).to be false
      end
      j = j + 1
    end
  end

  it "should accept a date input correctly" do
    expect(@driver_class.get_date_field_value).to eq @date
  end

  it "should accept a click on both profession radio buttons" do
    expect(@driver_class.manual_tester_radio_selected?).to be true
    expect(@driver_class.automation_tester_radio_selected?).to be true
  end

  it "should correctly untick a box after clicking a profession a second time" do
    @driver_class.click_automation_tester_radio
    expect(@driver_class.manual_tester_radio_selected?).to be true
    expect(@driver_class.automation_tester_radio_selected?).to be false
  end

  it "should accept a click on an automation tool radio button" do
    expect(@driver_class.qtp_radio_selected?).to be true
    expect(@driver_class.selenium_IDE_radio_selected?).to be true
    expect(@driver_class.selenium_webdriver_radio_selected?).to be true
  end

  it "should correctly untick a box after clicking an automation tool a second time" do
    @driver_class.click_Selenium_webdriver_radio
    expect(@driver_class.qtp_radio_selected?).to be true
    expect(@driver_class.selenium_IDE_radio_selected?).to be true
    expect(@driver_class.selenium_webdriver_radio_selected?).to be false
  end

  it "should correctly chose a continent from the dropdown menu" do
    k=0
    while k<=6
      puts k
      if k == @continent_index
        expect(@driver_class.chosen_continent_selected?(k)).to be true
      else
        expect(@driver_class.chosen_continent_selected?(k)).to be false
      end
      k = k + 1
    end
  end

  it "should correctly chose a selenium command from it's menu" do
    l=0
    while l<=6
      if l == @selenium_command_index
        expect(@driver_class.chosen_selenium_command_selected?(l)).to be true
      else
        expect(@driver_class.chosen_selenium_command_selected?(l)).to be false
      end
      l = l + 1
    end
  end
end
