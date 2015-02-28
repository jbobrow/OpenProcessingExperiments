
//created by Eric Morrison
//if you get NullPointerException-- restart sketch and put in valid zip



Cloud cloud1, cloud2, cloud3, cloud4, cloud5, cloud6;

Rain rain;

int ref;

ArrayList<Zombie> manyZombies;

String typedText = "04469";

int temperature = 0;

String weather = "";

ArrayList<Rain> allrain; //declaring ArrayList allrain




void setup() {
  size(600, 600);
  frameRate(30);

  manyZombies = new ArrayList<Zombie>();

  cloud1=new Cloud(-50, 1.5);
  cloud2=new Cloud(-150, 1.4);
  cloud3=new Cloud(-250, 1.3);
  cloud4=new Cloud(-350, 1.2);
  cloud5=new Cloud(-450, 1.1);
  cloud6=new Cloud(-550, 1);

  allrain = new ArrayList<Rain>();
}

void draw() {


  //weather
  if (typedText.length()==5) {
    String url = "http://xml.weather.yahoo.com/forecastrss?p=" + typedText;
    XML xml = loadXML(url);
    XML forecast = xml.getChild("channel/item/yweather:forecast");
    temperature = forecast.getInt("high");
    weather = forecast.getString("text");
    println(weather);
  }


  //sky
  background(159, 183, 255);
  fill(0, 0, 0, transparency);
  rect(0, 0, 600, 300);

  sun();

  //mountains
  noStroke();
  fill(#D7D9FA);
  triangle(200, 300, 390, 280, 500, 300);
  fill(#C5C9FA);
  triangle(400, 300, 500, 270, 650, 300);
  triangle(-40, 300, 50, 270, 150, 300);
  if ( weather.indexOf("Snow") != -1 || (weather.indexOf("Snow") != -1&&weather.indexOf("Showers") != -1)|| weather.indexOf("Flurries") != -1) {
    fill(255, 255, 255, 140);
    triangle(200, 300, 390, 280, 500, 300);
    triangle(400, 300, 500, 270, 650, 300);
    triangle(-40, 300, 50, 270, 150, 300);
  }

  //clouds

  if ( weather.indexOf("Cloudy") != -1 && weather.indexOf("Partly") != -1) {
    cloud1.display();

    cloud2.display();

    cloud3.display();
  } 

  else if ( 
  weather.indexOf("Cloudy") != -1 || 
    weather.indexOf("Snow") != -1 || 
    weather.indexOf("Rain") != -1 || 
    weather.indexOf("Showers") != -1 ) {

    cloud1.display();

    cloud2.display();

    cloud3.display();

    cloud4.display();

    cloud5.display();

    cloud6.display();
  }
  cloud1.move();
  cloud2.move();
  cloud3.move();
  cloud4.move();
  cloud5.move();
  cloud6.move();


  //ground
  stroke(1);
  fill(#24990C);
  rect(0, 300, 600, 600);

  if ( weather.indexOf("Snow") != -1 || (weather.indexOf("Snow") != -1&&weather.indexOf("Showers") != -1)|| weather.indexOf("Flurries") != -1) {
    fill(255);
    rect(0, 300, 600, 600);
  }

  //frame of house
  fill(#F7EDA8);

  //front face
  rect(100, 200, 200, 200);

  //right side face
  quad(300, 200, 300, 400, 350, 350, 350, 250);

  //left add on
  rect(65, 320, 35, 70);

  //roof side
  fill(#858585);
  quad(250, 135, 300, 200, 350, 250, 313, 200);
  if ( weather.indexOf("Snow") != -1 || (weather.indexOf("Snow") != -1&&weather.indexOf("Showers") != -1)|| weather.indexOf("Flurries") != -1) {
    fill(255);
    quad(250, 135, 300, 200, 350, 250, 313, 200);
  }

  //roof front
  fill(#858585);
  quad(95, 205, 305, 205, 250, 135, 150, 135);
  if ( weather.indexOf("Snow") != -1 || (weather.indexOf("Snow") != -1&&weather.indexOf("Showers") != -1)|| weather.indexOf("Flurries") != -1) {
    fill(255);
    quad(95, 205, 305, 205, 250, 135, 150, 135);
  }

  //side roof left
  fill(#858585);
  triangle(100, 290, 100, 320, 60, 320);
  if ( weather.indexOf("Snow") != -1 || (weather.indexOf("Snow") != -1&&weather.indexOf("Showers") != -1)|| weather.indexOf("Flurries") != -1) {
    fill(255);
    triangle(100, 290, 100, 320, 60, 320);
  }

  //front step
  fill(#A8A8A8);
  rect(120, 393, 40, 10);

  //side of front step
  quad(160, 403, 165, 400, 165, 391, 160, 393);

  //top of front step
  quad(120, 393, 160, 393, 165, 391, 124, 391);

  //door
  fill(#A1774A);
  rect(124+2, 391-75, 40-4, 75);

  //door knob
  fill(#A8A8A8);
  ellipse(156, 370, 5, 5);

  //driveway
  fill(#525252);
  quad(200, 600, 600, 600, 450, 400, 350, 400);
  if ( weather.indexOf("Snow") != -1 || (weather.indexOf("Snow") != -1&&weather.indexOf("Showers") != -1)|| weather.indexOf("Flurries") != -1) {
    fill(255, 255, 255, 200);
    quad(200, 600, 600, 600, 450, 400, 350, 400);
  }

  //windowLeftFirstFloor- fill will change with time
  fill(#ADD6FF);
  rect(180, 320, 35, 55);
  line(180, 320+(55/2), 180+35, 320+(55/2));

  //windowRightFirstFloor
  rect(240, 320, 35, 55);
  line(240, 320+(55/2), 240+35, 320+(55/2));

  //windowRightSecondFloor
  rect(240, 230, 35, 55);
  line(240, 230+(55/2), 240+35, 230+(55/2));

  //windowMiddleSecondFloor
  rect(180, 230, 35, 55);
  line(180, 230+(55/2), 180+35, 230+(55/2));

  //windowLeftSecondFloor
  rect(120, 230, 35, 55);
  line(120, 230+(55/2), 120+35, 230+(55/2));

  //windowAddOn
  rect(70, 330, 15, 50);
  rect(90, 330, 10, 50);

  //shrubbery
  stroke(0);
  fill(#13AB05);
  ellipse(200, 400, 40, 30);
  ellipse(260, 400, 40, 30);
  ellipse(90, 400, 40, 30);
  triangle(315, 390, 335, 200, 365, 390);
  if ( weather.indexOf("Snow") != -1 || (weather.indexOf("Snow") != -1&&weather.indexOf("Showers") != -1)|| weather.indexOf("Flurries") != -1) {
    fill(255);
    ellipse(200, 400, 40, 30);
    ellipse(260, 400, 40, 30);
    ellipse(90, 400, 40, 30);
    triangle(315, 390, 335, 200, 365, 390);
  }


  for (int i=0;i<manyZombies.size();i++) {
    Zombie currentZombie = manyZombies.get(i);    
    float currentDist = dist(currentZombie.x, currentZombie.y, mouseX, mouseY);
    if (mousePressed&&currentDist<currentZombie.d/2) {
      manyZombies.remove(currentZombie);
    }    
    currentZombie.run();
  }
  //night time darkness
  fill(0, 0, 0, transparency*.75);
  rect(0, 0, 600, 600);


  if (transparency>100) {
    strokeWeight(1);
    stroke(0);
    //windowLeftFirstFloor- fill will change with time
    fill(#FFFED9);
    rect(180, 320, 35, 55);
    line(180, 320+(55/2), 180+35, 320+(55/2));
    //windowRightFirstFloor
    rect(240, 320, 35, 55);
    line(240, 320+(55/2), 240+35, 320+(55/2));
    //windowRightSecondFloor
    rect(240, 230, 35, 55);
    line(240, 230+(55/2), 240+35, 230+(55/2));
    //windowMiddleSecondFloor
    rect(180, 230, 35, 55);
    line(180, 230+(55/2), 180+35, 230+(55/2));
    //windowLeftSecondFloor
    rect(120, 230, 35, 55);
    line(120, 230+(55/2), 120+35, 230+(55/2));
    //windowAddOn
    rect(70, 330, 15, 50);
    rect(90, 330, 10, 50);
  }
  if (transparency>150) {

    //windowLeftFirstFloor- fill will change with time
    fill(#0A243D);
    rect(180, 320, 35, 55);
    line(180, 320+(55/2), 180+35, 320+(55/2));
    //windowRightFirstFloor
    rect(240, 320, 35, 55);
    line(240, 320+(55/2), 240+35, 320+(55/2));
    //windowRightSecondFloor
    rect(240, 230, 35, 55);
    line(240, 230+(55/2), 240+35, 230+(55/2));
    //windowMiddleSecondFloor
    rect(180, 230, 35, 55);
    line(180, 230+(55/2), 180+35, 230+(55/2));
    //windowLeftSecondFloor
    rect(120, 230, 35, 55);
    line(120, 230+(55/2), 120+35, 230+(55/2));
    //windowAddOn
    rect(70, 330, 15, 50);
    rect(90, 330, 10, 50);
  }

  //rain/snow



  if ( weather.indexOf("Rain") != -1 ||weather.indexOf("Showers") != -1||weather.indexOf("Snow") != -1) {
    float rx = random(width);//random value from 0,width
    float ry = 0;

    allrain.add(new Rain(rx, ry));

    for (int t=0;t<allrain.size();t++) {//you should know this by now other examples above^
      Rain tempDrop = allrain.get(t);//more examples up there^
      tempDrop.run("rain");//calles tempDrop's run function and passed it the string "rain"
      if (tempDrop.y>500) {//if tempDrop's Y value is greater than 400
        allrain.remove(tempDrop);//remove tempDrop from allrain
      }
    }
  }


  //clock();

  //text
  textSize(28);
  fill(255);
  text("zip code:", 10, 30);
  text("press Z for zombies", 320, 580);
  noFill();
  stroke(255);
  rectMode(CENTER);
  rect(200, 20, 120, 28);
  rectMode(CORNER);
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 150, 30);
  //thermometer
  text(temperature+"°", 550, 30);
}


void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0, max(0, typedText.length()-1));
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
    case RETURN:
      // comment out the following two lines to disable line-breaks
      //typedText += "\n";
      //break;
    case ESC:
    case DELETE:
      break;
    default:
      if (key == '1' || key == '2' || key == '3' 
        || key == '4' || key == '5' || key == '6' 
        || key == '7' || key == '8' || key == '9' 
        || key == '0')
      {
        if (typedText.length() < 5) {
          typedText += key;
        }
      }
    }
  }
}



void keyPressed() {
  if (key=='z') {
    float zomX = random(100, 500);//declaring and initialzing coordinates to be passed into the new squares
    float zomY = random(400, 600);
    manyZombies.add(new Zombie(zomX, zomY));
  }
}


class Cloud {

  float cloudX, cloudY, r;

  Cloud(float moveCloud, float rate) {
    //println(r);
    cloudY=150;
    r=rate;
    cloudX=moveCloud;
  }

  void display() {
    noStroke();
    fill(255, 255, 255, 200);
    ellipse(cloudX, cloudY, 200, 60);
  }

  void move() {
    cloudX+=r;
    if (cloudX>width+100) {
      cloudX=-100;
      cloudY=random(20, 200);
    }
    if (cloudX<0-101)
      cloudY=random(20, 200);
  }
}





// Sun Variables
int sunRadius = 40;      // size of the sun
int xStart = -sunRadius; // The initial x position
int yStart = 20;         // The initial y position
float xSun = xStart;     // the x position of the sun
float ySun = yStart;     // the y position of the sun
//Clock variables
int clockRadius = 0;      // size of the clock
int xStartClock = -clockRadius; // The initial x position
int yStartClock = 0;         // The initial y position
float xClock = xStartClock;     // the x position of the sun
float yClock = yStartClock;     // the y position of the sun

// Arc variables
float t = 0;   // Start time
float tClock = 0;   // Start time
float duration = 60 * 1000; // Complete a full circle every 60 seconds
float durationClock = 30 * 1000; // Complete a full circle every 30 seconds
float conversionFactor = 2 * 3.14 / duration; // A full circle (2*pi) occurs every duration milliseconds
float conversionFactorClock = 2 * 3.14 / durationClock; // A full circle (2*pi) occurs every duration milliseconds
float transparency;

void clock()
{
  //draw clock
  fill(220);
  ellipse(45, 550, 60, 60);
  line(45, 550, xClock, yClock);
  // Update position
  // this method traces a curve using a parametric equation. See http://en.wikipedia.org/wiki/Parametric_equation and Khan Academy
  // To change the speed, adjust the value added to t
  tClock += 0.02;

  // Convert t to radians
  tClock = millis() * conversionFactorClock;

  // Use the parametric form for an ellipse. This method uses constant angular velocity
  float RxClock = width/2 + clockRadius/2;
  float RyClock = height/2 - clockRadius/2;
  float centerXClock = 45+30;
  float centerYClock = 550+30;
  xClock = cos(tClock) * RxClock + centerXClock;
  yClock = sin(tClock) * RyClock + centerYClock;
}


void sun()
{
  //stars
  fill(255, 255, 255, transparency);
  noStroke();
  for (float i = -40; i < 600; i +=57) {
    for (float j = -40; j < 300; j +=40) {
      ellipse(i, j, 2, 2);
    }
  }
  for (float i = -13; i < 600; i +=53) {
    for (float j = -6; j < 300; j +=58) {
      ellipse(i, j, 2, 2);
    }
  }
  for (float i = -20; i < 600; i +=74) {
    for (float j = -25; j < 300; j +=70) {
      ellipse(i, j, 2, 2);
    }
  }
  // Draw the sun
  noStroke();
  fill( 255, 255, 255, 20);
  ellipse(xSun, ySun, sunRadius+40, sunRadius+40);
  ellipse(xSun, ySun, sunRadius+80, sunRadius+80);
  fill( 247+50, 199+50, 114+50);
  ellipse(xSun, ySun, sunRadius, sunRadius);

  // Update position
  // this method traces a curve using a parametric equation. See http://en.wikipedia.org/wiki/Parametric_equation and Khan Academy
  // To change the speed, adjust the value added to t
  t += 0.01;

  // Convert t to radians
  t = millis() * conversionFactor;

  // Use the parametric form for an ellipse. This method uses constant angular velocity
  float Rx = width/2 + sunRadius/2;
  float Ry = height/2 - sunRadius/2;
  float centerX = width/2;
  float centerY = height/2;
  xSun = cos(t) * Rx + centerX;
  ySun = sin(t) * Ry + centerY;



  transparency=map(ySun, 200, height, 0, 255);
}

class Zombie {
  float x, y, d, xmo, ymo;
  Zombie(float parameterX, float parameterY) {

    x=parameterX;
    y=parameterY;

    //d=random(10, 30);
    d=map(y, 400, 600, 50, 200);

    xmo=random(-2, 2);
    ymo=random(-2, 2);
  }
  void run() {
    makeZombie();
    moveZombie();
    contact();
  }
  void makeZombie() {
    fill(#77AD68);
    rectMode(CENTER);
    //body
    rect(x, y, d/3, d);
    rect(x-d/4.5, y-d/5, d/8, d/2);
    rect(x+d/4.5, y-d/5, d/8, d/2);
    //head
    ellipse(x, y-d/1.75, d/3, d/2.4);
    //rect(x,y-d/1.75,d/3.3,d/3);
    //pants
    fill(#3146A3);
    rect(x, y+d/4.5, d/3, d/2.5);
    //eyes
    strokeWeight(d/10);
    point(x-d/8, y-d/1.75);
    point(x+d/8, y-d/1.75);
    //mouth
    noStroke();
    fill(#AB0C0C);
    rect(x, y-d/2.4, d/6, d/8);
    //teeth
    fill(255);
    //top
    rect(x-d/40, y-d/2.2, d/30, d/25);
    rect(x+d/40, y-d/2.2, d/30, d/25);
    rect(x-d/15, y-d/2.2, d/35, d/25);
    rect(x+d/15, y-d/2.2, d/35, d/25);
    //bottom
    rect(x-d/40, y-d/2.7, d/30, d/30);
    rect(x+d/40, y-d/2.7, d/30, d/30);
    rect(x-d/15, y-d/2.7, d/35, d/30);
    rect(x+d/15, y-d/2.7, d/35, d/30);
    stroke(0);
    strokeWeight(1);
    rectMode(CORNER);
  }
  void moveZombie() {
    x+=xmo;
    //y+=ymo;
  }
  void contact() {
    if (x-(d/2)<=0||x+(d/2)>=width) {
      xmo*=-1;
    }
    if (y-(d/2)<=0||y+(d/2)>=height) {
      ymo*=-1;
    }
  }
}

void mouseClicked() {
  fill(#FFF04F);
  noStroke();
  float bang=random(50, 100);
  ellipse(mouseX, mouseY, bang, bang);
  fill(#FAEDA2);
  ellipse(mouseX, mouseY, bang/2, bang/2);
}

class Rain { //class name
  float x, y, xmo, ymo;//declaring instance floats
  Rain(float px, float py) {//class constructor
    x=px;//setting instance variables equal to parameter values
    y=py;
  }

  void run(String type) {//run takes a String paramter

    if (weather.indexOf("Rain") != -1 || weather.indexOf("Showers") != -1) {
      makeItRain();//run makeItRain
      xmo=0;//xmo is zero
      ymo=5;//ymo is two
    } 
    if ( weather.indexOf("Snow") != -1 || (weather.indexOf("Snow") != -1&&weather.indexOf("Showers") != -1)|| weather.indexOf("Flurries") != -1) {
      makeItSnow();//runt his
      xmo=0;//these values equal these
      ymo=1;
    }

    motion();//always run motion because it's outside the if statements
  }

  void makeItRain() {
    noStroke();
    fill(100, 100, 255, 200);//fill
    ellipse(x, y, 5, 5);//make a text object with the string word, and x and y coordinates passed into the class
    fill(0, 0, 0, transparency/2);
    ellipse(x, y, 5, 5);
  }

  void makeItSnow() {//same thing as makeItRain, except with a white fill
    noStroke();
    fill(255);
    ellipse(x, y, 5, 5);
    fill(0, 0, 0, transparency/2);
    ellipse(x, y, 5, 5);
  }

  void motion() {
    x+=xmo;//x increase by value xmo each loop through
    y+=ymo;//same with y and ymo
  }
}



