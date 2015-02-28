
//text
PFont myriad;

//xml
XMLElement xmlNY;
XMLElement xmlLA;
String[]weatherNY = new String[38];
String[]weatherLA = new String[38];

//title screen + capture
float hour;
float minute;
int millis;
PImage title1;
PImage title2;
int gameState;

//save frame
int x = 0;

//variables
int heat;
int xSz;
int ySz;
float noiseAddition;
String temp;
String current;
String coast;

//backgrounds
PImage mapback;
PImage backThunder;
PImage backCloudy;
PImage backSun;
PImage backFog;
PImage backRain;

//states + weather
PImage cali;
PImage nyc;
PImage sunLA;
PImage sunNYC;
PImage fogLA;
PImage fogNYC;
PImage rainLA;
PImage rainNYC;
PImage thunderLA;
PImage thunderNYC;
PImage cloudyLA;
PImage cloudyNYC;

// ////////////////////
void setup() {
  size(500, 500);
  background(0);
  smooth();
  noStroke();

  //fonts
  myriad=loadFont("myriad.vlw");
  textFont(myriad, 20);

  //variables
  heat = 0;
  xSz = 0;
  ySz = 0;
  noiseAddition = .5;
  current="";
  coast="";

  //backgrounds
  mapback = loadImage("map.png");
  backThunder = loadImage("backThunder.png");
  backSun = loadImage("backSun.png");
  backFog = loadImage("backFog.png");
  backRain = loadImage("backRain.png"); 
  backCloudy = loadImage("backCloudy.png");
  
  //weather types
  cali = loadImage("cali.png");
  nyc = loadImage("nyc.png");
  cloudyLA = loadImage("cloudyLA.png");
  cloudyNYC = loadImage("cloudyNYC.png");
  sunLA = loadImage("sunLA.png");
  sunNYC = loadImage("sunNYC.png");
  fogLA = loadImage("fogLA.png");
  fogNYC = loadImage("fogNYC.png");
  thunderLA = loadImage("thunderLA.png");
  thunderNYC = loadImage("thunderNYC.png");
  rainLA = loadImage("rainLA.png");
  rainNYC = loadImage("rainNYC.png");

  //title page
  title1 = loadImage("title1.jpg");
  title2 = loadImage("title2.jpg");
  gameState = 0;


  //XML-NY Setup
  xmlNY = new XMLElement(this, "http://w1.weather.gov/xml/current_obs/KJFK.xml");
  int numSites = xmlNY.getChildCount();
  for (int i = 0; i < numSites; i++) {
    XMLElement kid = xmlNY.getChild(i); 
    String site = kid.getContent();
    weatherNY[i] = site;
  }

  //XML-LA Setup
  xmlLA = new XMLElement(this, "http://w1.weather.gov/xml/current_obs/KCQT.xml");
  int numSitesLA = xmlLA.getChildCount();
  for (int i = 0; i < numSitesLA; i++) {
    XMLElement kid = xmlLA.getChild(i); 
    String site = kid.getContent();
    weatherLA[i] = site;
  }
}

// //////////////////////

