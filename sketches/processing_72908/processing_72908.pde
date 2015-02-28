
import controlP5.*;

ControlP5 cp5;

//////////Temperature//////////

int Green_Point_Temperature = 100;
int Northern_Subs_Temperature = 100;
int Southern_Subs_Temperature = 100;
int Camps_Bay_Temperature = 100;
int Sea_Point_Temperature = 100;


//////////Wind//////////

int Green_Point_Wind = 100;
int Northern_Subs_Wind = 100;
int Southern_Subs_Wind = 100;
int Camps_Bay_Wind = 100;
int Sea_Point_Wind = 100;


//////////Cloud_Cover//////////

int Green_Point_Cloud_Cover = 100;
int Northern_Subs_Cloud_Cover = 100;
int Southern_Subs_Cloud_Cover = 100;
int Camps_Bay_Cloud_Cover = 100;
int Sea_Point_Cloud_Cover = 100;


//////////Setup//////////

//Loaded Fonts
//OfficinaSansStd-Bold-8
//OfficinaSansStd-Book-10
//OfficinaSansStd-Book-9
//OfficinaSerifStd-Bold-14

void setup() {
  size(1440, 750);
  
  cp5 = new ControlP5(this);
  
  PFont p = createFont("OfficinaSansStd",9);
//  PFont h = createFont("OfficinaSerifStd",14);
  
  cp5.setControlFont(p);

  
cp5.setColorValue(0xff000000);
cp5.setColorForeground(0xffAFC0CC);
cp5.setColorBackground(0xff849099);
cp5.setColorLabel(0xff000000);
cp5.setColorActive(0xffAFC0CC);
  
//////////Temperature//////////
  
    cp5.addSlider("Green_Point_Temperature")
     .setPosition(1000,100)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
  
    cp5.addSlider("Northern_Subs_Temperature")
     .setPosition(1000,130)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
    cp5.addSlider("Southern_Subs_Temperature")
     .setPosition(1000,160)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
    cp5.addSlider("Camps_Bay_Temperature")
     .setPosition(1000,190)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
     cp5.addSlider("Sea_Point_Temperature")
     .setPosition(1000,220)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
     
//////////Wind//////////
  
    cp5.addSlider("Green_Point_Wind")
     .setPosition(1000,300)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
  
    cp5.addSlider("Northern_Subs_Wind")
     .setPosition(1000,330)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
    cp5.addSlider("Southern_Subs_Wind")
     .setPosition(1000,360)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
    cp5.addSlider("Camps_Bay_Wind")
     .setPosition(1000,390)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
     cp5.addSlider("Sea_Point_Wind")
     .setPosition(1000,420)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
     
//////////Cloud_Cover//////////
  
    cp5.addSlider("Green_Point_Cloud_Cover")
     .setPosition(1000,500)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
  
    cp5.addSlider("Northern_Subs_Cloud_Cover")
     .setPosition(1000,530)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
    cp5.addSlider("Southern_Subs_Cloud_Cover")
     .setPosition(1000,560)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
    cp5.addSlider("Camps_Bay_Cloud_Cover")
     .setPosition(1000,590)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;
     
     cp5.addSlider("Sea_Point_Cloud_Cover")
     .setPosition(1000,620)
     .setSize(200,20)
     .setRange(0,20)
     .setValue(0)
     ;

}

