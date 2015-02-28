



import processing.xml.*;  



ArrayList particles;


//String url;

int fc= frameCount;
int refresher=second();
boolean checkKDKB=true;
String station = "KDPA";
int n;
int counter;
String[] stationlist;
String stationlisted = "KDPA";
String url;


String splittemp4;
String splittemp5;
String splittemp6;



boolean nn;
boolean an;
int stationlength;
String stations = "KDKB KDPA KSPI KJFK KALB KSAC KSVN KLAX KLOU PHNL KRDU";
////////Images

PImage ground;

PImage mostlycloudy;
PImage snow;
PImage cloudimg;
PImage skyimg;
PImage partlycloudy;
PImage overcast;
PImage precip;
PImage thermometer;
PImage rain;
Float windspeedx;
int temperature;

Scene overcastscene;
Scene fairscene;
Scene partlycloudyscene;
Scene afewcloudsscene;
Scene mostlycloudyscene;















///////


String Time;
String currenttime;
String Last;
Float timebrightness;
Float timevalue2;
Float timeoffset;
Float timetint;
Float timevalue3;
Float skytintmap;


String[] descriptions;
String[] titles;
String a;
String q; //the value of where the string starts
String cc;
String temp;   //Temp reader
String Ftemp; //Temp finder
String dd;    //  The br> cuts off the html
String splittemp;
////////winds
String NW="Northwest";
String N="North";
String NE="Northeast";
String E="East";
String SE="Southeast";
String S="South";
String SW="Southwest";
String W="West";
String variable="Variable";
String Calm= "Calm.";

  PImage chickentemp;
  PImage chicken;


PImage southwestimg;
PImage northeastimg;
PImage northwestimg;
PImage southeastimg;
PImage eastimg;
PImage westimg;
PImage southimg;
PImage northimg;




