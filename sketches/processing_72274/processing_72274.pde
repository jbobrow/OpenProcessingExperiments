
Pyramid myPyramid1;
Pyramid myPyramid2;
Pyramid myPyramid3;
Pyramid myPyramid4;
Pyramid myPyramid5;
Pyramid myPyramid6;
Pyramid myPyramid7;
Pyramid myPyramid8;
Pyramid myPyramid9;
Pyramid myPyramid10;
Pyramid myPyramid11;
Pyramid myPyramid12;
Pyramid myPyramid13;
float gravity=0.1;
float speed=0;

void setup(){
  size(1000,500); //Set the size of the window
  myPyramid1=new Pyramid(300,370,500,100,700,370,color(200,30,120));
  myPyramid2=new Pyramid(426,200,500,100,574,200,color(250,60,70));
  myPyramid3=new Pyramid(300,370,426,200,500,370,color(40,230,250));
  myPyramid4=new Pyramid(500,370,574,200,700,370,color(127,67,200));
  myPyramid5=new Pyramid(375,270,426,200,456,270,color(145,20,75));
  myPyramid6=new Pyramid(300,370,375,270,409,370,color(0,175,89));
  myPyramid7=new Pyramid(409,370,456,270,500,370,color(136,0,129));
  myPyramid8=new Pyramid(543,270,574,200,626,270,color(230,200,30));
  myPyramid9=new Pyramid(500,370,543,270,595,370,color(230,200,220));
  myPyramid10=new Pyramid(595,370,626,270,700,370,color(230,70,130));
  myPyramid11=new Pyramid(500,370,456,270,543,270,color(250,60,70));
  myPyramid12=new Pyramid(456,270,426,200,500,200,color(70,20,75));
  myPyramid13=new Pyramid(543,270,500,200,574,200,color(44,30,135));
}

void draw(){
  background(0);
  myPyramid1.move();
  myPyramid1.display();
  myPyramid2.move();
  myPyramid2.display();
  myPyramid3.move();
  myPyramid3.display();
  myPyramid4.move();
  myPyramid4.display();
  myPyramid5.move();
  myPyramid5.display();
  myPyramid6.move();
  myPyramid6.display();
  myPyramid7.move();
  myPyramid7.display();
  myPyramid8.move();
  myPyramid8.display();
  myPyramid9.move();
  myPyramid9.display();
  myPyramid10.move();
  myPyramid10.display();
  myPyramid11.move();
  myPyramid11.display();
  myPyramid12.move();
  myPyramid12.display();
  myPyramid13.move();
  myPyramid13.display();
}

class Pyramid{
  
  float posx;
  float posy;
  float pos2x;
  float pos2y;
  float pos3x;
  float pos3y;
  color c;
  
  Pyramid(float tempposX, float tempposY, float temppos2X, float temppos2Y, float temppos3X, float temppos3Y, color tempC){
    posx=tempposX;
    posy=tempposY;
    pos2x=temppos2X;
    pos2y=temppos2Y;
    pos3x=temppos3X;
    pos3y=temppos3Y;
    c=tempC;
  }
  
  void display(){
    stroke(0);
    fill(c);
    triangle(posx,posy,pos2x,pos2y,pos3x,pos3y);
  }
  
  void move(){
    speed=speed+gravity;
    posx=posx+0.1;
    pos2x=pos2x+0.1;
    pos3x=pos3x+0.1;
    posy=posy+speed;
    pos2y=pos2y+speed;
    pos3y=pos3y+speed;
    if (posy>height){
    speed=speed*-0.95;
    }
  }
}

    
  



