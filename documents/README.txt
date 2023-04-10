
gnatmake main.adb
gnatprove -P main.gpr --proof=progressive
  both succeed
--------------------------------------------
This file contains a very simple toy boiler program,
That prevents the boiler from exceeds the critical temperature and exceed the water level from the critical amount of water the boiler can take.
What it does is it asks for the temperature and amount of water , and if it exceeds a critical temperature, it sets the temperature to 212 and it lower than the regular temperature it sets it to 40. Also to fill the boiler it only takes values 500 to 1000, its critical value is 1500. 

The runnable file is called main
which makes use of the package 
Boiler



This file uses the wrapper class for IO
as_io_wrapper.ads and
as_io_wrapper.adb

which makes use of spark ada files
spark.ads
spark-text_io.ads
spark-text_io.adb
spark-text_io-integer_io.ads
spark-text_io-integer_io.adb