/////////weather
String FAIR="Fair";
String PARTLY="Partly";
String OVERCAST="Overcast";
String FOGMIST="Fog/Mist";
String SNOW="Snow";
/*
Blowing Snow
Freezing Fog
Mostly Cloudy with Haze
Mostly Cloudy and Breezy
Clear
Fair with Haze
Clear with Haze
Fair and Breezy
Clear and Breezy
A Few Clouds with Haze
A Few Clouds and Breezy
Partly Cloudy with Haze
Partly Cloudy and Breezy
Overcast with Haze
Overcast and Breezy
 Freezing Fog
 Shallow Fog
 Partial Fog
 Patches of Fog
 Fog in Vicinity
 Freezing Fog in Vicinity
 Shallow Fog in Vicinity
 Partial Fog in Vicinity
 Patches of Fog in Vicinity
 Showers in Vicinity Fog
 Light Freezing Fog
 Heavy Freezing Fog
Smoke
Freezing Rain 
Freezing Drizzle
Light Freezing Rain
Light Freezing Drizzle
Heavy Freezing Rain
Heavy Freezing Drizzle 
Freezing Rain in Vicinity
Freezing Drizzle in Vicinity
Ice Pellets
Light Ice Pellets | Heavy Ice Pellets | Ice Pellets in Vicinity | Showers Ice Pellets | Thunderstorm Ice Pellets | Ice Crystals | Hail | Small Hail/Snow Pellets | Light Small Hail/Snow Pellets | Heavy small Hail/Snow Pellets | Showers Hail | Hail Showers
Freezing Rain Snow | Light Freezing Rain Snow | Heavy Freezing Rain Snow | Freezing Drizzle Snow | Light Freezing Drizzle Snow | Heavy Freezing Drizzle Snow | Snow Freezing Rain | Light Snow Freezing Rain | Heavy Snow Freezing Rain | Snow Freezing Drizzle | Light Snow Freezing Drizzle | Heavy Snow Freezing Drizzle
Rain Ice Pellets | Light Rain Ice Pellets | Heavy Rain Ice Pellets | Drizzle Ice Pellets | Light Drizzle Ice Pellets | Heavy Drizzle Ice Pellets | Ice Pellets Rain | Light Ice Pellets Rain | Heavy Ice Pellets Rain | Ice Pellets Drizzle | Light Ice Pellets Drizzle | Heavy Ice Pellets Drizzle
Rain Snow | Light Rain Snow | Heavy Rain Snow | Snow Rain | Light Snow Rain | Heavy Snow Rain | Drizzle Snow | Light Drizzle Snow | Heavy Drizzle Snow | Snow Drizzle | Light Snow Drizzle | Heavy Drizzle Snow
Rain Showers | Light Rain Showers | Light Rain and Breezy | Heavy Rain Showers | Rain Showers in Vicinity | Light Showers Rain | Heavy Showers Rain | Showers Rain | Showers Rain in Vicinity | Rain Showers Fog/Mist | Light Rain Showers Fog/Mist | Heavy Rain Showers Fog/Mist | Rain Showers in Vicinity Fog/Mist | Light Showers Rain Fog/Mist | Heavy Showers Rain Fog/Mist | Showers Rain Fog/Mist | Showers Rain in Vicinity Fog/Mist
Thunderstorm | Thunderstorm Rain | Light Thunderstorm Rain | Heavy Thunderstorm Rain | Thunderstorm Rain Fog/Mist | Light Thunderstorm Rain Fog/Mist | Heavy Thunderstorm Rain Fog and Windy | Heavy Thunderstorm Rain Fog/Mist | Thunderstorm Showers in Vicinity | Light Thunderstorm Rain Haze | Heavy Thunderstorm Rain Haze | Thunderstorm Fog | Light Thunderstorm Rain Fog | Heavy Thunderstorm Rain Fog | Thunderstorm Light Rain | Thunderstorm Heavy Rain | Thunderstorm Rain Fog/Mist | Thunderstorm Light Rain Fog/Mist | Thunderstorm Heavy Rain Fog/Mist | Thunderstorm in Vicinity Fog/Mist | Thunderstorm Showers in Vicinity | Thunderstorm in Vicinity Haze | Thunderstorm Haze in Vicinity | Thunderstorm Light Rain Haze | Thunderstorm Heavy Rain Haze | Thunderstorm Fog | Thunderstorm Light Rain Fog | Thunderstorm Heavy Rain Fog | Thunderstorm Hail | Light Thunderstorm Rain Hail | Heavy Thunderstorm Rain Hail | Thunderstorm Rain Hail Fog/Mist | Light Thunderstorm Rain Hail Fog/Mist | Heavy Thunderstorm Rain Hail Fog/Hail | Thunderstorm Showers in Vicinity Hail | Light Thunderstorm Rain Hail Haze | Heavy Thunderstorm Rain Hail Haze | Thunderstorm Hail Fog | Light Thunderstorm Rain Hail Fog | Heavy Thunderstorm Rain Hail Fog | Thunderstorm Light Rain Hail | Thunderstorm Heavy Rain Hail | Thunderstorm Rain Hail Fog/Mist | Thunderstorm Light Rain Hail Fog/Mist | Thunderstorm Heavy Rain Hail Fog/Mist | Thunderstorm in Vicinity Hail | Thunderstorm in Vicinity Hail Haze | Thunderstorm Haze in Vicinity Hail | Thunderstorm Light Rain Hail Haze | Thunderstorm Heavy Rain Hail Haze | Thunderstorm Hail Fog | Thunderstorm Light Rain Hail Fog | Thunderstorm Heavy Rain Hail Fog | Thunderstorm Small Hail/Snow Pellets | Thunderstorm Rain Small Hail/Snow Pellets | Light Thunderstorm Rain Small Hail/Snow Pellets | Heavy Thunderstorm Rain Small Hail/Snow Pellets
Snow | Light Snow | Heavy Snow | Snow Showers | Light Snow Showers | Heavy Snow Showers | Showers Snow | Light Showers Snow | Heavy Showers Snow | Snow Fog/Mist | Light Snow Fog/Mist | Heavy Snow Fog/Mist | Snow Showers Fog/Mist | Light Snow Showers Fog/Mist | Heavy Snow Showers Fog/Mist | Showers Snow Fog/Mist | Light Showers Snow Fog/Mist | Heavy Showers Snow Fog/Mist | Snow Fog | Light Snow Fog | Heavy Snow Fog | Snow Showers Fog | Light Snow Showers Fog | Heavy Snow Showers Fog | Showers Snow Fog | Light Showers Snow Fog | Heavy Showers Snow Fog | Showers in Vicinity Snow | Snow Showers in Vicinity | Snow Showers in Vicinity Fog/Mist | Snow Showers in Vicinity Fog | Low Drifting Snow | Blowing Snow | Snow Low Drifting Snow | Snow Blowing Snow | Light Snow Low Drifting Snow | Light Snow Blowing Snow | Light Snow Blowing Snow Fog/Mist | Heavy Snow Low Drifting Snow | Heavy Snow Blowing Snow | Thunderstorm Snow | Light Thunderstorm Snow | Heavy Thunderstorm Snow | Snow Grains | Light Snow Grains | Heavy Snow Grains | Heavy Blowing Snow | Blowing Snow in Vicinity
Windy | Breezy | Fair and Windy | A Few Clouds and Windy | Partly Cloudy and Windy | Mostly Cloudy and Windy | Overcast and Windy
Showers in Vicinity | Showers in Vicinity Fog/Mist | Showers in Vicinity Fog | Showers in Vicinity Haze
Freezing Rain Rain | Light Freezing Rain Rain | Heavy Freezing Rain Rain | Rain Freezing Rain | Light Rain Freezing Rain | Heavy Rain Freezing Rain | Freezing Drizzle Rain | Light Freezing Drizzle Rain | Heavy Freezing Drizzle Rain | Rain Freezing Drizzle | Light Rain Freezing Drizzle | Heavy Rain Freezing Drizzle
Thunderstorm in Vicinity | Thunderstorm in Vicinity Fog | Thunderstorm in Vicinity Haze
Light Rain | Drizzle | Light Drizzle | Heavy Drizzle | Light Rain Fog/Mist | Drizzle Fog/Mist | Light Drizzle Fog/Mist | Heavy Drizzle Fog/Mist | Light Rain Fog | Drizzle Fog | Light Drizzle Fog | Heavy Drizzle Fog
Rain | Heavy Rain | Rain Fog/Mist | Heavy Rain Fog/Mist | Rain Fog | Heavy Rain Fog
Funnel Cloud | Funnel Cloud in Vicinity | Tornado/Water Spout
Dust | Low Drifting Dust | Blowing Dust | Sand | Blowing Sand | Low Drifting Sand | Dust/Sand Whirls | Dust/Sand Whirls in Vicinity | Dust Storm | Heavy Dust Storm | Dust Storm in Vicinity | Sand Storm | Heavy Sand Storm | Sand Storm in Vicinity
Haze
*/

