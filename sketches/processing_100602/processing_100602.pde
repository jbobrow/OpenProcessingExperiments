
Ball myBall1;
Ball myBall2; 
Ball myBall3;
Ball myBall4;
Ball myBall5; 
Ball myBall6;
 
 
//int windowSize = 400;
 
void setup() {
  size(400,400);
  frameRate(60);
  background(255);
  myBall1 = new Ball(color(255,0,0),0,0,random(-5,5),random(-5,5),1); 
  myBall2 = new Ball(color(255,0,150),0,0,random(-5,5),random(-5,5),0);
  myBall3 = new Ball(color(255,100,0),0,0,random(-5,5),random(-5,5),0);
  myBall4 = new Ball(color(255,0,0),400,0,random(-5,5),random(-5,5),0);
  myBall5 = new Ball(color(255,0,150),400,0,random(-5,5),random(-5,5),0);
  myBall6 = new Ball(color(255,100,0),400,0,random(-5,5),random(-5,5),0);
  
}
 
void draw() {
  fill(255,255,255,255);
  stroke(255,0,0,255);
  strokeWeight(20);
  polygon(4, 200, 200, 100);
  stroke(0,0);
  fill(255,255,255,30);
  rect(0,0,width,height);
  myBall1.move();
  myBall1.display();
  myBall2.move();
  myBall2.display();
  myBall3.move();
  myBall3.display();
  myBall4.move();
  myBall4.display();
  myBall5.move();
  myBall5.display();
  myBall6.move();
  myBall6.display();
}
 
class Ball { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isn’t object-oriented programming swell?
 color c;
 float xpos;
 float ypos;
 float xspeed;
 float yspeed;
 float player;
 
Ball(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed, int tempPlayer) { // The Constructor is defined with arguments.
  c = tempC;
 xpos = tempXpos;
 ypos = tempYpos;
 xspeed = tempXspeed;
 yspeed = tempYspeed;
 player = tempPlayer;
}


void display() {
 
 fill(c);
 stroke(0,0);
 ellipseMode(CENTER);
 if (xpos >= width) {
   ellipse(xpos,ypos,75,75);
 }else{
   ellipse(xpos,ypos,random(10,25),random(10,25));
 }
 if (xpos <= 0) {
   ellipse(xpos,ypos,75,75);
 }else{
   ellipse(xpos,ypos,random(10,25),random(10,25));
 }
 if (ypos >= height) {
   ellipse(xpos,ypos,75,75);
 }else{
   ellipse(xpos,ypos,random(10,25),random(10,25));
 }
 if (ypos <= 0) {
   ellipse(xpos,ypos,75,75);
 }else{
   ellipse(xpos,ypos,random(10,25),random(10,25));
 }}


void move() {      
 xpos = xpos + xspeed;
 ypos = ypos + yspeed;
 if (xpos > width) {
   xspeed = -1*xspeed;
 }
 if (xpos < 0) {
   xspeed = -1*xspeed;
 }
 if (ypos > height) {
   yspeed = -1*yspeed;
 }
 if (ypos < 0){
   yspeed = -1*yspeed;
}}}
 
   
void polygon(int n, float cx, float cy, float r)
{
  float angle = 360.0 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)),
      cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}



