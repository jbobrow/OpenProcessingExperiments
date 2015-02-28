
int y = int(random(0, height/5));
int x = int(random(-10, -100));

int inc;

//color variables
int grass = color(0, 200, 0);
int yellow = color(255, 255, 0);
int brown = color(139, 69, 19);
int skyblue = color(0, 191, 255);
int darkblue = color(25, 25, 112);
int purple = color(148, 0, 211);
int red = color(175, 0, 0);
int orange = color(255, 69, 0);
int sunrise_blue = color(135, 206, 250);
int green = color(34, 139, 34);

//sun rotation variables
float px, py, angle;
float frequency = 0.104;
//clock rotation variables
float px2, py2, angle2, px3, py3, angle3;
float frequency2 = 1.56;
//moon rotation variables
float px4, py4, angle4;
float frequency3 = 0.15;

float radius = 150;
float r = 15;

PFont font;

//initialize lists and objects
Cloud [] clouds;
Passerby [] passerbys;
Rain [] drops;
WeatherGrabber wg;

String zip = "04469";


void setup() {
  size(1000, 600);

  ellipseMode(CENTER);
  rectMode(CENTER);

  //create a WeatherGrabber Object for Orono, ME
  wg = new WeatherGrabber(zip);
  //get the weather
  wg.requestWeather();

  //make our clouds
  clouds = new Cloud[10];

  for (int i = 0; i < clouds.length; i++) {
    clouds[i] = new Cloud(int(random(-25, (width+25))), int(random(50, height/5)), int(random(1, 4)), coinToss());
  }

  //make the passerby
  passerbys = new Passerby[10];
  inc = inc - 100;
  for (int i = 0; i < passerbys.length; i++) {
    passerbys[i] = new Passerby(inc, (height/5)*4, 1, 1);
    inc = inc - 100;
  }

  //make it rain
  drops = new Rain[20];
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Rain(int(random(10, width-10)), int(random(-150, -100)), int(random(1, 4)));
  }
  font = loadFont("TimesNewRomanPSMT-48.vlw");
  textFont(font, 32);
} //end setup

void draw() {
  String weather = wg.getWeather();
  background(255);

  moon();
  sky(timeY());

  sun(timeX(), timeY());
  house();
  
  //display and move the clouds
  for (int i = 0; i < clouds.length; i ++) {
    clouds[i].display();
    clouds[i].wind();
  }
  
  if (weather == "Rain") {
    //make the rain fall
    for (int i = 0; i < drops.length; i++) {
      drops[i].display();
      drops[i].motion();
    }
  }
  
  //create the vegitation
  tree(width/4, (height/4)+100);
  tree(3*(width/4), (height/4)+100);
  tree(width/2, (height/4)+50);
  
  if (timeY() >= 500) {
    //display and move the passerby
    for (int i = 0; i < passerbys.length; i++) {
      passerbys[i].display();
      passerbys[i].movement();
    }
  }

  if (weather == "Rain") {
    //make the rain fall
    for (int i = 0; i < drops.length; i++) {
      drops[i].display();
      drops[i].motion();
    }
  }
  //text(timeY(), width/4, height/4);
} //end draw

void house() {
  int H = (height/2)+200;
  float windowCenterX1 = (width/5)*1.75;
  float windowCenterX2 = (width/5)*3.25;
  float windowHeight = (height/2)+60;

  //draw the hill
  fill(grass);
  stroke(grass);
  arc(width/2, H, width, height, PI, TWO_PI);
  rect(width/2, ((height/4)*3)+200, width, 300);

  //draw the house
  fill(brown);
  stroke(brown);
  strokeWeight(10);
  line(width/2-200, height/2+50, width/2, 290);
  line(width/2, 290, width-300, height/2+50);
  /*fill(brown);
   stroke(brown);
   strokeWeight(1);
   triangle(20, h/2-5, w/2, 140, w-20, h/2-5);
   rect(w/2, h/2+25, w-44, 60);*/

  clock();

  //draw the windows
  strokeWeight(1);
  fill(brown);
  stroke(brown);
  rect(windowCenterX1, windowHeight, 30, 30);
  rect(windowCenterX2, windowHeight, 30, 30);
  fill(skyblue);
  stroke(skyblue);
  ellipse(windowCenterX1, windowHeight, 30, 30);
  ellipse(windowCenterX2, windowHeight, 30, 30);
  fill(245, 245, 220);
  stroke(245, 245, 220);
  rect(windowCenterX1, windowHeight, 30, 3);
  rect(windowCenterX1, windowHeight, 3, 30);
  rect(windowCenterX2, windowHeight, 30, 3);
  rect(windowCenterX2, windowHeight, 3, 30);

  //draw the door
  fill(brown);
  stroke(brown);
  ellipse(width/2, (height/2)+74, 150, 150);
  fill(yellow);
  stroke(yellow);
  ellipse(width/2, (height/2)+74, 140, 140);
  fill(0);
  stroke(0);
  ellipse(width/2, (height/2)+74, 15, 15);
  //line(w/2, 149, w/2, 299);
} //end house

