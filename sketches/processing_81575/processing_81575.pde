
PImage b;
PImage c;
PImage d;
float mx=0.0;
float my=0.0;
float easing = 0.3;
int timer;
int radius = 100;
int x;
int y;
int s;
int edge = 10;
int inner = edge + radius;
int lx=0;
int ly=0;
boolean shot = false;

void setup() {
  size(400, 500);
  frameRate(60);
  x = 200;
  y= 900;
  s = -300;
  noStroke(); 
  noCursor();
  smooth();
  ellipseMode(RADIUS);
  rectMode(CORNERS);
  b = loadImage("derpjake.png");
  c = loadImage("clouds.png");
  d = loadImage("gradient.png");
}

void draw() { 
  background(51);
  timer++;
  println("time is "+timer);
  
  y -= 1;
  
  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }
  
  mx = constrain(mx, inner, width - inner);
  my = constrain(my, inner, height - inner);
  fill(0);
  rect(edge, edge, width-edge, height-edge);
  fill(0);  
  image(c, 0, 0);
    if(timer>1){
    image(d, 0, ++x-1300);
  }
  if(timer>1100){
    rect(0,0,900,900);
  }
   
  
  image(b, mx - 82, my - 0);
  fill(#b4ff00);
  
  
  //drawing bullet, uses lx and ly
  if(shot==true){
  ellipse(lx,ly,5,9);
  //bullet moves up
  ly = ly-5;    //my-=5;
  }
  
  
  if(ly<-10){
    shot=false;
  }
}

void mouseClicked(){
  if(shot==false){
    shot=true;
  lx=mouseX;
  ly=mouseY;
 }
}
  

