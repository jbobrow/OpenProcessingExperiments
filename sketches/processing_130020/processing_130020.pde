
Thing myThing1;
Thing myThing2; // Two objects!
Thing myThing3;
Thing myThing4;
Thing myThing5;
Thing myThing6;
Thing myThing7;
Thing myThing8;
Thing myThing9;
Thing myThing10;
Thing myThing11;
Thing myThing12;
Thing myThing13;
Thing myThing14;
Thing myThing15;
Thing myThing0;
int a= 50;    //frame rate value
int b=100;    //frame fade value IF YOU CHANGE THIS, THE IF STATEMENT IN VOID MOVE HAS TO BE ALTERED
int s= 3;    //length of line(RAIN)
int v= 8;    // height of line(RAIN)
int F=0;     //Front barrier for  rain to crash
int M=10 ;     //Middle barrier for rain to crash
int B=20 ;     //Back  barrier for rain to crash

float r= random(200);

boolean sweetspot = false;

void setup() {
  frameRate(a);
  size(250,250);
  smooth();
  background(0);

  myThing1 = new Thing(color(225,255,255,191),0,10,4); // Parameters go inside the parentheses when the object is constructed.
  myThing2 = new Thing(color(235,255,255,191),10,20,5);
  myThing3 = new Thing(color(245,255,255,191),20,30,6);
  myThing4 = new Thing(color(255,255,255,191),30,40,4);
  myThing5 = new Thing(color(215,255,255,191),40,50,5);
  myThing6 = new Thing(color(225,255,255,191),50,60,6);
  myThing0 = new Thing(color(235,255,255,191),0,r,4);
  myThing7 = new Thing(color(245,255,255,191),5,70,5);
  myThing8 = new Thing(color(255,255,255,191),15,80,6);
  myThing9 = new Thing(color(215,255,255,191),25,90,4);
  myThing10 = new Thing(color(215,255,255,191),35,100,5);
  myThing11 = new Thing(color(215,255,255,191),45,110,6);
  myThing12 = new Thing(color(215,255,255,191),55,120,4);
  myThing13 = new Thing(color(215,255,255,191),65,130,5);
  myThing14 = new Thing(color(215,255,255,191),75,140,6);
  myThing15 = new Thing(color(215,255,255,191),85,150,3);

   
   
  
  
}

void draw() {
  fade();
  myThing1.moveF();
  myThing1.displayF();
  myThing2.moveF();
  myThing2.displayF();
  myThing3.moveF();
  myThing3.displayF();
  myThing4.moveF();
  myThing4.displayF();
  myThing5.moveF();
  myThing5.displayF();
  myThing6.move();
  myThing6.display();
  myThing0.move();
  myThing0.display0();
  myThing7.move();
  myThing7.displayB();
  myThing8.move();
  myThing8.displayB();
  myThing9.move();
  myThing9.displayB();
  myThing10.move();
  myThing10.displayB();
  myThing11.move();
  myThing11.displayB();
  myThing12.move();
  myThing12.display();
  myThing13.move();
  myThing13.display();
  myThing14.move();
  myThing14.display();
  myThing15.move();
  myThing15.display();

  
 
 

}

class Thing { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isnâ€™t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;

