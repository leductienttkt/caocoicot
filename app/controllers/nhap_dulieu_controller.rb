class NhapDulieuController < ApplicationController

  def create

    base_uri = "https://khotablet-abf64.firebaseio.com/"
    key = "qnGgiQepwP9jJLxZkeyFWloJ3dRqVTRTUuUXXbAL"
    firebase = Firebase::Client.new(base_uri, key)
    firebase.delete("KHO/KHU-B")
   spreadsheet = open_spreadsheet(params[:file])
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)  
      bin = row[1].gsub(".", "-")
      firebase.update("KHO/KHU-B/#{bin}", {row[0] => row[2].to_i})
    end

    kho = firebase.get("KHO")

    kho.body.each do |khu, bins|
      bins.each do |bin_id, bin|
        id = bin_id.gsub(".", "-")
        klt = 0
        bin.each do |item, qty|
            klt += qty
        end
        firebase.update("KHO/KHU-B/#{id}", {"KLT" => klt})
      end
    end


    flash[:success] = "Them thanh cong!"
    redirect_to root_path


  end

  private
  def open_spreadsheet file
    case File.extname file.original_filename
    when ".xls"
      Roo::Excel.new file.path, file_warning: :ignore
    when ".xlsx"
      Roo::Excelx.new file.path, file_warning: :ignore
    when ".csv" 
      Roo::CSV.new file.path,  file_warning: :ignore
    else
      nil
    end
  end
end
