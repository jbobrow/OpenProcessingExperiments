
int counter;

void setup() {
  size(800,800);
  background(0);
  noStroke();
}

void draw() {
  //background(0);
  fill(0,0,0);
  rect(50,50, width, height);
  
  fill(0,0,255);
   rect(random(width), random(height),400,2);
   fill(50,205,50  );
  rect(random(width), random(height),200,3);
  fill(255,0,0);
  rect(random(width), random(height),200,4);
  fill(255,255,0);
  rect(random(width), random(height),400,5);
   fill(255,165,0);
  rect(random(width), random(height),200,6);
 
}

