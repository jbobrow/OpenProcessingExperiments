
//class barr {
//xspeed of barracuda
int xSpeed = 0;
//speed of fish
int xspeed = 4;
//yspeed of barracuda
int ySpeed = 0;
float s = 1;

int xTarget, yTarget;
//start of the timer count down
int time = 30;
int fc = frameCount;

//defines base x value of the barracuda
int x;
//defines base y value of the barracuda
int y;
//size of fish
float radius = 15;

//defines base values of the fish that will be altered for all fish
float fishX = 240;
float fishY = 370;
float fishSize = 20;

//fish edges to define
float fishTopLeft;
float fishTopRight;
float fishBottomLeft;
float fishBottomRight;
float fish2TopLeft;
float fish2TopRight;
float fish2BottomLeft;
float fish2BottomRight;
float fish3TopLeft;
float fish3TopRight;
float fish3BottomLeft;
float fish3BottomRight;

// allow rotation of barracuda
int degree = 0;

float yoff = 0.0; 

//class set ups
Fish food;
Timer count;

//booleans for game ending and for fish collisions
boolean gameOver = false;
boolean barrHit = false;
boolean barrHit2 = false;
boolean barrHit3 = false;


void setup() {

  food = new Fish();
  count = new Timer();
  frameRate(60);
  size (500, 500);
  x = 200;
  y = 200;
  xTarget = 200;
  yTarget = 200;
  rectMode(CORNER);
}

