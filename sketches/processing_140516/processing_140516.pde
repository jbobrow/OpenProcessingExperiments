
//Jordana Bungard
//March 18,2014
//Project 2
//reptilian_germination
Walker w1;
Walker w2;
Walker w3;
Walker w4;
Walker w5;
Walker w6;
Walker w7;
Walker w8;
int diameter=50;//diameter of bouncing ball
int xdistance=diameter/2;//distance created between lines of bouncing ball
int ydistance=diameter/2;
int ydirection=1;//speed and direction of bouncing ball
int xdirection=1;
int xspeed= 10;
int yspeed= 5;
void setup(){
  size(800,600);
fill(0);
rect(0,0,800,600);
//create walker object
  w1=new Walker();
  w2=new Walker();
    w3=new Walker();
  w4=new Walker();
  w5=new Walker();
  w6=new Walker();
  w7=new Walker();
  w8=new Walker();
  frameRate(20);}
 
    

void draw() {
   ellipse(xdistance, ydistance, diameter, diameter);//bouncing ball
  xdistance += xspeed*xdirection;//makes the ball move
  ydistance += yspeed*ydirection;
 //in accordance with bouncing ball
   //bottom hit white dot appears in random position
  if (ydistance>height-diameter/2) {
    ydirection = -ydirection;//changes direction
    fill(255);
  }
 
  //top hit yellow dot appears in random position
  if (ydistance<0+diameter/2) {
    ydirection=-ydirection;//changes direction
        fill(255,255,0);
  }
 
  //right hit random colored dot appears in random position
  if (xdistance>width-diameter/2) {
    xdirection = -xdirection;//changes direction
        fill(random(100));
  }
 
  //left hit random colored dot appears in a random position
  if (xdistance<0+diameter/2) {
    xdirection=-xdirection;//changes direction
        fill(random(255));
         
  }


w1.walk();
w1.display();
w2.walk();
w2.display();
w3.walk();
w3.display();
w4.walk();
w4.display();
w5.walk();
w5.display();
w6.walk();
w6.display();
w7.walk();
w7.display();
w8.walk();
w8.display();
}
class Walker{
  float x;
  float y;
  int s;
  
  //constructor;
  Walker(){
  x=height/2;//starting point and stopping point
  y=width/2;
  s=10;//size of ellipses
}

void display() {
  noStroke();
  ellipse(x,y,s,s);//(height/2,width/2,10,10)
  fill(random(255),150 ,30,10);
  ellipse(mouseX,mouseY,s,s);//ellipse with mouse movement(holding position makes darker circle)}
}
void walk(){
  int option= int(random(4));//# of directions walkers can take
  if(option==0){//out of the random possibilities, these are the choices("if option is 0/4 x=x+s" etc)
    x=x+s;
  }else if (option==1){
    x=x-s;
  }else if (option==2) {
    y=y+s;
  }else{
    y=y-s;
  }
  x=constrain(x,0,width);
  y=constrain(y,0,height);
if (mousePressed){//if mouse pressed restarts from new position
  setup();
}}}
    
