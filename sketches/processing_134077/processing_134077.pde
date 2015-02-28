
float a = 1000;
void setup () {
  size (500,500);
  background (206, 255, 251);
}

void draw () {
  fill (random(0,250)); 
  ellipse (width/2, height/2,a,a);
a -= 10 ;
}