void draw() {

  //every second the game subtracts a tic from the timer
  if (frameCount == 60) {
    frameCount = 0;
    time--;
  }

  count.display();

  println(time);

  food.display();
  food.move();
  background(150);
  fill(200);
  
  //setting the movement for the fish and barracuda
  fishX = fishX + xspeed;
  x = x + xSpeed;
  y = y + ySpeed;

  if (keyPressed) {
    if (key == 'd') {
      xSpeed = 6;
      ySpeed = 0;
    } else {
      if (key=='a') {
        xSpeed = -6;
        ySpeed = 0;
      } else {
        if (key=='x') {
          xSpeed = 0;
          ySpeed = 6;
        } else { 
          if (key == 'e') {
            xSpeed = 4;
            ySpeed = -4;
          } else { 
            if (key == 'q') {
              xSpeed = -4;
              ySpeed = -4;
            }
          }
        }
      }
    }
  }
  if (y>480) {
    y= 480;
    ySpeed = 0;
  } else {
    if (y<20) {
      y=20;
      ySpeed=0;
    }
  }


  if (x>485) {
    x= 485;
    xSpeed = 0;
  } else {
    if (x<15) {
      x=15;
      xSpeed=0;
    }
  }


  if (keyPressed) {
    if (key == 'w') {
      ySpeed = -6;
      xSpeed = 0;
    } else {
      if (key == 'z') {
        xSpeed = -4;
        ySpeed = 4;
      } else {
        if (key == 'c') {
          xSpeed = 4;
          ySpeed = 4;
        } else {
          if (key == 's') {
            xSpeed = 0;
            ySpeed = 0;
          }
        }
      }
    }

    if (xSpeed==4 && ySpeed==4) {
      degree = 45;
    } else {
      if (xSpeed==4 && ySpeed==-4) {
        degree = -45;
      } else {
        if (xSpeed==-4 && ySpeed==4) {
          degree = -45;
        } else {
          if (xSpeed==-4 && ySpeed==-4) {
            degree = 45;
          } else {
            if (xSpeed==0 && ySpeed==-6) {
              degree = 90;
            } else {
              if (xSpeed==0 && ySpeed==6) {
                degree = -90;
              } else {
                degree = 0;
              }
            }
          }
        }
      }
    }
  }

  radius = radius + (.0005*s);

  pushMatrix();
  translate(x, y);
  rotate(radians(degree));
  scale((.5+(.07*s)), .7+(.05*s));
  quad(-40, -10, -55, 10, 55, 10, 40, -10);
  popMatrix();

  //defines the parameters fishes edges

  fishTopLeft =    fishX - (.8*radius);
  fishTopRight =    fishX + fishSize + (.8*radius);
  fishBottomLeft = fishY + fishSize + radius;

  fish2TopLeft = width-fishX - (.8*radius);
  fish2TopRight = width-fishX + fishSize + (.8*radius);
  fish2BottomLeft = (.65)*fishY + fishSize + radius;

  fish3TopLeft =  fishX - (.8*radius);
  fish3TopRight =  fishX + fishSize + (.8*radius);
  fish3BottomLeft = (.4)*fishY + fishSize + radius;



  //sets collisions location
  if (fishX > 500) {
    barrHit = false;
    barrHit2 = false;  
    barrHit3 = false; 
    fishX = 0;
  }


  if (barrHit == false) {
    rect(fishX, fishY, fishSize, fishSize);
    if (x >= fishTopLeft && y <= fishBottomLeft && y >= fishY - radius && x <= fishTopRight) {
      s++;
      barrHit = true;
      println("Fish dead");
    }
  }
  /* 
   if (width-fishX > 500) {
   barrHit2 = false;        
   width-fishX = 0;
   }*/

  if (barrHit2 == false) {
    rect(width-fishX, (.65)*fishY, fishSize, fishSize);
    if (x >= fish2TopLeft && y <= fish2BottomLeft && y >= (.65)*fishY - radius && x <= fish2TopRight) {
      s++;
      barrHit2 = true;
      println("Fish dead");
    }
  }

  if (barrHit3 == false) {
    rect(fishX, (.4)*fishY, fishSize, fishSize);
    if (x >= fish3TopLeft && y <= fish3BottomLeft && y >= (.4)*fishY - radius && x <= fish3TopRight) {
      s++;
      barrHit3 = true;
      println("Fish dead");
    }
  }




  if (time < 1) {
    fill(40);
    rect(0, 0, 500, 500);
    barrHit = true;
    barrHit2 = true;
    barrHit3 = true;
    x = 0;
    fill(255);
    pushMatrix();
    translate(250, 250);
    scale((.5+(.07*s)), .7+(.05*s));
    quad(-40, -10, -55, 10, 55, 10, 40, -10);
    popMatrix();
    time = 0;
    textSize(24);
    rectMode(CENTER);
    text("Your Barracuda Grew To Be", 95, 175);
    textSize(20);
    text("Press 'r' to Restart", 162, 400);
    textSize(18);
    if (s < 5) {
      text("Did You Even Try?", 165, 325);
    }
    if ((s > 4) && (s < 15)) {
      text("Eh, Decent Enough", 165, 325);
    }
    if ((s > 14) && (s < 30)) {
      text("You're Above Average!", 150, 325);
    }
    if (s > 29) {
      text("Woah, You're A Grower!", 150, 325);
    }
    rectMode(CORNER);
    if (keyPressed){
      if (key == 'r') {
        s=1;
        time =30;
        x = 200;
        y = 200;
        radius = 15;
      }
    }
  }

  if (time < 1) {
    fill(250, 220, 220, 150);
  } else {
    fill(230, 230, 250, 150);
  }
  stroke(255);
  //water noise wave
  beginShape(); 

  float xoff = 0;       

  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff, yoff), 0, 2, 25, -50); 

    vertex(x, y); 
    xoff += .02;
  }
  yoff += .009;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  fill(255);
  stroke(0);
}

class Fish {

  Fish () {
    
  }
  

  void display() {
    fishTopLeft =    fishX - radius;
  fishTopRight =    fishX + fishSize + radius;
  fishBottomLeft = fishY + fishSize + radius;

  }


  //sets collisions location

   void move() {
  if (barrHit == false) {
    rect(fishX, fishY, fishSize, fishSize);
    if (x >= fishTopLeft
    && y <= fishBottomLeft
    && y >= fishY - radius
    && x <= fishTopRight) 
    {
      barrHit = true;
      println("Fish dead");
    }
  }
}
}

class Timer {
  
  Timer() {
   
  }
  
  void display(){
    if (time == 0) {
      rect(250,250,500,500);
    }
  }
}


