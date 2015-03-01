
PImage face;
PImage apple;

int y = 0;
int x = 0;
int speed = 5;
int positionX=700;
int positionY=500;

int win = 0;

int positionA=300;
int positionB=300;
int positionC=500;
int diameter=70;

float yspeed = 7;

float f = random(100,500);

void setup() {
  size(700,500);
  smooth();
  face=loadImage("face.png");
  apple=loadImage("apple.png");
  frameRate(130);
}

void draw() {
 
  background(255, 0, 0);
  x = x + speed;
 
 //left to right bounce
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
  stroke(0);
  fill(175);
  ellipse(x,100,diameter,diameter);
  ellipse(x,300,diameter,diameter);
 
 //Collision with side to side balls 
 if (dist(mouseX, mouseY, x, diameter) <= 38){
  win = -1;
 }
  if (dist(mouseX, mouseY, x, positionA) <= 38){
  win = -1;
  }
 
 //up down bounce
 y = y + yspeed;
 
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  stroke(0);
  fill(175);
  ellipse(100,y,diameter,diameter);
  ellipse(300,y,diameter,diameter);
  ellipse(500,y,diameter,diameter);


//Collision with up down balls
if (dist(mouseX, mouseY, diameter, y) <= 38){
 win = -1;
}
if (dist(mouseX, mouseY, positionB, y) <= 38){
  win = -1;
}
if (dist(mouseX, mouseY, positionC, y) <= 38){
  win = -1;
}


//Diagnal bounce below
if(positionX>=width-diameter/2){
    Switch=1;
  }
  if(positionX==diameter/2){
    Switch=0;
}
if(Switch==0){
  positionX++;
   
}
else if(Switch==1){;
  positionX--;
   
}
  if(positionY>=height-diameter/2){
    Switch=1;
  }
  if(positionY==diameter/2){
    Switch=0;
}
if(Switch==0){
  positionY++;
   
}
else if(Switch==1){;
  positionY--;
}

ellipse(positionX, positionY, diameter, diameter);


//Collision with diagnal ball
if (dist(mouseX, mouseY, positionX, positionY) <= 70){
  win = -1;
}

//Player image
imageMode(CENTER);
face.resize(50,50);
image(face, mouseX, mouseY);

//Apple
apple.resize(40,40);
image (apple, f, f);


//Apple collision
if (dist(mouseX, mouseY, f, f) <= 20){
  win = 1;
 }


if (win == 1){
  background(255);
  textSize(40);
  fill(0, 102, 153);
  text("YOU WIN!", 250, 250);
}

if (win == -1){
  background(255);
  textSize(40);
  fill(0, 102, 153);
  text("YOU LOSE!", 250, 250);
  }
}







