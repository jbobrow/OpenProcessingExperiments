
float a = 1;
float b = 1;
float c = 100;
float d = 500;
float e = 300;
float f = 300;
void setup () {
    size(600,600);
    background(125);
}
  
void draw () {
  smooth();
  noStroke();
  fill(0);
  ellipse(c, e,b*a, b*a);

  noStroke();
  fill(255);
  b = b + 0.2;
  ellipse(d, f,b*a,b*a);
   if(b > 300){
    a = a + 0.2;
  }
}
