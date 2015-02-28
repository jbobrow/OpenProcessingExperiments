
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65708*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int x = 0;
int y = 0;

void setup() {
  size(800, 700);
  background(255);
  smooth();
}

void draw() {
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (keyPressed) {
    if (key == 'n') {
      background(255);
    }
    if (key == 'R') {
      stroke(255, 36, 36);
    } 
    if (key == 'r') {
      stroke(255,144,144);
    }
    if (key == 'O') {
      stroke(255, 111, 0);
    }
     if (key == 'o') {
      stroke(255,168,100);
    }
    if (key == 'y') {
      stroke(255, 247, 0);
    }
     if (key == 'Y') {
      stroke(250,230,0);
    }
    if (key == 'G') {
      stroke(22, 210, 10);
    }
     if(key == 'g'){
      stroke(127,247,12);
    }
    if (key == 'B') {
      stroke(2, 102, 222);
    }
     if (key == 'b') {
      stroke(49, 226, 255);
    }
    if (key == 'v') {
      stroke(192, 2, 222);
    }
     if (key == 'V') {
      stroke(109,47,118);
    }
    if (key == 'P') {
      stroke(255, 49, 231);
    }
     if (key == 'p') {
      stroke(255,170,231);
    }
    if (key == 'a') {
      stroke(49, 255, 236);
    }
    if (key == 'e') {
      stroke(255, 255, 255);
    }
    if (key == ' ') {
      stroke(0);
    }
    if (key == 'c') {
      stroke(149, 78, 45);
    }
     if (key == 'm') {
      stroke(180,180,171);
    }
    if (key == CODED) {
      if (keyCode == UP) {
        strokeWeight(x++);
      }
      if (keyCode == DOWN) {
        strokeWeight(y);
      }
    }
  }
}

/*      KEY
 R =   red
 r =   light red
 O =   orange
 o =   light orange
 Y =   yellow
 y =   light yellow
 G =   green
 g =   light green
 B =   blue
 b =   light blue
 V =   violet
 v =   light violet
 P =   pink
 p =   light pink
 a =   aqua
   =   black 
 c =   brown
 m =   gray
 n =   new
 e =   erase
 */

