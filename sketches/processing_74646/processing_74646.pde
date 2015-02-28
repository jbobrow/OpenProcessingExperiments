
// cold 
int x = 0;
int y = 0;


void setup () {
  size (400, 400,  P2D);
  strokeWeight (15);
  smooth (8);
  background (255);
}

void draw () {


if (mousePressed) {
  background (255);
 for (int y = 0; y <= height -20; y = y+ 100) {
  for (int x = 0; x <= width; x = x+ 60) {
stroke (255, 211, 31);
line (x, y,x+ 60, y+ 60);
stroke (255, 128, 31);
line (x, y + 60, x+60, y); 
  }
}
  
} else { background (255);
 for (int y = 0; y <= width; y = y+ 60) {
  for (int x = 0; x <= width; x = x+ 60) {
stroke (117, 214, 237,90);
line (x , y,x+ 60, y+ 60);


stroke (134, 250, 255, 90);
line (x, y + 60, x+60, y); 

line (x, y, x, height);
line (x, y, width, y);
  
}}
}

   

}
