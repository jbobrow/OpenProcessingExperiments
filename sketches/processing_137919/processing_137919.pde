
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
class Bird { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Bird(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

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
