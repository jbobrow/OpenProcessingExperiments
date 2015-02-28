
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: SHIN seo i
 // ID: pcwkdrn 201420084


float angle;

void setup(){
size (600, 600);
background (#FFB0CE);
smooth();
noLoop();
 }

void draw(){
  
  for (int i = 25; i< width; i = i + 60){
    for (int j = 25; j< width; j = j + 60){
      rectMode(CENTER);
      rect(j,i,10,10);  
      noStroke();
      ellipse(j, i, 50, 50);
      fill(255,41,195); 
      rect(j,i,20,20); 
      fill(255,255,255);  
      stroke(255);
     
    }
  }
 }

