

//Mid-Term Sketch
//by Brian Pittman
//My project includes: VARIABLES, SPEED, & TIME
//THE IMAGE OF THE ROOSTER WAS ACQUIRED FROM: www.themorningnews.com
//This information is acquired from the "Processing"(Programming handbook) and Professor Nick Lally

//Declare the image
PImage rooster;
//Declare the variables of type float
//Assign values
float y1 = 300;
float y2 = 150;
float y3 = 100;
float y4 = -300;

float vy = 0;
float vx = 0;
float x = 10;
float y = 10;
float velocity = 0.0;
float radius = 15.0;
float wind = .028;
float friction = -.99;
float acceleration = 0.3;


float frictionX = .90;

float gravity = .050;

float mili, seconds, minutes, hours;

void setup(){
size(600, 600);
  
background(0);

strokeWeight(10);
stroke(145); 
ellipseMode(RADIUS);
colorMode(HSB, 360, 100, 100);

}

void draw(){

float speed = dist(mouseX, mouseY, pmouseX, pmouseY);
//Option for mouse speed
float diameter = speed * 0.0;




//Ellipse location



//atan(y,x) function used to calculate the angle from any point to the coordinate (0,0).

//Top triangle
ellipse(300, 300, mouseX, mouseY);
float angle = atan2(mouseY-y1, mouseX-x);
pushMatrix();
translate(x, y1);

rotate(angle); 
triangle(-20, -100, 20, 0, -20, 100);//Size of triangle
  
   
popMatrix();
pushMatrix();
//The shapes change color every second
//Bottom triangle
 float angle2 = atan2(mouseY-(y2), mouseX-x);
 translate(x, y2);
 rotate(angle2);
 triangle(-20, -80, 20, 0, -20, 80);
//Free triangles
 translate(x, y3);
 rotate(angle);
 triangle(-20, -80, 20, 0, -20, 80);
 
 translate(x, y4);
 rotate(angle);
 triangle(-20, -80, 20, 0, -20, 80);
 popMatrix();
 
  rooster = loadImage("rooster.png");
  tint(0, 153, 204); //Tint rooster
image(rooster, x, y, 100, 100);

  

image(rooster, mouseX, mouseY, random(width), random(height));

translate(300, 300);
//Introduction of time
//int s = second(); RETURNS VALUES FROM 0 TO 59
//int m = minute(); RETURNS VALUES FROM 0 TO 59
//int h = hour(); RETURNS VALUES FROM 0 TO 23

float m = map(minute(), 0, 100, 0, 300);
float s = map(second(), 0, 100, 0, 300);
float h = map(hour(), 0, 100, 0, 600);
     
      fill(s, m, h);
      rooster = loadImage("rooster.png");
ellipse(width/2, height/2, random(width),random(height));
      image(rooster, s, 100, s, 240);
      image(rooster, m, 60, m, 240);
      image(rooster, h, 100, h, 240);
      //println(h + ":" + m + ":" + s);
      
  vy += gravity; // OR vy = vy + gravity;
  vx += wind;
  vy += wind;
  vx += frictionX;

  x += vx;
  y += vy;
//Conditionals allow a program to make decisions about which lines of code run & which do not.
//The if  structure is used in Processing to make these decisions: 
//if(test){ 
//statements
//}
 if(y > height){
  y = height;
 
 vy *= friction;
 vx *= friction;

  }
  if(x > width){
    x = width;
    vx = -vx;

translate(150, 300);

mili = millis();
seconds = int(mili/60000)%60;
minutes = mili/60000;
hours = mili/3600000;

seconds = map(seconds, 0, 60, 0, 600);
rotate(radians(seconds)); 
  }

}
//Image will return if you wait
void mouseDragged(){
  vy += .5;

    }


