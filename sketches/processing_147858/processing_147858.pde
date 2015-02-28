
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hyeri Kim
// ID: Hyeri Kim 201420075
 
float r;
float g;
float b;



void setup(){
  size(600,600);
  background(255);
  smooth();
  noLoop();
}

void draw(){
  for(int i=5; i<width; i=i+30){
    for(int j=10; j<height; j=j+60){
      r=random(255);
      g=random(255);
      b=random(255);
      
      
      fill(r,g,b);
      stroke(r,g,b);
      strokeWeight(random(5));
      ellipse(i,j,40,40);
      
    }
  }
}
