
int numLines = 120;

float[] x = new float[numLines];

float[] speed = new float[numLines];

float offset =10; // Set space between lines



void setup() {
colorMode(RGB,500);
  size(500, 500);

  smooth();

  strokeWeight(1);
  //Fondo degradado
  for (int i = 0; i < 500; i++) {
  for (int j = 0; j < 500; j++) {
    stroke(i, 0, 120);
    point(i, j);
  }
}
  for (int i = 0; i < numLines; i++) {

    x[i] = i; // Set initial position

    speed[i] = 0.1 + (i / offset); // Set initial speed

  }

}



void draw() {

  background(200);

  for (int i = 0; i < x.length; i++) {

    x[i] += speed[i]; // Update line position

    if (x[i] > (width + offset)) { // If off the right,

      x[i] = -offset * 2; // return to the left

    }

    float y = i * offset; // Set y-coordinate for line
line(x[i]*2, y, x[i] + offset, y + offset);
   line(x[i]*2, y, x[i]*2 - offset, y - offset); // Draw line
    line(x[i], y, x[i] + offset, y + offset);
    line(x[i]*2, y, x[i] + offset, y + offset);
   line(x[i]*6, y, x[i]*2 - offset, y - offset); // Draw line
    line(x[i], y, x[i] + offset, y + offset); 
ellipse(x[i], y,8,8); 
ellipse(x[i], y,20,20); 
///Variable For Humans jeje
ellipse(x[i], y,mouseX,mouseY);

ellipse(y, x[i],mouseY,mouseX);
//keypress
{
if (keyPressed == true) {
    ellipse(y, x[i],random(0, 2200),1);
  } else {
    ellipse(y, x[i],0,0);
  }
  
}
fill(0,30);

  }

}


