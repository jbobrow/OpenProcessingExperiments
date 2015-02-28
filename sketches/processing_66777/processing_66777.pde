
float posX=250;
float posY=400;
float velX;
float velY;
float d=50;
int speed=10;
int ballColor=255;
PImage soccer;
PFont slower;
PFont faster;
PFont goal;
PFont directions;

void setup() {
  size(600, 600);
  frameRate(60);
  slower = loadFont("SansSerif-12.vlw");
  faster = loadFont("SansSerif-12.vlw");
  goal = loadFont("SansSerif-36.vlw");
  directions= loadFont("SansSerif-12.vlw");
}

void draw() {
  //field
  background(40, 92, 20, 20);
  fill(0);
  textFont(directions);
  text("Use your arrow keys to move the ball towards the goal.", 25, height-40); 
  text("Click on the slower or faster buttons to change the speed of the ball.", 25, height-20);
  noStroke(); 
  fill(144, 191, 127);
  noStroke();
  rect(0, 0, 600, 110);
  fill(200);
  stroke(255);
  strokeWeight(4);
  rect(200, 5, 200, 100);

  //slower button
  fill(255, 50);
  stroke(0);
  rect(10, 350, 80, 50);
  fill(random(0, 255), 255, 255);
  textFont(faster);
  text("SLOWER", 25, 380);


  //faster button
  fill(255, 50);
  stroke(0);
  rect(width-90, 350, 80, 50);
  fill(255, random(0, 255), 255);
  textFont(slower);
  text("FASTER", width-75, 380);

  //soccer ball
  PImage soccer = loadImage("soccer.png"); 
  image(soccer, posX, posY, d, d);
  if (posX<25 || posX>width-25) {
    posX=250;
  }
  if (posY<25 || posY>height-25) {
    posY=400;
  }
  

  //GOAL
  if (posY>25 && posY<80) {
    fill(255, 255, random(0, 255));
    textFont(goal);
    text("GOAL!", 240, 50);
  }

  //slower conditional
  if (mousePressed==true && mouseX>10 && mouseX<90 && mouseY>350 &&mouseY<400) {
    speed=speed-5;
      if (speed <= 0) {
        speed = 1;
      }
   
  }

  //faster conditional
   if (mousePressed==true && mouseX>width-90 && mouseX<width-10 && mouseY>350 &&mouseY<400){
     speed=speed+5;
    }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      posY=posY-speed;
    } 
    else if (keyCode == DOWN) {
      posY=posY+speed;
    }
    else if (keyCode== LEFT) {
      posX=posX-speed;
    }
    else if (keyCode==RIGHT) {
      posX=posX+speed;
    }
  }
}


