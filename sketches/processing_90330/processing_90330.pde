
float[][] nu;
int z=0;
float a, b;
int lin = 380;

void setup() {
  background(255);
  size(800, 800, OPENGL);
  smooth();
  frameRate(12);
  
  nu = new float[lin][2];
  for (int i=0;i<lin;i++) {
    for (int j=0;j<2;j++) {
      nu[i][0] = random(width);
       nu[i][1] = random(height);
    }
  }
}
void draw() {
 //fill(255,10);
 //rect(0,0,width,height);
 

  background(255);

  for (int i=0;i<lin-1;i++) {

    for (int j=0;j<lin;j++) {
      if (dist(nu[i][0], nu[i][1], nu[j][0], nu[j][1])<55) {
        stroke(0);
        strokeWeight(random(10));
        b = a + 20;
        line(nu[i][0], nu[i][1], nu[j][0], nu[j][1]);
      }
    }
  }
  for (int i=0;i<lin;i++) {
    for (int j=0;j<2;j++) {
      //fill(random(255), random(255), random(255));
      a= random(200);
      //noStroke();
      //ellipse(nu[i][0],nu[i][1],a,a);
      if (nu[i][0]>mouseX) {
        nu[i][0] = nu[i][0]+random(5)/100;
      } 
      else {
        nu[i][0] = nu[i][0]-random(5)/100;
      }
      if (nu[i][1]>mouseY) {
        nu[i][1] = nu[i][1]+random(5)/100;
      } 
      else {
        nu[i][1] = nu[i][1]-random(5)/100;
      }
    }
    b = a;
  }
  //noLoop();
}
void mouseMoved() {
  //loop();

  nu[z][0] = mouseX;
  nu[z][1] = mouseY;
  z=z+1;
  if (z==lin) {
    z=0;
  }
}
