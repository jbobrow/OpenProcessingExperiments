
import processing.opengl.*;

void setup () {
  size (screen.width-100, screen.height-100, OPENGL);
  background(256, 256, 256);
}


void draw () {




  float angle = 100;
 

  float x = random(0, screen.width);
  float y = random(0, screen.height);
  smooth();
  stroke(random(0, 256), random(0, 256), random(0, 256));
  strokeWeight(15);  
  strokeJoin(ROUND);

    beginShape() ;
     for (int i =0; i<6; i++){
     vertex(x + cos(angle) *50, y+
     sin(angle)*50);
     angle+=TWO_PI/6;
     }
     
     endShape(CLOSE);
}
