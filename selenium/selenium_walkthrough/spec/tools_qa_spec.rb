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
    @years_of_experience = rand(7).ceil
    @driver_class.click_YoE_radio(@years_of_experience)
    @date = '15/05/1555'
    @driver_class.input_date_field(@date)
    @driver_class.click_manual_tester_radio
    @driver_class.click_automation_tester_radio
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

  it "should not change after a click on another sex radio button" do
    expect(@driver_class.female_radio_selected?).to be false
  end

  it "should accept a click on a Years of Experience radio button, but not affect others" do
    i = 1
    while i == 1
      if i = @years_of_experience
        expect(@driver_class.yoe_radio_selected?(@years_of_experience)).to be true
      else
        expect(@driver_class.yoe_radio_selected?(@years_of_experience)).to be false
      end
      i = i + 1
    end
  end

  it "should accept a date input correctly" do
    expect(@driver_class.get_date_field_value).to eq @date
  end

  it "should accept a click on both profession radio buttons" do
    expect(@driver_class.manual_tester_radio_selected?).to be true
    expect(@driver_class.automation_tester_radio_selected?).to be true
  end

  it "should correctly untick a box after clicking a second time" do
    @driver_class.click_automation_tester_radio
    expect(@driver_class.manual_tester_radio_selected?).to be true
    expect(@driver_class.automation_tester_radio_selected?).to be false
  end

end