float timeX() {
  px = (width/2) + cos(radians(angle))*(radius*3);
  return px;
} //end timeX

float timeY() {
  py = (width/2+100) + sin(radians(angle))*(radius*3.5);
  return py;
} //end timeY

void sky(float time) {
  int t = int(time);
  //normal daytime
  if (t < 300) {
    fill(skyblue);
  }
  else if (t > 300 && t < 400) {
    fill(sunrise_blue);
  }
  else if (t > 400 && t < 500) {
    fill(orange);
  }
  else if (t > 500 && t < 600) {
    fill(red);
  }
  else if (t > 600 && t < 700) {
    fill(purple);
  }
  //night heading into morning
  else if (t > 700 && t < 900) {
    fill(darkblue);
  }
  //dead of night
  else {
    fill(25);
  }
  rect(width/2, height/2, width, height);
}

void sun(float x, float y) {
  fill(255, 255, 0);
  //px = (width/2) + cos(radians(angle))*(radius*3);
  //py = (width/2+100) + sin(radians(angle))*(radius*3.5);
  ellipse(x, y, 50, 50);

  angle += frequency;
} //end sun

void clock() {
  strokeWeight(1);
  stroke(0);
  fill(255);
  ellipse((width/5)*2, (height/2)+55, 30, 30);
  //hour hand
  px2 = (width/5)*2 + (cos(radians(angle2))*r)/2;
  py2 = (height/2)+55 + (sin(radians(angle2))*r)/2;
  //minute hand
  px3 = (width/5)*2 + (cos(radians(angle3))*r);
  py3 = (height/2)+55 + (sin(radians(angle3))*r);
  fill(0);
  line((width/5)*2, (height/2)+55, px2, py2);
  line((width/5)*2, (height/2)+55, px3, py3);

  //increment the second and minute hands
  angle2 += frequency;
  angle3 += frequency2;
}

void moon() {
  fill(255);
  px4 = (width/2) + cos(radians(angle4))*(radius*3);
  py4 = (width/2) + sin(radians(angle4))*(radius*3);

  ellipse(px4, py4, 25, 25);

  angle4 += frequency3;
}

void tree(int x, int y) {
  fill(brown);
  rect(x, y, 25, 45);
  fill(green);
  triangle(x-30, y-10, x, y-50, x+30, y-10);
  triangle(x-30, y-30, x, y-70, x+30, y-30);
}

int coinToss() {
  float rand = random(-1, 1);
  int dir;
  if (rand < 0) {
    dir = -1;
  }
  else {
    dir = 1;
  }
  return dir;
}

class Cloud {
  int x, y, type;
  float direction;

  //constructor
  Cloud(int myX, int myY, int Type, float myDirection) {
    x = myX;
    y = myY;
    type = Type;
    direction = myDirection;
  } //end constructor

  void display() {
    fill(225);
    noStroke();
    if (type == 1) {
      cloud1(x, y);
    }
    else if (type == 2) {
      cloud2(x, y);
    }
    else if (type == 3 || type == 4) {
      cloud3(x, y);
    }
  } //end display

    void cloud1(int i, int j) {
    fill(225);
    noStroke();
    beginShape();
    vertex(i, j);
    vertex(i, j+50);
    vertex(i+20, j+45);
    vertex(i+50, j+40);
    vertex(i+50, j+10);
    vertex(i+25, j);
    //vertex(i-25, j-50);
    endShape();
  } //end cloud1

