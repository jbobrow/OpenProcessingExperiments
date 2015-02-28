
int circleSize=0;

void setup () { 

  size(1000, 360);
  smooth();
  strokeWeight(3);

  
  stroke(87);
  line(0, 25, 975, 25);
  stroke(87);
  line(0, 75, 975, 75);
  stroke(87);
  line(0, 125, 975, 125);
  stroke(87);
  line(0, 175, 975, 175);
  stroke(87);
  line(0, 225, 975, 225);
}


void draw () {
  if (mousePressed) {
    strokeWeight(3); 
    fill( random(255), random(255), random(255) );
    ellipse( mouseX, mouseY, circleSize, circleSize);
    circleSize=circleSize+1;
    
  } else 
  {
    circleSize=0;
  }

}









  





