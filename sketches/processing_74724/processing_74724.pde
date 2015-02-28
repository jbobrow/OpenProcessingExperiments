

Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6;

class Car{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float a;


  

  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c=tempC;
    xpos=tempXpos;
    ypos=tempYpos;
    xspeed=tempXspeed;

  }
  
  void display(){
    a=random(255);
    noStroke();
   
    fill(frameCount%255,0,255,a);
    rect(xpos,ypos,40,10);
    //rectMode(CENTER);
    
  }
  
  void move(){
    xpos=xpos+xspeed;
    if(xpos>width){
      xpos=0;
    }
  }
  
}
void setup(){
  size(800,150);
  frameRate(80);

  myCar1=new Car(color(255,0,0),0,100,2);
  myCar2=new Car(color(0,255,0),0,50,1);
  myCar3=new Car(color(0,0,255),0,20,1.5);
  myCar4=new Car(color(200,0,0),0,60,3);
  myCar5=new Car(color(0,150,0),0,75,2.5);
  myCar6=new Car(color(0,0,220),0,85,5);

} 

   void mousePressed(){
   background(255,255,0);
 }
void draw(){
  background(10);
  stroke(255, random(80));
  for (int y=0; y<=height; y+=10){
    line(0,y,mouseX,mouseY);
  }

  myCar1.move();
  myCar2.move();
  myCar3.move();
  myCar4.move();
  myCar5.move();
  myCar6.move();
  
  myCar1.display();
  myCar2.display();
  myCar3.display();
  myCar4.display();
  myCar5.display();
  myCar6.display();
  
 }


    
    
    
    
    
    
    

