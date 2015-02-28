
String[] cities = { //Declare, Create, Asign array in one go!
  "2442047", "2459115", "2379574", "2367105"
};

WeatherReport wp;

void setup() {
  size(400, 100);
  smooth();
  wp = new WeatherReport(); 
  wp.updateReport("2442047");
}
void draw() {
  background(255);
  fill(0);
  text(wp.getTemp() + "°F in "+ wp.getCity() +" today: " + wp.getCondition(), 20, 20);
  text("Wind is " + wp.getWindSpeed() + "mph", 20, 50);
}
void keyPressed(){
  if(key=='1' || key=='2' || key=='3' || key=='4'){
     int val = int(key) - 49; //Weird huh? Check this out: http://www.asciitable.com/
     println(val);            //For the array, we need an int, not a char. A simple caste wont work.
     wp.updateReport(cities[val]); 
  }
  println(key);
}

/*******************
 * Weather Report Class
 * Defines a WeatherReport object with one method:
 * Update the report with a different city, based on it woeid.
 * The 
 *******************/

class WeatherReport {
  String url = "http://weather.yahooapis.com/forecastrss?w=";
  String city;
  int windspeed;
  int temp;
  String condition; 
  XMLElement report;

  WeatherReport() { 
  }

  void updateReport(String woeid) {
    report = getXMLObject(url+woeid);
    city = report.getChild("channel/yweather:location").getString("city");
    windspeed = report.getChild("channel/yweather:wind").getInt("speed");

    XMLElement kid = report.getChild("channel/item");
    temp = kid.getChild("yweather:condition").getInt("temp");
    condition = kid.getChild("yweather:condition").getString("text");
  }

  String getCity() {
    return city;
  }
  int getWindSpeed() {
    return windspeed;
  }
  String getCondition() {
    return condition;
  }
  int getTemp() {
    return temp;
  }
}
/*************************/
//This needs to be outside of the class, to avoid some code conflicts. Don't worry too much 
//about why for now.

XMLElement getXMLObject(String url){
  return new XMLElement(this, url);
}