String LIGHTSNOW= "LightSnow";
String LIGHTRAIN= "LightRain";
String LIGHTDRIZZLE= "LightDrizzle";
String MOSTLYCLOUDY= "MostlyCloudy";
String AFEWCLOUDS= "AFew";



///////////////////////////////////////////////////


String calmcheck = "Calm";
Float windpower2;
Float windpower;
int wx;
boolean w;
boolean ww;
boolean www;
/////////////////////////////////////////////////////////////////////////////SETUP
//////////////////////////////////////////////////////////////////////////////
void setup(){
  textAlign(CENTER, BOTTOM);
  size(450,400);
  colorMode(HSB, 100);
  frameRate(30);
  noStroke();
  smooth();
  
  
  

  
  
  

skyimg = loadImage("SkyColor.png");
ground = loadImage("Ground.png");
cloudimg = loadImage("Cloud_nice.png");
partlycloudy = loadImage("partly_cloudy.png");
overcast = loadImage("Overcast.png");
mostlycloudy = loadImage("mostlycloudy.png");

snow = loadImage("snow.png");
rain = loadImage("rain.png");

thermometer = loadImage("Temperature.png");



fairscene = new Scene( skyimg, cloudimg);
partlycloudyscene = new Scene( skyimg, partlycloudy);
overcastscene = new Scene(skyimg, overcast);  
afewcloudsscene = new Scene( skyimg, partlycloudy);
mostlycloudyscene = new Scene(skyimg, mostlycloudy);

particles = new ArrayList();




////////////////
////////////////





 

/////////////////















 
  }

