
// This sketch builds on a prior work, "Year after year", created by The Serendipitous Cacophonies
// http://studio.sketchpad.cc/sp/pad/view/ro.9lcCKnElIBNSk/rev.801
 
 
 
// This sketch builds on a prior work, "Modified clone of 'Multiples'", created by The Serendipitous Cacophonies
// http://studio.sketchpad.cc/sp/pad/view/ro.91QE$ex8fptVL/rev.40
 
 
 
// This sketch builds on a prior work, "Multiples", created by Keith O'Hara
// http://studio.sketchpad.cc/sp/pad/view/ro.9DxhvE$vqW7Bm/rev.2
 
 
 
 
// Keith O'Hara <kohara@bard.edu>
// Mar 2012
 
void setup()
{
  size(400, 300);
  background(128);
  smooth();
}
 
void draw() {
  randomSeed(5);
  angle = radians(random(map(mouseY, 0, height, 0, TWO_PI/10)*frameCount)) % TWO_PI;          
  /*fill(255*sin(angle/2), 255*sin(angle/4), 255*sin(angle/8));*/
  rect(-1, -1, width+1, height+1);
  float r = 50;
 
  delta = 100
  for (int x = delta/2; x < width; x += delta/2) {
    for (int y =delta/2; y < height; y += delta/2) {
      pushMatrix();
      phase = radians(random(map(mouseX, 0, height, -1, 1)*frameCount)) % 2*PI;
      translate(x + mouseX*sin(phase)/4, y + mouseY*cos(phase)/4);
      noStroke();
      rotate(random(angle));
      fill(255*abs(sin(angle+phase)) + mouseX/width*255, 255*abs(sin(angle*2+phase)) + mouseY/height*255, 255*abs(sin(angle*3+phase)) + mouseX/width*255 - mouseY/height*255);
      ellipse(0, 0, r, r*sin(angle+phase));
      fill(255*abs(sin(angle+phase)), 255*abs(sin(angle*2+phase)), 255*abs(sin(angle*3+phase)));
      ellipse(0, 0, r*0.7, r*.7*sin(angle+phase));
      popMatrix();
    }
  }
}
