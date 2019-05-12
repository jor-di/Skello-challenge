WPM = 200; # 200 words per minute reading (source : https://www.irisreading.com/what-is-the-average-reading-speed/)

def rounded_five(number)
  (number * 2).round(-1) / 2
end

def lecture_time(string)
  wps = 200.fdiv(60)
  rounded_five((string.split(' ').count / wps))
end
