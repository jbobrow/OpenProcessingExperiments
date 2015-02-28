
//Jessica
//March 17
//Homework

Rains Rain = new Rains();
int rain=1;
int speed = -5;

void setup(){
  size(500,500);
  background(220);
  noStroke();
}

void draw(){
  background(220);
  Rain.Display();
}


class Rains{
  int x;
  int y;
  int rectw;
  int recth;    
  
  Rains(){
    x=250;
    y=125;
    rectw=3;
    recth=10;
  }
  
  void Display (){
    speed = speed + rain;
    y= y+speed;
    
    fill(0,random(255),random(255),100);
    ellipse(x-50,y+50,3,10);
    ellipse(x-100,y+100,3,10);
    ellipse(x/2,y-110,3,10);
    ellipse(x,y-50,3,10);
    ellipse(x-135,y+10,3,10);
    ellipse(x-140,y+55,3,10);
    ellipse(x-120,y+67,3,10);
    ellipse(x-160,y,3,10);
    ellipse(x-170,y-70,3,10);
    ellipse(x-180,y-50,3,10);
    ellipse(x-185,y-30,3,10);
    ellipse(x+135,y-10,3,10);
    ellipse(x+140,y-55,3,10);
    ellipse(x+120,y-67,3,10);
    ellipse(x+160,y,3,10);
    ellipse(x+170,y+70,3,10);
    ellipse(x+180,y+50,3,10);
    ellipse(x+185,y+30,3,10);
  }
  
    
  }
