
bot robot1 = new bot();
apple apple1 = new apple();
float xdifference;
float ydifference;

void setup(){
size(500,500);
frameRate(10);
}
void draw(){
  xdifference = robot1.xp - apple1.xp;
  ydifference = robot1.yp - apple1.yp;
  robot1.xdifference = robot1.xp - apple1.xp;
  robot1.ydifference = robot1.yp - apple1.yp;
  background(255);
  strokeWeight(10);
  strokeJoin(BEVEL);
  stroke(7,49,75);
  fill(25,151,277);
  rect(70,70, 400,400);
  noStroke();
  apple1.display();
  robot1.display();
  robot1.move();
  //text("Xrandomiser: " + robot1.xrandomiser,30,15);
  text("mouseX: " + mouseX, 30,15);
  text("mouseY: " + mouseY, 30,25);
  text("DX:" + xdifference, 30,35);
  text("DY:" + ydifference, 30,45);
  text("Foodhunting:" + robot1.foodhunting, 30,55);
  //robot1.eat();
}

//allows me to activate the foodhunting mode
void mousePressed(){
  if(robot1.foodhunting == true){
robot1.foodhunting = false;
  }
  else if (robot1.foodhunting == false){
robot1.foodhunting = true;
  }
}
class apple{
float xp = random(100,430);
float yp = random(100,430);

apple(){
}

void display(){
  fill(232,12,12);
ellipse(xp,yp,20,20);
}


}
class bot {
float xp = random(100,430);
float yp = random(100,430);
float speed;
//boolean used to decide left or right direction
boolean xswitch;
//boolean used to decide up or down direction
boolean yswitch;
int xrandomiser;
int yrandomiser;
float xdifference;
float ydifference;
boolean foodhunting = true;


bot(){
}

void display(){
fill(0);
ellipse(xp,yp,40,40);
}

void move(){
  if(foodhunting == true){
  eat();
  }
  else{
    
    ////////NORMAL MOTION//////////
////////////X MOTION
xrandomiser = int(random(1,6));
//stays still
if (xrandomiser == 1){
  if(xp < 450 && xp > 80){
    speed = 0;
    xp = xp + speed;
  }
}
//moves to right
if (xrandomiser == 2 || xrandomiser == 4){
  if(xp <= 450 || xp <= 80){
    speed = 20;
    xp = xp + speed;
  }
}
//moves to left
if (xrandomiser == 3 || xrandomiser == 5){
  if(xp >= 450 || xp >= 80){
    speed = 20;
    xp = xp - speed;
  }
}

////////////Y MOTION
yrandomiser = int(random(1,6));
//stays still
if (yrandomiser == 1){
  if(yp <= 450 && yp >= 80){
    speed = 0;
    yp = yp + speed;
  }
}
//moves down
if (yrandomiser == 2 || yrandomiser == 4){
  if(yp <= 450 || yp <= 80){
    speed = 20;
    yp = yp + speed;
  }
}
//moves up
if (yrandomiser == 3 || yrandomiser == 5){
  if(yp >= 430 || yp >= 80){
    speed = 20;
    yp = yp - speed;
  }
}

}

}

void eat(){
//boolan foodhunting activated by default. If it is activated eat() is called. Otherwise, the rest of the code of move() is ran
///////////////DX
//if dx is less than 0, move to right
if(xdifference <= 0){
  speed = 5;
xp = xp + speed;
}

//if dx is more than 0, move to left
if(xdifference >= 10){
  speed = 5;
xp = xp - speed;
}
//if dx is 0,stay
  if(xdifference >= 0 && xdifference <= 11){
  speed = 0;
xp = xp + speed;
}
///////////////DY
//if dy is less than 0, move up
if(ydifference <= 0){
  speed = 5;
yp = yp + speed;
}

//if dy is more than 0, move down
if(ydifference >= 10){
  speed = 5;
yp = yp - speed;
}
//if dy is 0,stay
  if(ydifference >= 0 && ydifference <= 11){
  speed = 0;
yp = yp + speed;
text("Apple eaten!", 30,65);
}

}

}

//





