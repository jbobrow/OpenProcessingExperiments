
/*Assignment 4

Makes a grid of small lines depending on tileCount
If user moves the mouse around, the lines one the gird
points towards the cursor location
/Added stuff
insead of lines,eyeballs follow the cursor
actual assignment code has been commented out

Arturo Alviar
Janauary 10, 2014
*/

int tileCount = 20;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(0);
  for (int i = 0; i < tileCount; i++) {
    for (int j = 0; j< tileCount; j++) {
      float x, y, x2, y2, distance, len;
        x = i * (width/tileCount)+ tileCount/2;
        y = j * (height/tileCount)+ tileCount/2;
        x2 = (i * width/tileCount) + tileCount;
        y2 = (j * height/tileCount)+ tileCount;
        distance = sqrt(sq(mouseX-x) + sq(mouseY-y));
        len = sqrt(sq(x2-x) + sq(y2-y));
        x2 = (mouseX-x)*(len/distance)+x;
        y2 = (mouseY- y)*(len/distance)+y;
        stroke(random(0,255),random(0,255),random(0,255));
        //line(x, y, x2, y2);
        fill(0);
        ellipseMode(RADIUS);
        ellipse(x+tileCount/2,y+tileCount/2,tileCount,tileCount);
        ellipseMode(RADIUS);
        fill(random(0,255),random(0,255),random(0,255));
        ellipse(x2+len/2, y2+len/2, tileCount/4, tileCount/4);
    }
  }
}




