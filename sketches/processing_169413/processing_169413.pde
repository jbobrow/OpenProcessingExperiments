
//Clock HW

//HOURS   = SUN
//MINUTES = TURTLE
//SECONDS = RABBIT

PVector sunPos = new PVector (0, height/3);
PVector rabPos = new PVector (0, height-(height/5));
PVector turPos = new PVector (0, height-(height/4));
boolean nightTime;
int sunR;
int sunG;
int sunB;

int rabScore;
int turScore;

Star [] array = new Star [300];
Cloud [] clArray = new Cloud [6];


void setup() {
  size (800, 800);

  rabScore = 0;
  turScore = 0;

  //call stars/clouds
  for (int i=0; i<array.length; i++) {
    array[i] = new Star();
    array[i].starPrime(int(random(0, width)), int(random(0, height-(height/3))));
  }
  for (int i=0; i<clArray.length; i++) {
    clArray[i] = new Cloud();
    clArray[i].cloudPrime(int(random(0, width)), int(random(0, height-((height/3)+200))), int(random(100, 200)), int(random(50, 100)));
  }
}

void draw() {



  //Sky
  if (nightTime == false) {
    background (10, 150, 255);
    sunR = 250;
    sunG = 255;
    sunB = 0;
    //Clouds script at bottom (so clouds will be drawn over sun)
  } else if (nightTime == true) {
    background (185, 40, 255);
    sunR = 250;
    sunG = 255;
    sunB = 185;
    //Stars
    for (int i=0; i<array.length; i++) {
      array[i].starUpdate();
    }
  }

  //Night/Day toggle (at 7am/7pm)
  if (hour() >= 7 && hour() <=19) {
    nightTime = false;
  } else if ((hour() > 19 && hour() <= 24) || (hour() >= 0 && hour() < 7)) {
    nightTime = true;
  }

  //Grass
  if (nightTime == false) {
    fill(10, 255, 100); 
    noStroke(); 
    rect(0, height-(height/3), width, height/3);
  } else if (nightTime == true) {
    fill(40, 140, 65); 
    noStroke(); 
    rect(0, height-(height/3), width, height/3);
  }

  //Sun
  //sunPos.x = hour() * (width/24);
  sunPos.x = hour() * (width/24); 
  sunPos.y = height/4; 
  fill(sunR, sunG, sunB); 
  ellipse(sunPos.x, sunPos.y, 100, 100); 

  //Turtle
  turPos.x = minute() * (width/60); 
  turPos.y = height-(height/4); 
  noStroke(); 
  //head
  fill(90, 190, 5); 
  ellipse(turPos.x + 45, turPos.y - 10, 30, 20); 
  //l-leg
  ellipse(turPos.x - 18, turPos.y + 20, 20, 20); 
  //r-leg
  ellipse(turPos.x + 15, turPos.y + 20, 20, 20); 
  //body
  fill(85, 115, 25); 
  ellipse(turPos.x, turPos.y, 70, 40); 

  //Rabbit
  rabPos.x = second() * (width/60); 
  rabPos.y = height-(height/6); 
  noStroke(); 
  fill(255, 255, 255); 
  //body
  ellipse(rabPos.x, rabPos.y, 45, 30); 
  //head
  ellipse(rabPos.x + 25, rabPos.y - 20, 35, 30); 
  //nose
  fill(255, 150, 135); 
  ellipse(rabPos.x +35, rabPos.y - 18, 10, 8); 
  //ears
  fill(255); 
  ellipse(rabPos.x + 15, rabPos.y - 35, 10, 50); 
  ellipse(rabPos.x + 27, rabPos.y - 35, 10, 50); 
  //tail
  ellipse(rabPos.x - 20, rabPos.y - 10, 15, 15); 
  //hind leg
  ellipse(rabPos.x, rabPos.y + 15, 40, 10); 

  /*
  //AM/PM display
   if (hour() >= 0 && hour() < 12) {
   textSize(20); 
   fill (0); 
   text("AM", sunPos.x-15, sunPos.y);
   } else if (hour() >= 12 && hour() < 24) {
   textSize(20); 
   fill(0); 
   text("PM", sunPos.x-15, sunPos.y+5);
   }
   */

  //Clouds
  if (nightTime == false) {
    for (int i=0; i<clArray.length; i++) {
      clArray[i].cloudUpdate();
    }
  }

  /*
  //Score
   textSize(30);
   fill(0);
   text("Laps:", 25, 50);
   fill(0, 0, 255);
   text(turScore, 25, 100);
   fill(255, 0, 0);
   text(rabScore, 25, 150);
   
   if (minute() == 59) {
   turScore++;
   }
   if (second() == 59) {
   rabScore++;
   }
   */

  //Dialogue:
  //"Ha ha!"
  if (rabPos.x >= turPos.x && rabPos.x <= turPos.x + 50) {
    textSize(20);
    fill(255, 0, 0);
    text("Ha ha!", rabPos.x + 50, rabPos.y - 30);
  }
  //aw shucks
  if (rabPos.x >= width-50) {
    textSize(20);
    fill(0, 0, 255);
    text("Aw, shucks..", turPos.x + 50, turPos.y - 30);
  }
  //oh no oh no!
  if (rabPos.x < turPos.x && rabPos.x >= turPos.x - 50) {
    textSize(20);
    fill(0, 0, 255);
    text("OhNoOhNoOhNo", turPos.x + 50, turPos.y - 30);
  }
  //here i come again!
  if (rabPos.x <= 50) {
    textSize(20);
    fill(255, 0, 0);
    text("Here I come, turtle!", rabPos.x + 50, rabPos.y - 30);
  }
}

class Cloud {

  float xPos;
  float yPos;
  float xSize;
  float ySize;
  PVector cloudPos;

  void cloudPrime(int _xPos, int _yPos, int _xSize, int _ySize) {
    xPos = _xPos;
    yPos = _yPos;
    xSize = _xSize;
    ySize = _ySize;
    cloudPos = new PVector (xPos, yPos);
  }

  void cloudUpdate() {

    fill(255);
    ellipse(xPos, yPos, xSize, ySize);
  }
}

class Star {

  float xPos;
  float yPos;
  PVector starPos;

  void starPrime(int _xPos, int _yPos) {
    xPos = _xPos;
    yPos = _yPos;
    starPos = new PVector (xPos, yPos);
  }

  void starUpdate() {

    fill(255);
    ellipse(xPos, yPos, 5, 5);
  }
}



