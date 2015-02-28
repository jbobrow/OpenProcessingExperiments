
//GLOBAL VARIABLES
int backgroundGray    = 50;     //colors
int colorWhite        = 255;
int colorBlack        = 0;
int tigerR            = 232;    //tiger color
int tigerG            = 135;
int tigerB            = 7;
int eyeR              = 187;    //eyeballs
int eyeG              = 222;
int eyeB              = 85;
int noseR             = 240;    //nose
int noseG             = 187;
int noseB             = 162;
int tongueR           = 206;    //tongue
int tongueG           = 63;
int tongueB           = 15;
int chinDiameter      = 60;
int grassR            = 137;    //grass
int grassG            = 211;
int grassB            = 68;
float beardX;
float beardY;


Tiger tiger,tiger2;
Paw paw,paw2,paw3;
Grass grass;
Flower flower;

void setup() {
  size(350,350);
  background(backgroundGray);
  smooth();
  
  tiger = new Tiger(240,210,105,115);
  tiger2 = new Tiger(100,180,85,100);
  paw = new Paw(195,285,45,25);
  paw2 = new Paw(300,295,50,30);
  paw3 = new Paw(45,235,45,25);
  grass = new Grass(250,height,250,height/2);
  flower = new Flower(250,height,10,10);
}

void draw() {
  tiger.display();
  tiger2.display();
  paw.display();
  paw2.display();
  paw3.display();
  grass.display();
  flower.display();
 }

class Tiger{
  
  //FIELDS
  float x;
  float y;
  int wide;
  int tall;
  
  //float speed = 1;
  
  //CONSTRUCTOR
  Tiger(float tempX, float tempY, int tempWide, int tempTall) {
    x = tempX;
    y = tempY;
    wide = tempWide;
    tall = tempTall;
  }
  
