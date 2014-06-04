module Formatter
  def convert_entry_to_number entry
    if entry =~ /B$/
      entry.chop.to_f*1_000_000_000
    elsif entry =~ /M$/
      entry.chop.to_f*1_000_000
    else
      entry
    end
  end
end