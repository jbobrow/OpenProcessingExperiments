
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RFont font;

String input = "pixelgfx";
float angle = 0;
 
void setup() {
  
  size(122,74);

  noStroke();
  background(0);
  noLoop();
  colorMode(RGB, 100);
  
  RG.init(this);
  font = new RFont("visitor.ttf");
  font.setSize(10);
  translate(76,70);
  font.draw(input);
    
}
 
void draw() {
  
  for (int i = 2; i <= width; i+=12) {
     for (int y = 2; y <= height-20; y+=12) {  
      fill(random(0,70),random(40,100), random(180,255));
      rect(i, y, 10, 10);
     }
  }
}

void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

void keyPressed() {
  if (key == 'p') { saveFrame("soundsgood_####.png"); }
}


