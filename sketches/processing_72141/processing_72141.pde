
//Amber Qasir 
//Introduction to Digital Media Fall 2012
//Section A
//9-12-2012

float randomdiameter=0;

void setup() {
  size(1200, 600);
  background(0);
  smooth();
}
void draw() {

  for( int i=0; i<1000; i++){
    
    strokeWeight(1);
 smooth();
 stroke(0,20,80);
  fill(255, 5);
  if (randomdiameter<50) {
    randomdiameter++;
  }
  else {
    randomdiameter=0;
  }
  ellipse(mouseX, mouseY, randomdiameter, randomdiameter);
  ellipse(mouseX,mouseY, tan(randomdiameter), randomdiameter);
  ellipse(mouseX,mouseY, randomdiameter, tan(randomdiameter));

 strokeWeight(.0125*i);
 stroke(0,0,60);
  fill(20,100,70*i);
  triangle(i, 600, 600, 0, 600, 600);
  
 
}

}
