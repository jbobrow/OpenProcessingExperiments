
void setup(){
  size(500,500);
  background(0);
  strokeWeight(0);
  smooth();
  frameRate(10);

}

void draw(){
  smooth();
  noFill();
 
  stroke(random(255), random(255), random(255));
  
 bezier(250, 250, random(500), random(500), random(500), random(500), 0, 0);
  bezier(250, 250, random(500), random(500), random(500), random(500), 500, 0);
  bezier(250, 250, random(500), random(500), random(500), random(500), 0, 500);
  bezier(250, 250, random(500), random(500), random(500), random(500), 500, 500);
  bezier(250, 250, random(500), random(500), random(500), random(500), 0, 250);
  bezier(250, 250, random(500), random(500), random(500), random(500), 250, 0);
 bezier(250, 250, random(500), random(500), random(500), random(500), 500, 250);
 bezier(250, 250, random(500), random(500), random(500), random(500), 250, 500);
  fill(0);
  ellipse(250,250,100,100);

}
void keyPressed() {
if (keyCode == TAB){
  background(0);
}
}