  Thing(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
 

  void display() {
    stroke(c);
    strokeWeight(1);
    fill(c);
    rectMode(CENTER);
    //ellipse(xpos,ypos,15,15);
   line(xpos, ypos,xpos+s,ypos+v);
    //triangle(xpos,ypos,xpos+45,ypos+35,xpos+5,ypos);
    if (mouseX > 10 && mouseX <width-10&& mouseY >10 && mouseY <height-10) {
  sweetspot = true;
 s= 3+mouseX/40;
 v= 8+mouseY/40;
// s= 3*mouseX/mouseY;
// v= 8*mouseY/mouseX;
 
} else { sweetspot = false;
s=3;
v=8;
}
  }
  
  void display0(){
    // noStroke();
     fill(255);
    stroke(frameCount * 3 % 255, frameCount * 5 % 255,
    frameCount * 20 % 255);
//    rectMode(CENTER);
    //ellipse(xpos,ypos,15,15);
    line(xpos, ypos,xpos+s,ypos+v);
   // triangle(xpos,ypos,xpos+45,ypos+35,xpos+5,ypos);
     if (mouseX > 10 && mouseX <width-10&& mouseY >10 && mouseY <height-10) {
  sweetspot = true;
 s= 3+mouseX/40;
 v= 8+mouseY/40;
// s= 3*mouseX/mouseY;
// v= 8*mouseY/mouseX;
 
} else { sweetspot = false;
s=3;
v=8;
}
  }
  
  void displayF(){
      stroke(c);
      strokeWeight(2);
    fill(c);
    rectMode(CENTER);
    //ellipse(xpos,ypos,15,15);
   line(xpos, ypos,xpos+s,ypos+v);
    //triangle(xpos,ypos,xpos+45,ypos+35,xpos+5,ypos);
     if (mouseX > 10 && mouseX <width-10&& mouseY >10 && mouseY <height-10) {
  sweetspot = true;
 s= 3+mouseX/40;
 v= 8+mouseY/40;
// s= 3*mouseX/mouseY;
// v= 8*mouseY/mouseX;
 
} else { sweetspot = false;
s=3;
v=8;
}
  }
    void displayB(){
      stroke(c);
      strokeWeight(3);
    fill(c);
    rectMode(CENTER);
    //ellipse(xpos,ypos,15,15);
   line(xpos, ypos,xpos+s,ypos+v);
    //triangle(xpos,ypos,xpos+45,ypos+35,xpos+5,ypos);
     if (mouseX > 10 && mouseX <width-10&& mouseY >10 && mouseY <height-10) {
  sweetspot = true;
 s= 3+mouseX/40;
 v= 8+mouseY/40;
// s= 3*mouseX/mouseY;
// v= 8*mouseY/mouseX;
 
} else { sweetspot = false;
s=3;
v=8;
}
  }
  
  void splash(){
  //fill(255);
  noFill();
  stroke(255);
  //ellipse(xpos,ypos,20,20);
  ellipse(xpos-8,ypos-5,1,1);
  ellipse(xpos+5,ypos-2,1,1);
  ellipse(xpos,ypos-8,1,1);
  }
    
  void moveF() {
    xpos = xpos + xspeed/2;
    ypos= ypos + xspeed;
    if (xpos > width) {
      xpos = 0;
      
    }
    
    if (ypos > height-F) {
      ypos = 0;
    }
  
  
  if (mouseX > 10 && mouseX <width-10&& mouseY >10 && mouseY <height-10) {
  sweetspot = true;
  xpos= xpos + mouseX/40;
  ypos= ypos +mouseY/40;
  a=50;
  b=80;
} else { sweetspot = false;
  a=60;
  b=100;
}
if(ypos == height-F){
  splash();
} 

  }
 void move() {
    xpos = xpos + xspeed/2;
    ypos= ypos + xspeed;
    if (xpos > width) {
      xpos = 0;
      
    }
    
    if (ypos > height-M) {
      ypos = 0;
    }
  
  
  if (mouseX > 10 && mouseX <width-10&& mouseY >10 && mouseY <height-10) {
  sweetspot = true;
  xpos= xpos + mouseX/40;
  ypos= ypos +mouseY/40;
  a=50;
  b=80;
} else { sweetspot = false;
  a=60;
  b=100;
}
if(ypos == height-M){
  splash();
} 

  }
   void moveB() {
    xpos = xpos + xspeed/2;
    ypos= ypos + xspeed;
    if (xpos > width) {
      xpos = 0;
      
    }
    
    if (ypos > height-B) {
      ypos = 0;
    }
  
  
  if (mouseX > 10 && mouseX <width-10&& mouseY >10 && mouseY <height-10) {
  sweetspot = true;
  xpos= xpos + mouseX/40;
  ypos= ypos +mouseY/40;
  a=50;
  b=80;
} else { sweetspot = false;
  a=60;
  b=100;
}
if(ypos == height-B){
  splash();
} 

  }
}//this end bracet bellongs to class!

void fade(){
    fill(0,0,0,b);
  rect(0,0,2*width,2*height);
}
