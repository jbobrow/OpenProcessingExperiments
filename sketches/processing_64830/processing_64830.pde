
//workshop_6a3
//jar in bedroom, need to add lid

void setup() {
size(800, 200);
smooth();
noLoop();
rectMode(CENTER);
}

void draw(){
  background(150);
  
  for(int i=-30; i<=width; i+=90){
    
  float jar_width = random(20, 100);
  float rect_height = random(40, 150);
  float weight = random(3, Z);
  color lid = color(random(255), random(255), random(255));
  float opening = random(5, 35);
  
  jar(i, 0, jar_width, rect_height, weight, lid, opening);
  
  }
}




void jar(float xpos,float ypos, float w, float rh, float sw, color lc, float eh){

pushMatrix();
translate(xpos, ypos);
fill(255);
rect(72, rh, w, 86);
strokeWeight(sw);
stroke(lc);
ellipse(72, rh-44, w, eh);
strokeWeight(1);
stroke(0);
fill(lc);
ellipse(72, rh+45, w, eh+4);
popMatrix();
}

