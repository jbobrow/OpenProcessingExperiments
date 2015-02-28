
 PImage bg;
int a; 
import processing.pdf.*;
boolean savePDF = false;

//original code from http://www.openprocessing.org/visuals/?visualID=3237

int my_width = 400; //screen width
int my_height = 400; //screen height
 
float radius = my_width/2 ; //dynamic radius, standard:(width/2)
int cenX = my_width/6 ;
int cenY = my_height/200;
 
float offset_step=1;// step to change color range
int turn = 2; //change position of rainbow
 
void setup() {
  size(400,400,P3D); 
  background(255);
  colorMode(HSB,400);
  strokeWeight(0.5);
  noFill();
  frameRate(50);
 
  bg = loadImage("image6.jpg");
  background(bg);
}
  
void draw() {
// clear screen
  noFill();
  noStroke();
  translate(0,0);
  rect(0,0,width+2,height+2);
 
  translate(width/2,height/2,0); 
//rotate screen 
 
 
//draw screen
//just a hole build with X bezier lines
// d can maximal be 360, it is then a hole
 
  for (int d = 0; d < 150; d+=5) {
    float r = radians(d - turn); // 360->2PI, 180->PI
    stroke(round(d+sin(((turn*offset_step)%180)/360.0*TWO_PI)*50-30),300,360,30);
    noFill();
    bezier(
    cenX,cenY,cenX,
    radius / 4 * cos(r), radius / 4 * sin(r) , cenX*2/3,
    radius * cos(r + HALF_PI), radius * sin(r + HALF_PI), cenX*1/3,
    radius * cos(r + PI), radius * sin(r + PI), 0
    );
 
 
  }
   
  turn++;
} 

