
 Thing myThing1;
Thing myThing2; // Two objects!
Thing myThing3;
Thing myThing4;
Thing myThing5;
Thing myThing6;
Thing myThing7;
Thing myThing8;
Thing myThing9;
Thing myThing0;
int a= 50;
int b= 80;

float r= random(200);

boolean sweetspot = false;

void setup() {
  frameRate(a);
  size(200,200);
  smooth();

  myThing1 = new Thing(color(0,100,255,191),0,20,2); // Parameters go inside the parentheses when the object is constructed.
  myThing2 = new Thing(color(0,140,255,191),0,30,6);
  myThing3 = new Thing(color(0,180,255,191),0,40,4);
  myThing4 = new Thing(color(0,40,255,191),0,60,5);
  myThing5 = new Thing(color(0,80,255,191),0,80,6);
  myThing6 = new Thing(color(0,120,255,191),0,100,3);
  myThing0 = new Thing(color(0,120,255,191),0,r,4);
  myThing7 = new Thing(color(0,180,255,191),0,140,5);
  myThing8 = new Thing(color(0,180,255,191),0,160,2);
  myThing9 = new Thing(color(0,180,255,191),0,180,3);
   
   
  
  
}

void draw() {
  fade();
  myThing1.move();
  myThing1.display();
  myThing2.move();
  myThing2.display();
  myThing3.move();
  myThing3.display();
  myThing4.move();
  myThing4.display();
  myThing5.move();
  myThing5.display();
  myThing6.move();
  myThing6.display();
  myThing0.move();
  myThing0.display0();
  myThing7.move();
  myThing7.display();
  myThing8.move();
  myThing8.display();
  myThing9.move();
  myThing9.display();

  
 
 

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
    noStroke();
    fill(c);
    rectMode(CENTER);
    //ellipse(xpos,ypos,15,15);
    triangle(xpos,ypos,xpos+45,ypos+35,xpos+5,ypos-7);
  }
  
  void display0(){
     noStroke();
    fill(frameCount * 3 % 255, frameCount * 5 % 255,
      frameCount * 20 % 255);
    rectMode(CENTER);
    //ellipse(xpos,ypos,15,15);
    triangle(xpos,ypos,xpos+45,ypos+35,xpos+5,ypos-7);
  }
  
    
  void move() {
    xpos = xpos + xspeed;
    ypos= ypos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
    
    if (ypos > height) {
      ypos = 0;
    }
  
  
  if (mouseX > 10 && mouseX < 170&& mouseY >10 && mouseY <170) {
  sweetspot = true;
  xpos= xpos + mouseX/40;
  ypos= ypos +mouseY/40;
  a=15;
  b=40;
} else { sweetspot = false;
  a=50;
  b=80;
}
  }

}//this end bracet bellongs to class!

void fade(){
    fill(255,255,255,b);
  rect(0,0,400,400);
}


