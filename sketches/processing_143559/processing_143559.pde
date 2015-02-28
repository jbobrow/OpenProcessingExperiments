
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name:CHOI Jihye<<------ Write your full name here!
// ID: 201420116 <<--------- Write your ID here!

void setup(){
float angle = 30;

void setup() {
  size(600, 600);
  background(255);
  colorMode(RGB, width);
   frameRate(30);
}

void draw() {
  noStroke();
  
  
  
  fill(0, 100);
  rect(0, 0, width, height);

  angle+=0.01;

  translate(width/2, height/2);
  scale (0.4);

  for (int i=0; i<width; i+=40) {
    for (int j=0; j<height; j+=40) {
      rotate(angle);

      stroke(random(255),random(255),random(255));
      strokeWeight(2);
      fill(121, 235, 225, 10);
      ellipse(i-10, j, 10, 5);
      ellipse(i-10, j, 10, 5);
      ellipse(random(i), random(j), 50, 50);
      
      pushMatrix();
      translate(i,j);
       rotate(angle*5);
    scale(0.95);
    
popMatrix(); 
    }
  }
}

