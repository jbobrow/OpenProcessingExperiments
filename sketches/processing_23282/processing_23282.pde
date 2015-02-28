
import proxml.*;
XMLInOut xmlio;
String documentUrl = "http://www.yr.no/place/United_Kingdom/Scotland/Edinburgh/forecast.xml";
proxml.XMLElement docroot;
PFont font; 
ArrayList container;
String locName;
String locCountry;
String sunUp;
String sunDown;
int loc;

/* Please refer to Yr.no websites for information about use of XML weatherdata */
/* Ola Loevholm, March 2011. Please feel free to use my part of the code. That is CC attribution share-alike */





void setup(){
  xmlio = new XMLInOut(this);
  container = new ArrayList();
  println("loading file from: "+documentUrl);
  docroot = xmlio.loadElementFrom(documentUrl);
  size(575,250);
  font =loadFont("Cambria-15.vlw"); 
  loc = 0;

  
  
  
  
  /*
  LOADS DATA INTO CLASSES AND GLOBALS FROM XML FILE
  */

  proxml.XMLElement location = docroot.firstChild();
  proxml.XMLElement sun = docroot.getChild(4);
  proxml.XMLElement forecast = docroot.getChild(5);
  
  proxml.XMLElement name = location.getChild(0);
  proxml.XMLElement country = location.getChild(2);
  locName = name.firstChild().getElement();
  locCountry = country.firstChild().getElement();
  
  sunUp = sun.getAttribute("rise");
  sunDown = sun.getAttribute("set");
  
  
  proxml.XMLElement tabular = forecast.firstChild();
  for(int i = 0; i < tabular.countChildren(); i++){
     proxml.XMLElement time = tabular.getChild(i);
    String beginTime = time.getAttribute("from");
    String endTime = time.getAttribute("to");
    String genWeather = time.getChild(0).getAttribute("name");
    String percipation = time.getChild(1).getAttribute("value");
    String windDirection = time.getChild(2).getAttribute("name");
    String windSpeed = time.getChild(3).getAttribute("name");
    String temperatureValue = time.getChild(4).getAttribute("value");
    String temperatureUnit = time.getChild(4).getAttribute("unit");
    String pressureValue = time.getChild(5).getAttribute("value");
    String pressureUnit = time.getChild(5).getAttribute("unit");
    
   Forecast fc = new Forecast(beginTime, endTime, genWeather, percipation, windDirection, windSpeed, temperatureValue, temperatureUnit, pressureValue, pressureUnit);
     container.add(fc);
    // println("Object added to the Container");
     
    
    }
    
    
  
}


void draw(){
  background(33);
  textFont(font);
 text(locName+ ", "+locCountry,20,20);
 text("Forecast from yr.no ",375,20);
  text("OL/ProjectCrastination 2011 ",375,40);

 text("SunRise: "+sunUp,20,40);
 text("SunSet: "+sunDown,20,60);
 
if(container.size() > 0){
 Forecast f = (Forecast) container.get(loc);
 

text("This forecast is  between: "+f.beginTime+" and: "+f.endTime,20,100);
text("The weather is going to be "+f.genWeather,20,120);
if(int(f.percipation) > 0){
  text("It will be raining: "+f.percipation,20,140);
} else {
  text("It will not be raining",20,140);
}
text("The wind wind will blow from "+f.windDirection+" with a speed of type: "+f.windSpeed,20,160);
text("The temperature will be "+f.temperatureValue+" degrees "+f.temperatureUnit,20,180);

 text("Please use buttons LEFT and RIGHT to navigate ",20,220);
 
}
 

 
 
 
 
 
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
       if(loc<container.size()-1){
      loc++;
       }
    } else if (keyCode == RIGHT) {
      if(loc > 0){
      loc--;
      }
    } 
  }

}
  
  
 
 
 


  
  
  
  


class Forecast{
  String beginTime;
  String endTime;
  String genWeather;
  String percipation;
  String windDirection;
  String windSpeed;
  String temperatureValue;
  String temperatureUnit;
  String pressureValue;
  String pressureUnit;
  
  Forecast(String beginTime, String endTime, String genWeather, String percipation, String windDirection, String windSpeed, String temperatureValue, String temperatureUnit, String pressureValue, String pressureUnit){
    
    this.beginTime = beginTime;
    this.endTime = endTime;
    this.genWeather = genWeather;
    this.percipation = percipation;
    this.windDirection = windDirection;
    this.windSpeed = windSpeed;
    this.temperatureValue = temperatureValue;
    this.temperatureUnit = temperatureUnit;
    this.pressureValue = pressureValue;
    this.pressureUnit = pressureUnit;
  }
}
  
  
  
  