void draw() {
  

  background(100);


  
  ////////////////////////////////////////////////////CHANGE STATIONS

boolean an = true;
boolean nn= true;
String[] stationlist = split(stations, ' ');
String stationlisted = new String(stationlist[n]);
int stationlength =  int(stationlist.length);






String url= "http://w1.weather.gov/xml/current_obs/" + stationlisted + ".rss" ;

//////////


fc= frameCount;
refresher=second();
  
  

 


XMLElement rss = new XMLElement (this, url);
//descriptions  
XMLElement[] descriptionXMLElements = rss.getChildren("channel/item/description");  
descriptions = new String[descriptionXMLElements.length];
for (int i = 0; i < descriptionXMLElements.length; i++) {  
    String description = descriptionXMLElements[i].getContent();  
    
    descriptions[i] = description;
}

//titles

XMLElement[] titleXMLElements = rss.getChildren("channel/item/title");  
titles = new String[titleXMLElements.length];
for (int i = 0; i < titleXMLElements.length; i++) {  
    String title = titleXMLElements[i].getContent();  
    //println(title);  
    titles[i] = title;
}




////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
/////////////////////////////////////TITLE AND TEMPERATURE AND LOCATION
String location = titles[0];
textSize(12);

 

/////////////////////////////////////////////// SKY
String FAIR= "Fair";
String[] sky = split(location, ' ');
sky[0] = trim(sky[0]);

if ("Fair".equals(sky[0]) == true){


fairscene.display();

}else{
 
///////////////////////////////////////---------------------------

////////////////////////////////////////-----------------
}
////////////////////////////////////////////////
String PARTLY= "Partly";

if (PARTLY.equals(sky[0]) == true){

  partlycloudyscene.display();
  
}else{
 

}
////////////////////////////////////////////

String OVERCAST= "Overcast";

if (OVERCAST.equals(sky[0]) == true){
overcastscene.display();
}else{
   

}

//////////////////////////////////////////////////

String FOGMIST= "Fog/Mist";

if (FOGMIST.equals(sky[0]) == true){
  
  //println("Fog/Mist");
}else{
   

}
////////////////////////////////////////////////////

String SNOW= "Snow";

if (SNOW.equals(sky[0]) == true){


  overcastscene.display();
  
  
  
  ///////////////========================

    particles.add (new Particle(snow, 10.0) );
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = (Particle)particles.get(i);
    p.update(); 
    if (p.position.y + p.diameter > height)
      particles.remove(i);
    else
        p.render();
  }
/////////////////////================
  
  
}else{
  

}







///////////////////////////////////////////////TwoWorders
/////////////////////////////////////////LIGHT SNOW
String skytwo = sky[0] + sky[1];

if (LIGHTSNOW.equals(skytwo) == true){
    overcastscene.display();
  
  
  
  ///////////////========================

    particles.add (new Particle(snow, 10.0) );
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = (Particle)particles.get(i);
    p.update(); 
    if (p.position.y + p.diameter > height)
      particles.remove(i);
    else
        p.render();
  }
/////////////////////================
  
  

}




if (LIGHTRAIN.equals(skytwo) == true){
    overcastscene.display();
  
  
  
  ///////////////========================

    particles.add (new Particle(rain, 10.0) );
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = (Particle)particles.get(i);
    p.update(); 
    if (p.position.y + p.diameter > height)
      particles.remove(i);
    else
        p.render();
  }
/////////////////////================
  
  

}



if (LIGHTDRIZZLE.equals(skytwo) == true){
    overcastscene.display();
  
  
  
  ///////////////========================

    particles.add (new Particle(rain, 10.0) );
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = (Particle)particles.get(i);
    p.update(); 
    if (p.position.y + p.diameter > height)
      particles.remove(i);
    else
        p.render();
  }
/////////////////////================
  
  

}








//////////////////////////////////////////MostlyCloudy
if (MOSTLYCLOUDY.equals(skytwo) == true){
 mostlycloudyscene.display();
}else{
  //println(skytwo); 

}

/////////////////////////////////////////////AFewClouds

if (AFEWCLOUDS.equals(skytwo) == true){ 
  afewcloudsscene.display();
}else{
  //println(skytwo); 

}
/////////////////////////////////////////////////////////THree Worders
String skythree = sky[0] + sky[1] +sky[2];




////////////////////////////////////////////TEMPERATURE


 // for (int i = 0; i < descriptions.length; i++) {
 //  float y = (i+1) * 15;

////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////// CUT OFF THE STUFF BEFOR BR /> in the string 
String dd = "br />";
String temp = descriptions[0];
int k = temp.indexOf(dd);





String Ftemp = descriptions[0].substring(k+5);


/////////////FINDING THE TIME


int tf = descriptions[0].indexOf("Last");
String time = descriptions[0].substring(tf+16);
//println(time);



/////////////////////////FINDING DARKNESS OF THE DAY
String[] timevalue = splitTokens(time,": ");



Float timevalue2 = Float.parseFloat(timevalue[3]+timevalue[4]);
Float timeoffset= 1259.0;


