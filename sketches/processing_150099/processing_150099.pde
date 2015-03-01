
PImage pia;

void setup() {
  size (600, 600);
  pia = loadImage("a.jpg");
  image (pia, 0, 0);
  smooth();
  noLoop();
}

void draw()
{
  pia = loadImage("a.jpg");
  image (pia, 0, 0);  
  strokeWeight(5);
  translate(width/2, height-10);
  branch(0);
}

void branch(int depth) {
  if (depth < 12) {
    line(0, 5, 0, -height/15);
    {
      translate(0, -height/15);
      rotate(random(-0.1, 0.1)); 

      if (random(1.0) < 0.4) {  
        rotate(0.3);
        scale(0.7);
        pushMatrix();
        branch(depth + 1);
        popMatrix();    
        rotate(-0.6);
        pushMatrix();
        branch(depth + 1);   
        popMatrix();
      } else {   
        branch(depth);
      }
    }
  }
}


void mouseReleased() {
  redraw();
} 




