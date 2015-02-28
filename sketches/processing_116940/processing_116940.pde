
Car myCar1;
Car myCar2;
Car myCar3;
int x;  

void setup(){
  size(200,200);
  
  myCar1 = new Car(color(255,0,0),random(0,width),70,1.25);
  myCar2 = new Car(color(0,0,255),random(0,width),30,0.5);
  myCar3 = new Car(color(0,255,0),random(0,width),150,1.5);


}

void draw(){
  background(60);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  x = 0;
  
  if (myCar1.xpos > width || myCar1.xpos < 0){
      myCar1.xspeed = myCar1.xspeed * -1;
      myCar2.xspeed = myCar2.xspeed * -1;
      myCar3.xspeed = myCar3.xspeed * -1;
      myCar1.c = color(random(255), random(255), random(255)); 
  }
       if (myCar2.xpos > width || myCar2.xpos < 0){
       myCar1.xspeed = myCar1.xspeed * -1;
      myCar2.xspeed = myCar2.xspeed * -1;
      myCar3.xspeed = myCar3.xspeed * -1;
      myCar2.c = color(random(255), random(255), random(255)); 
       }
        if (myCar3.xpos > width || myCar3.xpos < 0){
       myCar1.xspeed = myCar1.xspeed * -1;
      myCar2.xspeed = myCar2.xspeed * -1;
      myCar3.xspeed = myCar3.xspeed * -1;
      myCar3.c = color(random(255), random(255), random(255)); 
        }
  int spacing = 10;
  int streetLines = width;
  stroke(255, 255, 0);
  strokeWeight(2);
  while (x <= streetLines){
      line(x, height/2, x+5, height/2);
      x = x + spacing;
  }
  
}



class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  
  void display(){
    stroke(255);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 20, 10);
  }
  
  void move(){
      xpos = xpos + xspeed;
  }
}