if (("pm".equals(timevalue[6])) && (timevalue2<1200)|| ("pm".equals(timevalue[7]) == true) && (timevalue2<1200) || ("pm".equals(timevalue[5]) == true) && (timevalue2<1200)) {
timevalue3= timeoffset-timevalue2;

} else {
timevalue3 = timevalue2;

}

textSize(12);
fill(0,0,0);
text("Last updated "+timevalue[3]+":"+timevalue[4],width-100,height);




skytintmap = map(timevalue3, 100,1259,30,100);

tint(skytintmap);



///////////////////////////WIND PATTERN CHECKS

          southwestimg = loadImage("SouthWestwind.png");
          eastimg = loadImage("Eastwind.png");
          westimg = loadImage("Westwind.png");
          northimg = loadImage("Northwind.png");
          southimg = loadImage("Southwind.png");
          southeastimg = loadImage("SouthEastwind.png");
          northwestimg = loadImage("NorthWestwind.png");
          northeastimg = loadImage("NorthEastwind.png");
          

          
          
          String[] splittemp = split(Ftemp, ' ');
          splittemp[2] = trim(splittemp[2]);
          splittemp[4] = trim(splittemp[4]);
          
          
          
          //NorthWest
          if ( NW.equals(splittemp[2]) == true){
           image(northwestimg,-50,-75);
            //println("NORTHWEST");
          }else{
              
          }
          
          if ( NW.equals(splittemp[4]) == true){
            image(southeastimg,-50,-75);
            //println("NORTHWEST");
          }else{
              
          }
          
          //NORTH
          if ( N.equals(splittemp[2]) == true){
            image(northimg,-50,-75);
          }else{
            
             
          }
          
          if ( N.equals(splittemp[4]) == true){
            image(southimg,-50,-75);
          }else{
            
             
          }
          
          
          //NORTHEAST
          if ( NE.equals(splittemp[2]) == true){
            image(northeastimg,-50,-75);
          }else{
            
             
          }
          
          if ( NE.equals(splittemp[4]) == true){
            image(southwestimg,-50,-75);
          }else{
            
             
          }
          
  
          
          //East
          if ( E.equals(splittemp[2]) == true){
             image(eastimg,-50,-75);
          }
          
          
          if ( E.equals(splittemp[4]) == true){
            image(westimg,-50,-75);
          }
          
          
          //Southeast
          if ( SE.equals(splittemp[2]) == true){
            image(southeastimg,-50,-75);
          }else{
            
             
          }
          
          if ( SE.equals(splittemp[4]) == true){
            image(northwestimg,-50,-75);
          }else{
            
             
          }
          
          
          
          //South
          if ( S.equals(splittemp[2]) == true){
            image(southimg,-50,-75);
          }else{
            
             
          }
          
          if ( S.equals(splittemp[4]) == true){
           image(northimg,-50,-75);
          }else{
            
             
          }
          
          //SouthWest
          if ( SW.equals(splittemp[2]) == true){
          image(southwestimg,-50,-75);
            
          }else{
            
             
          }
          
          if ( SW.equals(splittemp[4]) == true){
            image(southwestimg,-50,-75);
          }else{
            
             
          }
          
          
          
          //WEST
          if ( W.equals(splittemp[2]) == true){
             image(westimg,-50,-75);
          }else{
            
             
          }
          
          if ( W.equals(splittemp[4]) == true){
           image(eastimg,-50,-75);
          }else{
            
             
          }
          ///////////////calm
          
           if ( Calm.equals(splittemp[2]) == true){
            
             text("Calm winds",width/2, height-40);
          }else{
            
             
          }
          
          if ( Calm.equals(splittemp[4]) == true){
          text("Calm Winds",width/2, height-40);
          }else{
            
             
          }
          /////////////////VARiABLEWINDS
    ///////////////calm
          
           if ( variable.equals(splittemp[2]) == true){
          
             text("Calm winds",width/2, height-40);
          }else{
            
              
          }
          
          if ( variable.equals(splittemp[4]) == true){
          text("Variable Winds",width/2, height-40);
          }else{
            

          }          
    


///////////////////////////////// Wind Speed Check and Convert to Float


//////////////trimmers
splittemp4 = trim(splittemp[4]);
splittemp5 = trim(splittemp[5]);
splittemp6 = trim(splittemp[6]);




