
class Car {
  color c;
  float xpos;
  float ypos;
  float xspeed;
 
   Car(color tempC, float tempXpos, float tempYpos, float tempXspeed) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  
  void display() {
    if (xpos > width-20 || xpos < 0)
      c = color(random(255),random(255),random(255));
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
 
  void move() {
    xpos = xpos + xspeed;
   }
   
}
Car[] myCar;

void setup(){
  size(500,200);
  myCar = new Car[3];
  for(int i=0;i<3;i++)
    myCar[i] = new Car(color(255),20,i*50+50,random(1,6));
}

void draw(){
  background(174);
  for(int i=0;i<3;i++){
    myCar[i].move();
    myCar[i].display();
  }
  for(int i=0;i<3;i++){
    if(myCar[i].xpos > width-10 || myCar[i].xpos < 0){
      myCar[0].xspeed*=-1;
      myCar[1].xspeed*=-1;
      myCar[2].xspeed*=-1;
    }
  }
}


