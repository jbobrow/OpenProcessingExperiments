
int divisor = 10;
float dim;


void setup () {
  size (600, 800, P3D);
}

void draw () {
  translate (mouseX, mouseY);
  translate (-width/2,-height/2);
 

  for (int x=width/divisor; x<= width; x+= width/divisor) {
    for   (int y = height/divisor; y <= height; y+= height/divisor) {
      fill(random (255), random (255), random (255), 20);
    //  alpha (random (80));
      dim= (random (150));
      ellipse (x, y, dim, dim);
      //delay (1);
    }
  }
  if (mousePressed){
   background (220); 
  }
 
}