void draw() {

  //title page
  if (gameState == 0) {
    image(title1, 0, 0);
  }

  if (gameState == 1) {
    image(title2, 0, 0);
  }

  if (gameState == 2) {

    //background
    fill(0, 0, 0, 1);
    noStroke();


    //XML CITY CHOOSER
    if (mouseX < width/2) {
      current = weatherLA[11];
      temp = weatherLA[13];
      coast = "LA";
    } 
    else {
      coast = "NYC";
    }

    if (coast.equals("NYC")) {
      temp = weatherNY[13];
      current = weatherNY[11];
    }

    //weather info
    fill(255, 255, 255, 80);
    text("(current weather in " + coast + ") ", 10, 450);
    text(current + " | " + temp, 10, 470);



    //weather
    if (coast.equals("LA")) {
      if (current.equals("Fair")
        || current.equals("Windy")
        || current.equals("Breezy")
        || current.equals("Fair and Windy")) {
        image(backSun, 0, 0);
        image(sunLA, 0, 0);
        //image(cali, 0, 0);
        
      }
    }

    if (coast.equals("NYC")) {
      if (current.equals("Fair")
        || current.equals("Windy")
        || current.equals("Breezy")
        || current.equals("Fair and Windy")) {
        image(backSun, 0, 0);
        image(sunNYC, 0, 0);
        //image(nyc, 0, 0);
      }
    }

    if (coast.equals("LA")) {  
      if (current.equals("A Few Clouds")   
        || current.equals("Mostly Cloudy")
        || current.equals("A Few Clouds and Windy")
        || current.equals("A Few Clouds and Breezy")
        || current.equals("Partly Cloudy and Windy")
        || current.equals("Partly Cloudy")
        || current.equals("Partly Cloudy with Haze")
        || current.equals("Partly Cloudy and Breezy")) {
        image(backCloudy, 0, 0);
        image(cloudyLA, 0, 0);
        //image(cali, 0, 0);
      }
    }

    if (coast.equals("NYC")) {  
      if (current.equals("A Few Clouds")   
        || current.equals("Mostly Cloudy")
        || current.equals("A Few Clouds and Windy")
        || current.equals("A Few Clouds and Breezy")
        || current.equals("Partly Cloudy and Windy")
        || current.equals("Partly Cloudy")
        || current.equals("Partly Cloudy with Haze")
        || current.equals("Partly Cloudy and Breezy")) {
        image(backCloudy, 0, 0);
        image(cloudyNYC, 0, 0);
        //image(nyc, 0, 0);
      }
    }

    if (coast.equals("LA")) {
      if (current.equals("Fog")
        || current.equals("Overcast and Windy")
        || current.equals("Overcast")) {
        image(backFog, 0, 0);
        image(fogLA, 0, 0);
        //image(cali, 0, 0);
      }
    }

    if (coast.equals("NYC")) {
      if (current.equals("Fog")
        || current.equals("Overcast and Windy")
        || current.equals("Overcast")) {
        image(backFog, 0, 0);
        image(fogNYC, 0, 0);
        //image(nyc, 0, 0);
      }
    }

    if (coast.equals("LA")) {
      if (current.equals("Rain Showers") 
        || current.equals("Rain")
        || current.equals("Heavy Rain")
        || current.equals("Rain Fog/Mist")
        || current.equals("Heavy Rain Fog/Mist")
        || current.equals("Rain Fog")
        || current.equals("Light Rain")
        || current.equals("Heavy Rain Fog")
        || current.equals("Light Rain Showers") 
        || current.equals("Light Rain and Breezy") 
        || current.equals("Heavy Rain Showers") 
        || current.equals("Rain Showers in Vicinity") 
        || current.equals("Rain Showers Fog/Mist")
        || current.equals("Light Rain Showers Fog/Mist")
        || current.equals("Heavy Rain Showers Fog/Mist")
        || current.equals("Rain Showers In Vicinity Fog/Mist")
        || current.equals("Light Showers Rain Fog/Mist")
        || current.equals("Heavy Showers Rain Fog/Mist")
        || current.equals("Showers Rain Fog/Mist")
        || current.equals("Showers Rain in Vicinity Fog/Mist")) {
        image(backRain, 0, 0);
        image(rainLA, 0, 0);
        //image(cali, 0, 0);
      }
    }

    if (coast.equals("NYC")) {
      if (current.equals("Rain Showers") 
        || current.equals("Rain")
        || current.equals("Heavy Rain")
        || current.equals("Rain Fog/Mist")
        || current.equals("Heavy Rain Fog/Mist")
        || current.equals("Rain Fog")
        || current.equals("Light Rain")
        || current.equals("Heavy Rain Fog")
        || current.equals("Light Rain Showers") 
        || current.equals("Light Rain and Breezy") 
        || current.equals("Heavy Rain Showers") 
        || current.equals("Rain Showers in Vicinity") 
        || current.equals("Rain Showers Fog/Mist")
        || current.equals("Light Rain Showers Fog/Mist")
        || current.equals("Heavy Rain Showers Fog/Mist")
        || current.equals("Rain Showers In Vicinity Fog/Mist")
        || current.equals("Light Showers Rain Fog/Mist")
        || current.equals("Heavy Showers Rain Fog/Mist")
        || current.equals("Showers Rain Fog/Mist")
        || current.equals("Showers Rain in Vicinity Fog/Mist")) {
        image(backRain, 0, 0);
        image(rainNYC, 0, 0);
        //image(nyc, 0, 0);
      }
    }

    if (coast.equals("LA")) {
      if (current.equals("Thunderstorm")
        || current.equals("Thunderstorm Rain")
        || current.equals("Thunderstorm Light Rain")
        || current.equals("Thunderstorm Heavy Rain")
        || current.equals("Light Thunderstorm Rain")
        || current.equals("Heavy Thunderstorm Rain")
        || current.equals("Thunderstorm in Vicinity")
        || current.equals("Thunderstorm in Vicinity Fog")
        || current.equals("Thunderstorm in Vicinity Haze")) {
        image(backThunder, 0, 0);
        image(thunderLA, 0, 0);
        //image(cali, 0, 0);
      }
    }

    if (coast.equals("NYC")) {
      if (current.equals("Thunderstorm")
        || current.equals("Thunderstorm Rain")
        || current.equals("Thunderstorm Light Rain")
        || current.equals("Thunderstorm Heavy Rain")
        || current.equals("Light Thunderstorm Rain")
        || current.equals("Heavy Thunderstorm Rain")
        || current.equals("Thunderstorm in Vicinity")
        || current.equals("Thunderstorm in Vicinity Fog")
        || current.equals("Thunderstorm in Vicinity Haze")) {
        image(backThunder, 0, 0);
        image(thunderNYC, 0, 0);
        //image(nyc, 0, 0);
      }
    }


    // /////////////////////
    //drawing tool
    if (mousePressed==true) { 
      heat++;
      noiseAddition +=.05;
      strokeWeight(18*noise(noiseAddition));
    }

    if (heat == 0) {
      fill(0, 0, 255);
      stroke(0, 0, 255);
      xSz = 30;
      ySz = 30;
    }

    if (heat <= 15) {
      if (heat > 0) {
        fill(0, 0, 255);
        stroke(0, 0, 255);
        xSz = 27;
        ySz = 27;
      }
    }


    if (heat <= 25) {
      if (heat > 15) {
        fill(0, 245, 255);
        stroke(0, 245, 255);
        xSz = 24;
        ySz = 24;
      }
    }

    if (heat <= 40) {
      if (heat > 25) {
        fill(118, 238, 0);
        stroke(118, 238, 0);
        xSz = 21;
        ySz = 21;
      }
    }

    if (heat <= 55) {
      if (heat > 40) {
        fill(255, 255, 0);
        stroke(255, 255, 0);
        xSz = 18;
        ySz = 18;
      }
    }

    if (heat <= 70) {
      if (heat > 55) {
        fill(255, 140, 0);
        stroke(255, 140, 0);
        xSz = 15;
        ySz = 15;
      }
    }

    if (heat > 70) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
      xSz = 13;
      ySz = 13;
    }

    if (mousePressed==true) { 
      ellipse(mouseX, mouseY, xSz*noise(noiseAddition), ySz*noise(noiseAddition));
      line(mouseX, mouseY, mouseX+xSz, mouseY+ySz);
    }
  }
}

// //////////////////////
void mouseReleased() {
  heat = 0;
}

// //////////////////////
void keyPressed() {
  if (keyCode == ENTER) {
    gameState++;
    if (gameState > 2) {
      gameState = 0;
    }
  }

  if (key == 32) {
    saveFrame("filename" + int(random(100000))+ ".jpg");
  }
}