  void cloud2(int i, int j) {
    fill(225);
    noStroke();
    ellipse(i, j, 20, 20);
    ellipse(i+5, j+5, 20, 20);
    ellipse(i+10, j, 20, 20);
    ellipse(i+10, j+5, 20, 20);
    ellipse(i+10, j+10, 20, 20);
    ellipse(i-10, j, 20, 20);
    ellipse(i, j-15, 20, 20);
  } //end cloud1

  void cloud3(int i, int j) {
    fill(175);
    noStroke();
    ellipse(i, j, 20, 20);
    fill(225);
    noStroke();
    ellipse(i+10, j, 20, 20);
    ellipse(i-10, j, 20, 20);
    ellipse(i+5, j+5, 20, 20);
    ellipse(i-5, j+5, 20, 20);
    ellipse(i+20, j, 20, 20);
    ellipse(i-20, j, 20, 20);
    ellipse(i+10, j+5, 20, 20);
    ellipse(i-10, j+5, 20, 20);
  } //end cloud2

  void wind() {
    x += direction;
    if (x == (width+150)) {
      x = -50;
    }
    if (x == -150) {
      x = (width+50);
    }
  }
}

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 18-5: Parsing Yahoo's XML weather feed manually

// A WeatherGrabber class
class WeatherGrabber {
  
  int temperature = 0;
  String weather = "";
  String zip;
  
  WeatherGrabber(String tempZip) {
    zip = tempZip;
  }
  
  // Set a new Zip code
  void setZip(String tempZip) {
    zip = tempZip;
  }
  
  // Get the temperature
  int getTemp() {
    return temperature;
  }
  
  // Get the weather
  String getWeather() {
    return weather;
  }
  
  // Make the actual XML request
  void requestWeather() {
    // Get all the HTML/XML source code into an array of strings
    // (each line is one element in the array)
    String url = "http://xml.weather.yahoo.com/forecastrss?p=" + zip;
    String[] lines = loadStrings(url);
    
    // Turn array into one long String
    String xml = join(lines, "" ); 
    
    // Searching for weather condition
    String lookfor = "<yweather:condition  text=\"";
    String end = "\"";
    weather = giveMeTextBetween(xml,lookfor,end);
    
    // Searching for temperature
    lookfor = "temp=\"";
    temperature = int(giveMeTextBetween (xml,lookfor,end));
  }
  
  // A function that returns a substring between two substrings
  String giveMeTextBetween(String s, String before, String after) {
    String found = "";
    int start = s.indexOf(before);    // Find the index of the beginning tag
    if (start == - 1) return"";       // If we don't find anything, send back a blank String
    start += before.length();         // Move to the end of the beginning tag
    int end = s.indexOf(after,start); // Find the index of the end tag
    if (end == -1) return"";          // If we don't find the end tag, send back a blank String
    return s.substring(start,end);    // Return the text in between
  }
  
}
class Passerby {
  int x, y, type, movement;
  int zombie_skin = color(127, 255, 212);
  int zombie_shirt = color(139, 69, 19);
  int zombie_shorts = color(150);
  Passerby(int myX, int myY, int myType, int myMovement) {
    x = myX;
    y = myY;
    type = myType; //ignore for now
    movement = myMovement;
  } //end constructor
  
  void display() {
    //zombie body
    fill(zombie_shorts);
    rect(x, y, 20, 40);
    fill(zombie_shirt);
    rect(x, y+30, 20, 20);
    fill(zombie_skin);
    rect(x, y+50, 20, 20);
    //arms
    rect(x+25, y-10, 30, 20);
    //head
    rect(x+2.5, y-35, 30, 30);
    fill(0);
    rect(x+2.5, y-42.5, 30, 15);
  }
  
  void movement() {
    x += movement;
    if (x > width) {
      x = 0;
    }
  }
} //end class
class Rain {
  int x, y, gravity;
  Rain(int myX, int myY, int myGravity) {
    x = myX;
    y = myY;
    gravity = myGravity;
  }

  void display() {
    fill(0, 0, 255);
    triangle(x, y, x-10, y+60, x+10, y+60);
    ellipse(x, y+60, 20, 20);
  } //end display

  void motion() {
    y += gravity;
    if (y >= height+100) {
      y = -100;
    }
  } //end gravity
} //end class



