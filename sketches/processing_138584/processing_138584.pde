
//Jordana Bungard
//March 6
Bird myBird1;
Bird myBird2;
Bird myBird3;
Bird myBird4;
Bird myBird5;
Bird myBird6;// 6 objects

void setup() {
 size(500,250);
 myBird1 = new Bird(color(0,0,255),30,60,random(10));
 myBird2 = new Bird(color(0,255,100),0,90,random(10)); 
 myBird3 = new Bird(color(255,60,200),0,120,random(10));
 myBird4 = new Bird(color(0,50,100),0,150,random(10));
 myBird5  = new Bird(color(100,15,25),100,180,random(10));
myBird6 = new Bird(color(255,0,0),25,225,random(10)); // color 
 if (myBird1.xpos > width) {
    background(#1805F7);
    text("BLUE WINS!", 130, 110);
    noLoop();
  } else if (myBird2.xpos > width) {
    background(#05F723);
    text("GREEN WINS!", 140, 110);
    noLoop();
  } else if (myBird3.xpos > width) {
    background(#FF00DE);
    text("PINK WINS!", 80, 110);
    noLoop();
  }else if (myBird4.xpos > width) {
    background(#14304D);
    text("NAVY WINS!", 80, 110);
    noLoop();
  }else if (myBird5.xpos > width) {
    background(#5F0D33);
    text("MAROON WINS!", 80, 110);
    noLoop();
  } else if (myBird6.xpos > width) {
    background(#FC0324);
    text("RED WINS!", 80, 110);
    noLoop();
  }
}

void draw(){
  background(100,100,255);
  myBird1.move();
  myBird1.display();
  myBird2.move();
  myBird2.display();
  myBird3.move();
  myBird3.display();
 myBird4.move();
  myBird4.display();
  myBird5.move();
  myBird5.display();
 myBird6.move();
 myBird6.display();
}
void keyPressed(){
  noLoop();
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textSize(100);
  text("PAUSE",200,250);
} //pauses race
 
void keyReleased(){
  loop();
} //resumes race
class Bird { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Bird(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;}
  

  void display() {
    stroke(0);
    fill(c);
   ellipse(xpos,ypos,20,20);
   ellipse(xpos+10,ypos-10,10,10);
   line(xpos-15,ypos-15,xpos,ypos);
rect(xpos-10,ypos-10,10,10);}
  
  
   
  void move() {
    xpos = xpos + xspeed;
    if (mousePressed) {
      setup();
    }
  }
}
