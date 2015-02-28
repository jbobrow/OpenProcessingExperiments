
bot robot1 = new bot();

void setup(){
size(500,500);
frameRate(10);
}
void draw(){
  background(255);
  strokeWeight(10);
  strokeJoin(BEVEL);
  stroke(7,49,75);
  fill(25,151,277);
  rect(70,70, 400,400);
  noStroke();
  robot1.display();
  robot1.move();
  text("Xrandomiser: " + robot1.xrandomiser,40,40);
  text("mouseX: " + mouseX,40,50);
  text("mouseY: " + mouseY,40,60);
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


bot(){
}

void display(){
fill(0);
ellipse(xp,yp,40,40);
}

void move(){
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