/////////////////////////////////////Catch the bad string, look for int
if( splittemp[7].equals("mb") == false){
try {
  textSize(32);
fill(0, 50,60);
    Float windpower = Float.valueOf(splittemp6).floatValue();
    w = false;
    wx=6;
    textAlign(RIGHT);
    String windpowertxt = str(windpower);
text(windpowertxt+"MPH",width-10,height/1.5);
  } catch (NumberFormatException e) {
    w = true;
  }
  }
 
  
 
if (w==true && splittemp5.equals("mb") == false){  
try {
  
    Float windpower = Float.valueOf(splittemp4).floatValue();
     textSize(32);
fill(0, 50, 60);
    ww= false;
    wx=4;
    textAlign(RIGHT);
    String windpowertxt = str(windpower);
text(windpowertxt+"MPH",width-10,height/1.5);
  } catch (NumberFormatException f) {
    ww = true;
    
  }
}

  
if (ww==true && splittemp6.equals("mb") == false){  
try {
    Float windpower = Float.valueOf(splittemp5).floatValue();
     textSize(32);
fill(0, 50, 60);
    www=false;
    wx=5;
    textAlign(RIGHT);
    String windpowertxt = str(windpower);
text(windpowertxt+"MPH",width-10,height/1.5);
  } catch (NumberFormatException f) {
    www=true;
    
  }
}







//println(titles[0]);
//////////////////FIND TEMPERATURE OF STUFF---------------------========-------

String ff = "F at";
String temptotal = titles[0];
int finder = temptotal.indexOf(ff);
int temptotalff;

String locationtxt = titles[0].substring(finder+5);
String totalf = titles[0].substring(finder-3);
String[] temptotalf = split(totalf, ' ');


temptotalff= int(temptotalf[0]);


////////////////FINDING CALM





 if ( calmcheck.equals(splittemp[2]) == true){
           windpower=0.0;
           
        }


  


//////////////////////////////////////////////////////////////////

 if (keyPressed) {
    if ((key == 's') && (n < stationlength) && (an==true)) {
     nn= true;
     n++;}else{
       nn=false;
  
     
    }
    
    if ((key == 'a') && (an==true)) {
     nn= true;
     n--;}else{
       nn=false;
  
     
    }
 }


  

 
 


 if (n == stationlength){
  n = 0 ;
  }

 if (n == -1){
  n = stationlength-1 ;
  }


stationlisted = trim(stationlisted);








//float windpower = Float.valueOf(splittemp[6]).floatValue();
//float windpower2 = Float.valueof(splittemp[4].floatValue();













textAlign(CENTER, BOTTOM);

fill(50,80,100);
textSize(16);
fill(60,100,40);
text(locationtxt, width/2, 80);

textSize(12);

//text(Ftemp, 50, height-100); 

int temptotalffx = temptotalff;
float colortemp = map(temptotalffx,-20,120,30,100);


image(thermometer,50,height/1.75,45,100);
rectMode(CENTER);
fill(colortemp,100,100);
rect(70,height-temptotalff/4-85,5,temptotalff/2);
textSize(20);
text(temptotalff +"f",100,height-110);




















}






///////////////////////
class Particle {
  PVector position, velocity;
  float diameter;
  PImage snowimg;
  PImage snow2;
  Float winds;
  Float windtemp;

  Particle(PImage snowimg, Float winds) {
    PVector pos = new PVector(random(0,width), 0);
    position = pos;
    diameter = random(10, 50);
    PVector vel = new PVector(random(-20,20), random(0,10)*-1.0);
    velocity = vel;
    snow2 = snowimg;
   winds= windtemp;
  }

  void update() {
    velocity.add(0.0, 4.8, 0.0);
    position.add(velocity);
  }

  void render()
  {
    
    image(snow2,position.x, position.y);
  }
}















//////////////////////////////////////////////////////////////CLASSES

class Scene{
  PImage sky;
  PImage cloud;
  PImage tempsky;
  PImage tempcloud;
  PImage ground;
  
  
  Scene(PImage tempsky, PImage tempcloud){
sky = tempsky;

cloud = tempcloud;
  
  }
  
  void display() {
    ground = loadImage("Ground.png");

   image(sky,0,0,width,height);
   image(cloud,0,0);
   image(ground,0, height/1.4,width,height/1.4);
  
  
}

}




void keyReleased() {
  if (key == 'a') {
    nn = false;
  } 
}









