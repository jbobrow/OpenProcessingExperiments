
float x = 300;
float y = 300;
float angle = 0.0;
float scaleVal = 55.0;
float weight = 4.0;
void setup (){
size (300, 300);
background (#B8F0EC);
smooth ();
}

void draw (){
  strokeWeight (weight);
  frameRate (60);
  line (x, 0, 0, y);
  x = x + cos (angle) * scaleVal;
  y = y + sin (angle) * scaleVal;
  weight = weight/2;
}




