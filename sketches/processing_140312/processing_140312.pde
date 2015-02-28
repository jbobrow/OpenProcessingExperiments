
int k = 1;
int j = 1;
float t;
float p;

void setup (){
  size (200, 200);
}
  
void draw () {
background(#FF00FF);
  fill(155);
rectMode(CENTER);

colorMode(HSB);
k = k+30;
fill (k,k,k,k);
 if (k > 250) {
  k = 1;
}

tint( 255, 255);
rect(100, 100, 20, 100);
ellipse (100, 70, 60, 60);
ellipse (81, 70, 60, 60);
ellipse (81, 70, 16, 32);
line(90, 150, 80, 160);
line(110, 150, 120, 160);

stroke(0);
pushMatrix();
scale(2.0);

popMatrix();
}


