
//Homework 2 by Greg Johnson
//click and drag cursor in different field for different color-changing variables.
int gx;
int gy;

//setup
void setup(){
  smooth();
  size(600,600);
}

void draw(){
PFont font;
// taken from reference on processing.org
font = loadFont("Archer-Bold-48.vlw"); 
textFont(font, 50); 
strokeWeight (50);
rect(300,0, 300, 600);
rect(0 ,0, 300, 600);
line(0, 300, 600, 300);
}

void mouseDragged (){
  gx=mouseX;
  gy=mouseY;
  
if(gx<300){
  fill(random(255),random(255),random(255));}
  else{ fill(gx);
  map(gx, 0, 300, 0, 255);
}

if(gy<300){
  fill(random(255),random(255),random(255));}
  else{ fill(gy);
  map(gy, 0, 300, 0, 255);
 
}
if(gx>300){
  fill(random(255),random(255),random(255));}
  else{ fill(gx);
  map(gx, 0, 300, 0, 255);
}
  
if(gy>300){
  stroke(random(255),random(255),random(255));}
  else{ stroke(gy);
    map(gy, 0, 300, 0, 255);

  }}