  //METHODS
   void display() {
     strokeWeight(1);
     //draw ears behind head
     if (frameCount <= 20) {
     fill(colorWhite);
     stroke(colorBlack);
     ellipse((x-(wide/3)),(y-(tall/2.5)),wide/4,tall/3.5);
     ellipse((x+(wide/3)),(y-(tall/2.5)),wide/4,tall/3.5);
     
     //draw head
     fill(tigerR,tigerG,tigerB);
     noStroke();
     ellipse(x,y,wide,tall);
     
     //draw chin
     ellipse(x,(y+40),wide/1.85,wide/1.85);
     } else if (frameCount <= 100) {
     //draw beard
       frameRate = 5;
       stroke(colorWhite);
       float beardX      = random(x-15,x+15); 
       float beardY      = random((y+(y/4)),(y+(y/4))+8);
       line(beardX,beardY,beardX,(beardY+10));
       beardX            = beardX + 1;
       beardY            = beardY + 1;
     }
     
     //draw white around the eyes
     noStroke();
     fill(colorWhite);
     ellipse((x-(wide/5)),(y-(tall/20)),wide/5.5,tall/4);
     ellipse((x+(wide/5)),(y-(tall/20)),wide/5.5,tall/4);
     
     //draw stripes
     fill(colorBlack);
     noStroke();
     triangle(x,(y-(tall/5)),x-10,(y-(tall/5)+3),x-7,(y-(tall/5)+6));
     triangle(x,(y-(tall/5)),x+10,(y-(tall/5)+3),x+7,(y-(tall/5)+6));
     triangle(x,(y-(tall/3.5)),x-20,(y-(tall/3.5)+5),x-17,(y-(tall/3.5)+8));
     triangle(x,(y-(tall/3.5)),x+20,(y-(tall/3.5)+5),x+17,(y-(tall/3.5)+8));
     triangle(x,(y-(tall/2.75)),x-30,(y-(tall/3)+5),x-27,(y-(tall/3)+8));
     triangle(x,(y-(tall/2.75)),x+30,(y-(tall/3)+5),x+27,(y-(tall/3)+8));
     
     //draw black around the eyes
     stroke(colorBlack);
     ellipse((x-(wide/5)),y,wide/11,tall/15);
     ellipse((x+(wide/5)),y,wide/11,tall/15);
     triangle(x-(wide/6),y-(tall/40),(x-(wide/7.75)),y+(tall/37),x-(wide/4.75),y+(tall/25));
     triangle(x+(wide/6),y-(tall/40),(x+(wide/7.75)),y+(tall/37),x+(wide/4.75),y+(tall/25));
     
     //draw eyeballs
     fill(eyeR,eyeG,eyeB);
     noStroke();
     ellipse((x-(wide/5)),y,tall/16,tall/16);
     ellipse((x+(wide/5)),y,tall/16,tall/16);
     
     //draw pupils
     fill(colorBlack);
     ellipse((x-(wide/5)),y,tall/37,tall/37);
     ellipse((x+(wide/5)),y,tall/37,tall/37);
     
     //draw nose
     stroke(colorBlack);
     line(x,y+y/5.5,x,y+y/6.5);
     noStroke();
     fill(noseR,noseG,noseB);
     rectMode(CENTER);
     rect(x,y+y/7.5,tall/15,tall/11);
     triangle(x,y+y/7,x-wide/10,y+y/10,x+wide/10,y+y/10);
     
     //draw mouth
     fill(colorBlack);
     quad(x-x/30,y+y/3.75,x-x/17,y+y/4.5,x+x/17,y+y/4.5,x+x/30,y+y/3.75);
     quad(x-x/17,y+y/4.5,x-x/11,y+y/4.25,x-x/13,y+y/3.5,x-x/30,y+y/3.75);
     quad(x+x/17,y+y/4.5,x+x/11,y+y/4.25,x+x/13,y+y/3.5,x+x/30,y+y/3.75);
     
     //draw tongue
     fill(tongueR,tongueG,tongueB);
     ellipse(x,5.79*(y/4.75),wide/3.5,tall/38);
     triangle(x,y+y/5.5,x-wide/8,y+y/4.5,x+wide/8,y+y/4.5);
     
     //draw teeth
     fill(colorWhite);
     ellipse(x-wide/10,y+y/4.65,wide/26,tall/16);
     ellipse(x+wide/10,y+y/4.65,wide/26,tall/16);
     
     //draw whiskers
     stroke(colorBlack);
     point(1.075*x,y+y/7);
     point(1.09*x,y+y/6.35);
     point(1.06*x,y+y/6);
     point(1.07*x,y+y/5.35);

     point(x/1.075,y+y/7);
     point(x/1.09,y+y/6.35);
     point(x/1.06,y+y/6);
     point(x/1.07,y+y/5.35);
     
     strokeCap(ROUND);
     stroke(colorWhite);
     line((1.075*x)+1,y+y/7,1.25*x,y+y/6);
     line((1.09*x)+1,y+y/6.35,1.275*x,y+y/5.25);
     line((1.06*x)+1,y+y/6,1.25*x,y+y/4.75);
     line((1.07*x)+1,y+y/5.35,1.265*x,y+y/4.25);
     
     line((x/1.075)-1,y+y/7,(x/1.25)-6,y+y/6);
     line((x/1.09)-1,y+y/6.35,(x/1.275)-6,y+y/5.25);
     line((x/1.06)-1,y+y/6,(x/1.25)-6,y+y/4.75);
     line((x/1.07)-1,y+y/5.35,(x/1.265)-6,y+y/4.25);
 }
}
 
 class Paw{
 
 //FIELDS
  float x;
  float y;
  int wide;
  int tall;
  
  float speed = 1;
  
//CONSTRUCTOR
Paw(float tempX, float tempY, int tempWide, int tempTall){
    x = tempX;
    y = tempY;
    wide = tempWide;
    tall = tempTall;
}
    
//METHODS
  void display() {
    strokeWeight(1);
    //draw paw
    noStroke();
    fill(tigerR,tigerG,tigerB);
    ellipse(x,y,wide,tall);
    
    //draw claws
    fill(colorWhite);
    ellipse(x,y+tall/3,wide/8,tall/2.5);
    ellipse(x-wide/4,y+tall/3,wide/8,tall/2.5);
    ellipse(x+wide/4,y+tall/3,wide/8,tall/2.5);
  }
  
// make paw 1 grow when you hover over claw
//if (mouseX == 195 && mouseY == 293) {
     
/*void move() {
     x = mouseX;
     y = mouseY;
  }*/
}

class Grass{
  
  //FIELDS
  float x;
  float y;  
  float X_2;
  float Y_2;
  
  //CONSTRUCTOR
  Grass(float tempX, float tempY, float tempX_2, float tempY_2) {
    x = tempX;
    y = tempY;
    X_2 = tempX_2;
    Y_2 = tempY_2;
  }
  
  void display() {
  // grass
  Y_2 = int(random(1,200));
  strokeWeight(random(1,2.5));
  stroke(grassR,grassG,grassB);
  strokeCap(ROUND);
  line(mouseX,y,mouseX,Y_2);
  }
}
  
  class Flower{
  
  //FIELDS
  float x;
  float y;  
  float wide;
  float tall;
  
  //CONSTRUCTOR
  Flower(float tempX, float tempY, float tempWide, float tempTall) {
    x = tempX;
    y = tempY;
    wide = tempWide;
    tall = tempTall;
  }
  
  void display() {
  // draw flowers
  if(mousePressed) {
  x = int(random(10,340));
  y = int(random(10,350));
  noStroke();
  fill(mouseX,60,mouseX);
  ellipse(x,y,wide,tall);
  }
  }
}



