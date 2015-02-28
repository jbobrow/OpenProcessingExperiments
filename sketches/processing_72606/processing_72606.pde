
int diam = 200;
Circle mycircle; //makes newly created class usable
Circle mycircle2;

void setup () {
  size(600,600);
  background(0);
  stroke(0);
  //construct the circle
  mycircle = new Circle(0,0,75,color(255,0,0),5,10); //"New" creates the object  
  mycircle2 = new Circle(200,50,100,color(0,0,255),10,5);
}

void draw(){
  int grad = (mycircle.x/4)+(mycircle.y/6);
  fill(0,grad,0,20);
  noStroke();
  rect(0,0,width,height);
  fill(grad+2,grad+2, 100);
  //ellipse(mycircle.x,mycircle.y,mycircle.diam,mycircle.diam);
  //mycircle.x = mycircle.x + mycircle.velocity;
  mycircle.update();
  mycircle.display();
  mycircle2.update();
  mycircle2.display();
}

void drawacircle(int centx, int centy, int circlesize) {
 fill(0,255,255);
ellipse(mouseX,mouseY,diam,diam); 
}

class Circle {
 int x;
 int y;
 int diam;
 color circleColor; 
 int velocity_x;
 int velocity_y;

//constructor 
 Circle(int _x, int _y, int _diam, color _circleColor, int _velocity_x, int _velocity_y) {
  x = _x;
  y = _y;
  diam = _diam;
  circleColor = _circleColor;
  velocity_x = _velocity_x; 
  velocity_y = _velocity_y;
 }
 
 //methods
 void display () {
   fill(circleColor);
   ellipse(x,y,diam,diam);
 }
 void update() {
   x += velocity_x;
   if ((x < 0) || (x > width)) {
     velocity_x = -1*velocity_x;
}
 y += velocity_y;
   if ((y < 0) || (y > height)) {
     velocity_y = -1*velocity_y;
}
 }
}

