


void setup() {  
size(400,400);
smooth(); 
}

void draw() {  
background(255);
cantor(10, 20, width-20);
}

void cantor(float x, float y, float len) { // draws a line that starts at a pixel coordinate (x,y) 
//with the length len
if (len >= 1) {
  line(x, y, x+len, y);
  y += 20; // moves y location down
  cantor(x, y, len/3); // first third
  cantor(x+len*2/3, y, len/3); // last third
  }
}
