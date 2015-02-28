
ADMiniPanelMeter seconds, minutes, hours;

void setup()
{
  size(450,150);
  smooth();
  
  seconds = new ADMiniPanelMeter(300,0,150,"seconds");
  seconds.setScale(0,59);

  minutes = new ADMiniPanelMeter(150,0,150,"minutes");
  minutes.setScale(0,59);

  hours = new ADMiniPanelMeter(0,0,150,"hours");
  hours.setScale(0,23);
 
  
}


void draw()
{
  background(255);

  seconds.update();
  minutes.update();
  hours.update();
  
  seconds.setValue(((float )10/(float )6)*second());
  seconds.setTitle("second: "+second());
  
  minutes.setValue(((float )10/(float )6)*minute());
  minutes.setTitle("minute: "+minute());

  hours.setValue(((float )100/(float )24)*hour());
  hours.setTitle("hour: "+hour());
  
}



