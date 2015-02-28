


Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
 
void setup(){
  size(400,400);
  myCar1 = new Car(color(255,0,0),0,50,random(5));
  myCar2 = new Car(color(0,255,0),0,150,random(5));
  myCar3 = new Car(color(0,0,255),0,250,random(5));
  myCar4 = new Car(color(155,30,170),0,350,random(5));

}
 
void draw(){
  background(255);
  myCar1.move();
  myCar1.display();
  myCar2.move();
  myCar2.display();
  myCar3.move();
  myCar3.display();
  myCar4.move();
  myCar4.display();
    if(myCar1.xpos >= 400)
    {
      noLoop();
      myCar1.win();
      
    }
    else if(myCar2.xpos >= 400)
    {
      noLoop();
      myCar2.win();
    }
    else if(myCar3.xpos >= 400)
    {
      noLoop();
      myCar3.win();
    }
    else if(myCar4.xpos >= 400)
    {
      noLoop();
      myCar4.win();
    }
}


 
class Car{
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
  void pause(){ 
       noLoop();
       fill(100,50);
       rect(0,0,800,800);
       fill(255);
       textSize(100);
       text("PAUSE",50,400);
}
   
  void display(){
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,30,20);
    triangle(xpos-13, ypos, xpos-35, ypos+20, xpos-35, ypos-20);
  }
   void win() {
     fill(c);
      textSize(28);
      text("WINNER!! --->", width/2, ypos+1);
    }
  void move(){
    xpos = xpos + xspeed;
    if (mousePressed || key == 'r'){
      xpos=0;
    }
    if(key == ' ')
    {
      pause();
    }
  }
}
