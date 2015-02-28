
//Declare objects
Spin spin1;  
Spin spin2;
Spin spin3;
Spin spin4;
Spin spin5;
Spin spin6;
Spin spin7;
Spin spin8;
int rFill;

void setup() {
  size(400,400);
  smooth();
  background (0);
  spin1=new Spin(200,50,5,.001,100);
  spin2=new Spin(100,100,0,-(1), 350);
  spin3= new Spin(300,250,1,.5,217);
  spin4= new Spin(250,300,8,5,50);
  spin5= new Spin(125,220,9,1,450);
  spin6= new Spin(16,387,.25,1,55);
  spin7= new Spin(356,119,.01,1,500);
  spin8= new Spin(125,220,3,1,317);
  rFill=(0x04000000);
  frameRate(60);
}
void draw() {
  spin1.drive();
  spin1.display();
  spin2.drive();
  spin2.display();
  spin3.drive();
  spin3.display();
  spin4.drive();
  spin4.display();
  spin5.drive();
  spin5.display();
  spin6.drive();
  spin6.display();
  spin7.drive();
  spin7.display();
  spin8.drive();
  spin8.display();

}



// class name
class Spin {
  //data
  float xStart;
  float yStart;
  float angle;
  float speed;
  float span;
  color cStroke;


  //constructor with defined arguments
  Spin (float tempXStart, float tempYStart, float tempAngle, float tempSpeed, float tempSpan) {
    xStart=tempXStart;
    yStart=tempYStart;
    angle=tempAngle;
    speed=tempSpeed;
    span=tempSpan;
  }
  void display () {  //what will be displayed
   strokeWeight(5);  
  }
  void drive() {  //what will show
    float xEnd=xStart +random(cos(angle))* span;
    float yEnd =yStart +random(sin(angle))*span;
   
    stroke(random(255),random(255),random(255));
    if (keyPressed == true){
      if(key == 'r'){
       stroke(255,random(255),random(255)); //red hue
      }
      if(key == 'g'){
        stroke(random(255),255,random(255)); // green hue
      }
      if(key == 'b'){
        stroke(random(255),random(255),255); // blue hue
      }
    }
    if (keyPressed && (key == CODED)){
      if(keyCode == LEFT){
        strokeWeight(10);
      } else if (keyCode ==RIGHT){
        strokeWeight(1);
      }
  }
   
    line(xStart,yStart,xEnd,yEnd);
    
    angle+=0.1;
  }
  
}


