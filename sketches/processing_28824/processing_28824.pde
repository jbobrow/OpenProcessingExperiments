
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
 
RFont font; 
void setup() {
  size(600,500);
  smooth();
  noStroke();
  fill(255);
   
  RG.init(this);
 
  font = new RFont("Smirnof.ttf");
  font.setAlign(RFont.CENTER);
  font.setSize(120);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH); 
}
 
void draw() {
   
  float n = noise(0.15);
  float a = map(n, 0, 1, mouseX, -mouseY);
pushMatrix();
   translate(90, 0);
  strokeWeight(.15);
  noFill();

   
 for(int x = 0 ; x < width; x+=n++) {
    for(int y = 0 ; y < height; y+=n++) {
      line(x, y, a+x, a+y);
      rotate(radians(a));
}
  }
popMatrix();


 text("analog", 175,350);
 stroke(255);
 strokeWeight(6);
 line(200, 375, 440, 375);
}


