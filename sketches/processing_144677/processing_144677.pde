
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: PARK Hyebin
 // ID: 201420081

float xPos = 0;
float diameter = 80;

void setup(){
size (600, 600);
smooth();
 }

void draw(){
 // background (0);
  
  xPos = xPos + 3;
  
  if (xPos > height + diameter){
    xPos = -diameter;
 }
fill(255, 0, 0);
ellipse (height/2 ,xPos, diameter, diameter);
}

