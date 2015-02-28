
void setup() {
  
  size(1365,725);
  background(50,50,50);
  frameRate(6);
  
}

void draw() {

  noCursor();
  
  noStroke();
  strokeWeight(.001);
  fill(random(150),random(150),random(150));
  triangle(random(0,width), random(0,height), random(0,width), random(0,height), mouseX, mouseY);
  
  noStroke();
  strokeWeight(.001);
  fill(random(150),random(150),random(150));
  triangle(random(0,width), random(0,height), random(0,width), random(0,height), mouseX, mouseY);

  noStroke();
  strokeWeight(.001);
  fill(random(150),random(150),random(150));
  triangle(random(0,width), random(0,height), random(0,width), random(0,height), mouseX, mouseY);


 if (mousePressed) 
   background(50,50,50);
   
   
 
 
}


