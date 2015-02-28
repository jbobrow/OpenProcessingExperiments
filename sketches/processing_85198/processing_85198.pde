
// This sketch builds on a prior work, "Tile Designer", created by The Serendipitous Cacophonies
// http://studio.sketchpad.cc/sp/pad/view/ro.91QE$ex8fptVL/rev.1141
 
 
r = 1+2^(1+random(5));
 
 
void setup()
{
  size(300, 300);
  background(128);
  stroke(0);
  smooth();
}
 
void draw() {
    strokeWeight(((frameCount/(100*r)) % 8 + 1));
    tile_size =  300/r;
    for (i=0; i<=300; i+=tile_size) {
        for(j=0; j<=300; j+=tile_size) {
            if (mousePressed && (mouseButton == LEFT)) {   /* draw */   
                stroke(frameCount % 255, frameCount % 128, frameCount % 64, 70);
                translate(i, j);
                rotate(frameCount/(50*r) % TWO_PI);
                line(pmouseX, pmouseY, mouseX, mouseY);
                line(pmouseY, pmouseX, mouseY, mouseX);
                line(-pmouseX, -pmouseY, -mouseX, -mouseY);
                line(-pmouseY, -pmouseX, -mouseY, -mouseX);
                rotate(-frameCount/(50*r) % TWO_PI);
                translate(-i, -j);
            }
            if (mousePressed && (mouseButton == RIGHT)) { /* erase */     
                stroke(128);
                translate(i, j);
                rotate(frameCount/(50*r) % TWO_PI);
                line(pmouseX, pmouseY, mouseX, mouseY);
                line(pmouseY, pmouseX, mouseY, mouseX);
                line(-pmouseX, -pmouseY, -mouseX, -mouseY);
                line(-pmouseY, -pmouseX, -mouseY, -mouseX);
                rotate(-frameCount/(50*r) % TWO_PI);
                translate(-i, -j);
            }
        }
    }
}
