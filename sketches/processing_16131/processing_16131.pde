
void setup() {
  size(1000,1000);
  background(255);
   smooth();
}
void draw (){
  strokeWeight(.5);
  stroke(0);
  line(random(width),random(height),random(width-50),random(height-50));
  fill(255,random(255));
  strokeWeight(3);
  ellipse(width/2, height/2, random(100), random(100));
}
void keyPressed() {
 background(255);
}

void mouseClicked() {
 background(255);
}



