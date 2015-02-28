
//last update : 4/30/2014

import controlP5.*;
PImage [] images = new PImage[5]; //sets array to have five images
ControlP5 cp5;
DropdownList d1, d2;
int index;
int choice;
int cnt = 0;
XML theXML;
PFont font;
String[] cityList = {
  "chicago", "hammond", "new buffalo", "Waukegan"
};

CityData[] myData = new CityData[cityList.length];

void setup() {
  size(500, 300, P3D);
  font = loadFont("Arial-Black-25.vlw");
  images[0] = loadImage("waukegan.jpg");
  images[1] = loadImage("chicago.jpg");
  images[2] = loadImage("burn.jpg");
  images[3] = loadImage("new.jpg");
  images[4] = loadImage("ham.jpg");
  
  for (int i = 0; i < cityList.length; i++) {
    myData[i] = new CityData(cityList[i]);
    myData[i].loadData();
  }
  cp5 = new ControlP5(this);
  // create a DropdownList
  d1 = cp5.addDropdownList("myList-d1")
    .setPosition(50, 50)
      .setSize(200, 200)
        ;
  customize(d1); // customize the first list
  
  
}
void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.captionLabel().set("Choose City");
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  for (int i=0;i<cityList.length;i++) {
    ddl.addItem(cityList[i], i);
  }
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}
 
void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
    choice = int(theEvent.getGroup().getValue());
    // myData[i].display();
  } 
  else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}

void draw() {
  
  background(128);
  image( images[index], 0, 0 );
  fill(255);
  textFont(font, 18);
  myData[choice].display();
 
 
 
}
void keyPressed() {
  index = int( random( images.length) );
}

class CityData {
  String cityId;
  String cityName;
  String name;
  XML theData;
  String rise;
  String set;
  String max;
  String min;
  String windValue;
  String windName;
  String directionCode;
  String directionValue;

  CityData(String _name) {
    name = _name;
  }

  void loadData() {
    theData = loadXML("http://api.openweathermap.org/data/2.5/weather?q=" + name + "&units=imperial&mode=xml&APPID=bed1a80e2ab440b233105ae38fd0ca16");
  }
  public String getCityId() {
    XML[] city = theData.getChildren("city");
    for (int i = 0; i < city.length; i++) {
      cityId = city[i].getString("id");
    }
    return cityId;
  }

  public String getCityName() {
    XML[] city = theData.getChildren("city");
    for (int i = 0; i < city.length; i++) {
      cityName = city[i].getString("name");
    }
    return cityName;
  }
  public String getSunRise() {
    XML[] sunRise = theData.getChildren("city/sun");
    for (int i = 0; i < sunRise.length; i++) {
      rise = sunRise[i].getString("rise");
    }
    return rise;
  }
  public String getSunSet() {
    XML[] sunSet = theData.getChildren("city/sun");
    for (int i = 0; i < sunSet.length; i++) {
      set = sunSet[i].getString("set");
    }
    return set;
  }
  public String getTempMax() {
    XML[] temp = theData.getChildren("temperature");
    for (int i = 0; i < temp.length; i++) {
      max = temp[i].getString("max");
    }
    return max;
  }
  public String getTempMin() {
    XML[] temp = theData.getChildren("temperature");
    for (int i = 0; i < temp.length; i++) {
      min = temp[i].getString("min");
    }
    return min;
  }


  public String getWindSpeedValue() {
    XML[] windspeed = theData.getChildren("wind/speed");
    for (int i = 0; i < windspeed.length; i++) {
      windValue = windspeed[i].getString("value");
    }
    return windValue;
  }

  public String getWindSpeedName() {
    XML[] windspeed = theData.getChildren("wind/speed");
    for (int i = 0; i < windspeed.length; i++) {
      windName = windspeed[i].getString("name");
    }
    return windName;
  }

  public String getWindDirection() {
    XML[] wind = theData.getChildren("wind/direction");
    for (int i = 0; i < wind.length; i++) {
      directionCode = wind[i].getString("code");
    }
    return directionCode;
  }
   public String getWindValue() {
    XML[] wind = theData.getChildren("wind/direction");
    for (int i = 0; i < wind.length; i++) {
      directionValue = wind[i].getString("value");
    }
    return directionValue;
  }
  
  void display(){
    
  text (getCityName(),50,100);
  text ("High:" + "  " +getTempMax() ,50,120);
  text ("Low:" + "  "+getTempMin() ,50,140);
  text (getWindSpeedName(), 50,160);
  text ("Winds:" + "  " +getWindDirection(), 50,180);
  
  }
}



