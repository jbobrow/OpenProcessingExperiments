
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala
 
float x=150, y=150, xLast=150, yLast=150;
float c=0.1;
int minute=0;
int hour;

void setup(){
  size(300,300);
  background(35,97,92);
  smooth();
  frameRate(1); // set the speed of the frameRate
}
 
void draw(){
   
  // coordinate generator for x and y
  x=random(20,width-20);
  y=random(20,height-20);
  
  // draw a line underneath the white line
  stroke(35,97,92);
  strokeWeight(c+c); // using c+c to change strokeWeight
  line(x,y,xLast,yLast);
  // draw a white line
  stroke(240,209,30);
  strokeWeight(c); // using c to change strokeWeight
  line(x,y,xLast,yLast);
   
  // memory of the previous coordinate
  xLast = x;
  yLast = y;
  
  // counter for the strokeWeight
  c = c + 0.1; 
  
  if (frameCount>59){
    background(35,97,92);
    c = 0.1;
    frameCount=0;
  }
  
  time(150,295); // calling void time at x,y
}

// time based on the frameCount
void time(float x, float y)
{
  noStroke();
  fill(35,97,92);
  rect(0,height-20,width,20);
  
  // display counter at x,y location  
  fill(255);
  String counter = hour+" hr "+minute+" min "+frameCount+" sec";
  textAlign(CENTER);
  text(counter,x,y);
  
  if (frameCount==59){
    minute = minute + 1;
  }
  if (minute==59){
    hour = hour + 1;
    minute = 0;
  } 
}
