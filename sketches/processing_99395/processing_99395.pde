
/* 
 Simple spring with friction.
 */
import processing.serial.*;

float xflex = 0;        //a0
float ypot = 0;     //a1
float mod=1;
Serial myPort;

//////////////////////////////////////////////////////////

float inc= TWO_PI; //random number for the sin waves bend.
float b=1.11;     //yeah value of b.
float c=1.111;     //value of c.
float q=20; //this is a value for the size of the cirlces.




Ball myBall;
float spring = .01;
float targetX = width/2;
float targetY = height/2;
float vx;
float vy;
float friction = .95;
float gravity = 100;
int ballRadius = 15;


void setup() {
  size(800 , 800);
  noStroke();
  smooth();
  myBall = new Ball(ballRadius);
/////////////////////////////////////////////////////
//  myPort = new Serial(this, Serial.list()[0], 9600);
  // don't generate a serialEvent() unless you get a newline character:
 // myPort.bufferUntil('\n');



}

void draw() {
  background(0,ypot/2,friction/3);
  myBall.display();
  display();
//////////////////////////////////////

//if (mousePressed==true){
//saveFrame("###videogame.png"); 
//}

//ellipse(xflex, ypot, 20, 20);

  }

  void serialEvent(Serial myPort) { 
    // get the ASCII string:
    String inString = myPort.readStringUntil('\n');

    if (inString != null) {
      // trim off any whitespace:
      inString = trim(inString);
      // split the string on the commas and convert the 
      // resulting substrings into an integer array:
      float[] colors = float(split(inString, ","));
      // if the array has at least three elements, you know
      // you got the whole thing.  Put the numbers in the
      // color variables:
      if (colors.length >=2) {
        // map them to the range 0-255:
       xflex = map(colors[0], 0, 1023, 0, 50);
        ypot = map(colors[1], 0, 1023, 0, 100);
        //println(colors[0]);
        //println(colors[1]);








}

    }}




void display() {
  float dx = mod+mouseX-myBall.x;
  float dy = mouseY - myBall.y;
  
 if (xflex > 12 && mod < 1199 ){
  mod=mod+10; 
 }

if(mod>1000){
 mod=-1000 ;
}

  
  
  println(xflex);
//  println(dx);
  
  
  float ax = dx * spring;
  float ay = dy * spring;
  vx += ax;
  vy += ay;
  vx *= friction;
  vy *= friction;
  myBall.x += vx;
  myBall.y += vy;
   for(int i = 1; i <  400; i++)    //for loops, i starts at 0, and increases until it gets to <400, then it restarts.
{
float r = (i/2)+ypot*3-myBall.y;        // takes that i-loop number and -400 as ranges for the random value of r.
fill(100+r,i+100,i);  //color is gradieted because it calls to the forloop to determine its color
rect(-myBall.x+sin(b),myBall.y/10+i+r,q*1,q*1);//creates circles on the path of a sin wave.
fill(100+r,i-100,i); 
rect(myBall.x+sin(b),myBall.y/10+i+r,q*2,q*2);//creates circles on the path of a sin wave.

translate(500,800);
fill(10+r,i+100,i,50+i);  //color is gradieted because it calls to the forloop to determine its color
rect(-myBall.x+sin(b),-myBall.y+i+r,q*5,q*5);//creates circles on the path of a sin wave.

translate(-200,200);
rotate(TWO_PI/PI); // this makes the circles spread out
fill(10+ypot,i+100,i,mod*i);  //color determined by x and y location, because of for loop
rect(-myBall.x+sin(b),-myBall.y/100+i+r,q*1,q*1); //create and ellipse similar to the one above but different color
fill(100,i,i);
rect(-myBall.x+sin(b),myBall.y/100+i+r,q*2,q*2); //create and ellipse similar to the one above but different color

rotate(TWO_PI);// i really dont know what this actually changes, but it moves the circles to different paths
translate(-1000,-200);

b= b-inc;// makes and c umm take on the value of inc, the sin wav
c= b-inc;


}
  line(myBall.x, myBall.y, mouseX, mouseY);
}

class Ball {  

  float x, y;
  int ballRadius;

  Ball(int tempBallRadius) {
    ballRadius =  tempBallRadius; 
    this.x = x;
    this.y = y;
  }

  //methods
  void display() {
    ellipseMode(CENTER);
    fill(0,0,0,0);
    ellipse(x, y, ballRadius*2, ballRadius*2);
  }
}



