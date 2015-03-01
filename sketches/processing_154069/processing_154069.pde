
//COALESCENCE LAB RESEARCH INITIATIVE _2014////////
//THE LOST WHITE DREAM AND THE BLACK DANCING BALLS////////////////////////////////
//CHEERS///////////////////////////////////////////

PFont myFont;

Ball [] myBall = new Ball [550];

void setup() {
  size(800, 300);
  smooth();
  myFont = loadFont("Calibri-Light-48.vlw");
  textFont(myFont, 20);
  textAlign(CENTER);
  for (int i = 0; i<myBall.length ; i++) {
    myBall [i] = new Ball();
  }
}

void draw() {
  background(255);
  for (int i = 0; i<myBall.length ; i++) {
    myBall[i].run();
  }
  noCursor();
text("Coalescence Lab | The lost white dream and the black dancing balls", width/2, height/2);
}
class Ball{
PVector location;
PVector velocity;
float speedX = random(1,6);
float speedY = random(0,4);

Ball(){
location = new PVector(random(0,200),random(120,400));
run();
}

void run(){
display();
move();
bounce();
}
void display(){
float a = (dist(location.x,location.y,mouseX,mouseY))/8;
noStroke();
 fill(0);
  strokeWeight(1);
ellipse(location.x,location.y,a,a);

strokeWeight(5);
stroke(255);
  point(location.x,location.y);
}
void move(){
location.x = location.x+speedX;
location.y = location.y+speedY;
}
void bounce(){
  if(location.x<0 || location.x>width){
  speedX = speedX * -1;
}
  if(location.y<0 || location.y>height){
  speedY = speedY * -1;
}
}
}
//COALESCENCE LAB RESEARCH INITIATIVE _2014////////
//THE LOST WHITE DREAM AND THE BLACK DANCING BALLS////////////////////////////////
//CHEERS///////////////////////////////////////////
