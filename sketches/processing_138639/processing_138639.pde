
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;
Car myCar7;

void setup() {
  size(1000,350);
  myCar1 = new Car(color(255,0,0),0,130,random(10)); 
  myCar2 = new Car(color(0,0,255),0,220,random(10));
  myCar3 = new Car(color(0,255,0),0,70,random(10));
  myCar4 = new Car(color(0,255,155),0,40,random(10));
  myCar5 = new Car(color(155,255,0),0,100,random(10));
  myCar6 = new Car(color(255,0,255),0,160,random(10));
  myCar7 = new Car(color(255,255,0),0,190,random(10));
}

void draw() {
  background(0);
   stroke(255);
  line(490,0,490,490); //finish line
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  myCar4.move();
  myCar4.display();
  myCar5.move();
  myCar5.display();
  myCar6.move();
  myCar6.display();
  myCar7.move();
  myCar7.display();
}

class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
  c = tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  xspeed = tempXspeed;
}

void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    ellipse(xpos,ypos,30,20);
    rect(xpos-10,ypos-10,10,10);
    rect(xpos-20,ypos+10,10,10);
    rect(xpos-10,ypos+10,10,10);
    rect(xpos-30,ypos+10,10,10);
}

void keyPressed() {
noLoop(); 
fill(100, 50);
rect(0, 0, width, height);
fill(255);
text("PAUSE", 130, 110);
}
void keyReleased() {
loop(); 
 }

void race() {
display();
xpos = xpos + xspeed; 
if (xpos>width) {
fill(c); 
textSize(20);
text("1st place!!!", width/2, height-10); noLoop();
} 
}

void move() {
    xpos = xpos + xspeed;
    if (mousePressed){
      setup();
    }
  }
}
 

