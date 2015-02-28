
void setup() {
  size(500, 500);
  background(255);
 strokeWeight(0.5);
}

void draw() {
  background(255);
  int diff=constrain(floor(dist(width/2, height/2, mouseX, mouseY)), 2, width/2);
  for (int ecart=0;ecart<=width;ecart+=diff) {
    line(ecart, 0, width, ecart);
    line(0, ecart, ecart, width);  
    line(0, ecart, width-ecart, 0);
    line(500, ecart, width-ecart, width);
  }
  line(width/2-4, height/2, width/2+4, height/2);
  line(width/2, height/2-4, width/2, height/2+4); 
}
