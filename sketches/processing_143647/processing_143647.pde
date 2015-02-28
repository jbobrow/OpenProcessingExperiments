
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: JEONG Eunyeah
// ID: 201420106

void setup()
{ 
  size(600, 600);
  background(255);
}

void draw()
{
  noStroke();
  for (int i=25; i<width; i+=50) {
    for (int j=25; j<height; j+=50) {
        
      fill(140);
      strokeWeight(2);
      ellipse(i,j,50,50);
      
      fill(170);
      strokeWeight(2);
      ellipse(i, j, 40, 40);    

      fill(220);
      strokeWeight(2);
      ellipse(i, j, 30, 30);

      fill(255);
      strokeWeight(2);
      ellipse(i, j, 15, 15);
      
      fill(#D1FF67);
      strokeWeight(1);
      rectMode(CENTER);
      rect(i,j,5,5);
      rect(i,j,10,10);
    }
  }
}

