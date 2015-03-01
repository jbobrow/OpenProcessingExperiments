
import processing.video.*;
import processing.opengl.*;
PImage pix;
 /* @pjs preload="./"name.jpg"; */
int   selected = -1;  
int   pos[][] = {{10,10},{400,10},{400,300},{10,300}}; 
void setup() {
  size( 800,600, P3D); 
pix = loadImage("name.jpg");  
}

void draw() {
  background(0);
  // -------------------
  beginShape(QUADS);
    texture(pix);  
    vertex(pos[0][0], pos[0][1], 0, 0);
    vertex(pos[1][0], pos[1][1], pix.width, 0);
    vertex(pos[2][0], pos[2][1], pix.width, pix.height);
    vertex(pos[3][0], pos[3][1], 0, pix.height);
  endShape(CLOSE);
  // 
  if ( mousePressed && selected >= 0 ) {
    pos[selected][0] = mouseX;
    pos[selected][1] = mouseY;

  }
  else {
    float min_d = 15; // 
    selected = -1;
    for (int i=0; i<4; i++) {
      float d = dist( mouseX, mouseY, pos[i][0], pos[i][1] );
      if ( d < min_d ) {
        min_d = d;
        selected = i;
      }      
    }
  }
  if ( selected >= 0 ) {
    fill(255,0,0);
    ellipse( mouseX, mouseY, 15, 15 );
  }
}



