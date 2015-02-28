
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//Temp Conversion
//URL -> http://padova.webs.com/TempConversionSite.html

//This program, as you would expect, converts temperatures from Farenheit to Celsius.
//PS: Sorry about the lack of annotations.
//PPS: I've had no end of trouble getting the loadStrings function to work. Sorry.

float[] givenF = float(loadStrings("temps.txt"));

void setup()
{
  for (int i = 0; i < givenF.length; i++)
  {
  print(givenF[i]+" degrees Farenheit is "+FtoCConversion(givenF[i])+" degrees Celsius.");
  }
}

float FtoCConversion(float FIn)
{
  float COut = 5*(FIn-32)/9;
  return COut;
}

float CtoFConversion(float CIn)
{
  float FOut = 9*CIn/5+32;
  return FOut;
}
