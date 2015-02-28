
int strokeFuzz=4; 
int strokeLucidity=5; 
int lineDensity=40; 
void setup() {
  size(800, 600);
  background(0);
  frameRate(60); 
}
 
void draw() {

  smooth();
  if (mouseX != 0 && mouseY != 0)
  {
    for (int i=-100; i<=width+10; i+=lineDensity) {
      smooth();
      noFill();
      if (mousePressed && mouseButton == RIGHT) {
        line (i,height, mouseX, mouseY);
        line (i,0,mouseX,mouseY);
        strokeWeight(random(2, strokeFuzz));
        stroke(0, 245, random(0,245), random(strokeLucidity));
      }
      if (mousePressed && mouseButton == LEFT)
      {
       
        ellipse (mouseX, mouseY, 50,50);
        strokeWeight(random(strokeFuzz));
        stroke(0, 245, random(0,245), random(strokeLucidity));
      }
      if (keyPressed){
       
        background(0);
      }
    }
  }
}

