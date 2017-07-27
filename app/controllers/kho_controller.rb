class KhoController < ApplicationController

  def index

  end

  def show
    base_uri = "https://khotablet-abf64.firebaseio.com/"
    key = "qnGgiQepwP9jJLxZkeyFWloJ3dRqVTRTUuUXXbAL"
    firebase = Firebase::Client.new(base_uri, key)
    response = firebase.get("KHO")
    @kho = response.body
    file_name = I18n.l(DateTime.now, format: :long).to_s
    respond_to do |format|
      format.xlsx do
        headers["Content-Disposition"] = "attachment; filename=\"#{file_name}.xlsx\""
        headers["Content-Type"] ||= Settings.xlsx
      end
    end

  end
end
