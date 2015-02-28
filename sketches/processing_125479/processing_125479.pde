

int x = 200;
float y = 500;

void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  background (0);


  for ( int j = 0; j < 600; j = j +15) {
    ellipse(mouseX, mouseY = j, sqrt(j), sqrt(j) );

       }
       
      pushMatrix();

int k = 0;
while (k < 600) {
  line(30, k, 300, k);
     rotate(radians(2));
  k = k + 5;
} 
 popMatrix();

for (int i=0; i<400; i++) {
 pushMatrix();
  for (int j=0; j<80; j++) {
   float w = (20 - j) / 2 - 9 - 3;
    line(j, 125, w, 20);
   rotate(radians(1));
   translate(0, 20);
  }
 popMatrix();
 translate(15, 0);
}
}
