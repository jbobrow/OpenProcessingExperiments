
float m = 270;
float delta = 3;
float delto = 3;
int k= 150;
float delte =100;
float r = 0;
float rotx = 0;
float roty = 0;
float rtx = 0.7;
float rty = 0.7;
float dotProduct(float x1, float y1, float z1, float x2, float y2, float z2)
{
  return x1*x2 + y1*y2 + z1*z2;
}
float mn =600;
 
void setup()
{
  size(600, 600, P3D);
  background(255);
  frameRate(45);
}
 
void draw() {
  background(0);
 
  translate(width/2, height/2, 0);
  
rotateX(30);
 for (float q = 0; q< mn; q+=1) {
    for (float deg5 = 0; deg5 < 360; deg5 += delto) {
      float d = map(q, 0, 30, 0, 50);
      float thete = radians(deg5);
      float o = d * cos(thete);
      float p = d* sin(thete);
      strokeWeight(5);
      float f = map(q, 0, 30, 100, 255);
   strokeWeight(1);
   stroke(255);
      point (o, p, q);
   point (o, p, -q);
    }
 }
 noStroke();
lights();
fill(0);
 sphere(20);
 mn-=3;              
}

