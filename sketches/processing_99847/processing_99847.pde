
Car myCar;
Mark[] marks = new Mark[13];
Truck myTruck;
Bike myBike;
PImage myImage;
PImage my2;
PImage my3;

void setup() {
  size(800, 500);
  background(255);
 for (int i = 0; i < marks.length; i++) {
    marks[i] = new Mark(i*65);}
 
  myCar = new Car(loadImage("redcar.png"));
  myTruck = new Truck(loadImage("yellowcar.png"));
  myBike = new Bike(loadImage("bike.png"));
  
  
}


void draw() {
  fill(0);
  rect(width/4, 0, width/2, height);// road
  
    for (int i = 0; i < marks.length; i++) {
    marks[i].display();
    marks[i].travel();
  }
  
  
  
  myCar.display();
  myCar.travel();

  myTruck.display();
  myTruck.travel();

  myBike.display();
  myBike.travel();
  if (myCar.collision(myTruck)){
    myCar.change();
    myTruck.crash();
    
  }
  if (myCar.collision(myBike)){
    myCar.change();
    myBike.crash();
  }
  
  
}


  
class Vec{
  int xpos;
  int ypos;
  int wid;
  int hig;
  int yspd;
  PImage myImage;
  
  Vec (PImage tempmyImage){
    myImage = tempmyImage;
    xpos = int(random(width/4,(3*width/4)-wid));
    ypos = -100;
    wid = 75;
    hig = 75;
    yspd = int(random(2,7));
  }
  
  void display(){
    image(myImage,xpos,ypos,wid,hig);
  }
  
  void travel(){
    ypos = ypos + yspd;
    if( ypos > height){
      ypos = -100;
      yspd = yspd*0;
    }
  }
    
    void crash(){
      yspd = yspd *0;
    }
}
class Bike {
  int xpos;
  int ypos;
  color c;
  int yspd;
  int wid;
  int hig;
PImage my3;

  Bike(PImage my3_) {
    my3 = my3_;
    xpos = (width/3)*2;
    ypos = 0;
    c = color(0, 0, 216);
    yspd = 10;
    wid = 75;
    hig = 100;
  }

  void display() {
    fill(c);
    image(my3,xpos, ypos, wid, hig);
  }

  void travel() {
    ypos = ypos + yspd;
    if (ypos > height){
      ypos = -100;
  }
}
void crash(){
  yspd = yspd * 0;
}
}
class Car {
  int xpos;
  int ypos;
  color c;
  int spd;
 int wid;
 int hig;
 PImage myImage;
 
 PFont Font = createFont(" Times New Roman", 22, true);
 

  Car(PImage tempmyImage) {
    myImage = tempmyImage;
    xpos = width/2;
    ypos = height/2;
    c = color(165, 3, 6);
    spd = 10;
    wid = 100;
    hig = 150;
    
  }

  void display() {
    fill(c);
    image(myImage,xpos, ypos, wid, hig);
    
    
  }
  
  void travel(){
    if (keyPressed == true) {

      if (keyCode == LEFT) {
        xpos = xpos - spd;
        if (xpos<= 190) {
          xpos = 190;
        }
      }
      if (keyCode == RIGHT) {
        xpos = xpos + spd;
        if (xpos >= 500) {
          xpos = 500;
        }
      }
      if (keyCode == UP){
        ypos = ypos - spd;
        if(ypos <= 0){
          ypos = 0;
        }}
        if (keyCode == DOWN){
          ypos = ypos + spd;
          if(ypos >= 425){
            ypos = 425;}}
       
    }
  }

  boolean collision(Truck myTruck){
   
   if(xpos+ wid > myTruck.xpos && xpos+wid < myTruck.xpos + myTruck.wid/*OKAY */ && ypos+hig > myTruck.ypos && ypos < myTruck.ypos + myTruck.hig  ){
     return true;
   }
   else {
     return false;}
     
 
     
    
    
    
    
    
   
  }
  
  boolean collision( Bike myBike){
    if(xpos+ wid > myBike.xpos && xpos+wid < myBike.xpos + myBike.wid/*OKAY */ && ypos+hig > myBike.ypos && ypos < myBike.ypos + myBike.hig  ){
     return true;
   }
   else {
     return false;}
  }
    
    void change(){
      String modelString = " game over";
      textAlign (CENTER);
      textFont(Font);
      text(modelString,100,100,40);
    
  
    
    if (keyPressed == true) {

      if (keyCode == LEFT) {
        spd =  spd*0;
        if (xpos<= 200) {
          xpos = 200;
        }
      }
      if (keyCode == RIGHT) {
        spd = spd*0;
        if (xpos >= 550) {
          xpos = 550;
        }
      }
      if (keyCode == UP){
        spd = spd*0;
        if(ypos <= 0){
          ypos = 0;
        }}
        if (keyCode == DOWN){
          spd = spd*0;
          if(ypos >= 425){
            ypos = 425;
          }
          }
    }
    }
}
  
    
    
    
    
  





class Mark {
  int xpos;
  int ypos;
  color c;
  int yspd;

  Mark(int ypos_) {
    xpos = width/2;
    ypos = ypos_;
    c = color(205);
    yspd = 5;
  }

  void display() {
    fill(c);
    rect(xpos, ypos, 10, 40);
  }

  void travel() {
    ypos = ypos + yspd;
    if(ypos > height+20){
      ypos = -120;
      
  }
}
}
class Truck {
  int xpos;
  int ypos;
  color c;
  int yspd;
int wid;
int hig;
PImage my2;

  Truck(PImage my2_) {
    my2 = my2_;
    xpos = width/3;
    ypos = 0;
    c = color(255, 255, 0);
    yspd = 4;
     wid = 100;
     hig = 125;
  }

  void display() {
    fill(c);
    image(my2,xpos, ypos, wid, hig);
  }

  void travel() {
    ypos = ypos + yspd;
    if (ypos > height){
      ypos = -100;
  }
}

void crash(){
  yspd = yspd * 0;
}
}


