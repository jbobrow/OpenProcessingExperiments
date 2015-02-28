
void setup() {
  size(512,512);

}
void draw() {
  background(0);
  int stepsize = 40;
  float effect =3500.0;
  for (int a=stepsize; a < width; a += stepsize) {
    for (int j=stepsize; j < height; j += stepsize) {
      float distance = sqrt(pow(a - mouseX,2)+pow(j-mouseY,2));
      float radius = distance*distance/effect;
      radius = min(stepsize,radius);
      noStroke();
      fill(255,50);
      ellipse(a,j,radius,radius);
      
      fill(255,0,0,50);
      ellipse(j,a,radius,radius);
      
      fill(0,255,0,50);
      ellipse(a-20,j,radius,radius);
      
      fill(0,0,255,50);
      ellipse(j,a-20,radius,radius);
    }
  }
}

