
float c1 = 0;
float c2 = 255;

float c1dir = 0.1;
float c2dir = -0.1;

void setup() {
 size(200, 200); 
}

void draw() {
 noStroke();

 fill(c1, 0 , c2);
 rect(0, 0, 100, 200);
 
 fill(c2, 0, c1);
 rect(100, 0, 100, 200);
 
 c1 = c1 + c1dir;
 c2 = c2 + c2dir;
 
 if( c1 < 0 || c1 > 255) {
  c1dir *= -1; 
 }
 
 if (c2 < 0 || c2 > 255) {
   c2dir *= -1;
 }
 
}
