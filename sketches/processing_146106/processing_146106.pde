
// Uses the code from a 'simplified' option one from
// http://wiki.processing.org/w/Multiple_key_presses
// the rest is by Jack Harris of Narcissism Inc.
boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keydown = false;
int x = 0;
int y = 0;
void setup() {
    size(360,240,P3D);
}
void draw() {
    lights();
    background(55);
    if(keyup == true) {
        x = x + 1;
    }
    if(keydown == true) {
        x = x - 1;
    }
    if(keyleft == true) {
        y = y + 1;
    }
    if(keyright == true) {
        y = y - 1;
    }
    noStroke();
    fill(220);
    translate(180,120);
    rotateX(radians(x));
    rotateY(radians(y));
    box(50);
}    
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) keyup = true; 
    if (keyCode == DOWN) keydown = true; 
    if (keyCode == LEFT) keyleft = true; 
    if (keyCode == RIGHT) keyright = true; 
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false; 
    if (keyCode == DOWN) keydown = false; 
    if (keyCode == LEFT) keyleft = false; 
    if (keyCode == RIGHT) keyright = false; 
  }
}
