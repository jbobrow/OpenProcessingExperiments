
float r;
float theta;
float theta_vel;
float theta_acc;
float s;
float o=8;
float time = 200;
int dms =0;
float gen;
float b = 15;
 
void setup() {
  size(700, 400);
  frameRate(30);
  smooth();
  r = 20;
  theta = 0;
  theta_vel = 0;
  theta_acc =0.00001;
  frameRate(50);
  background(b);
   
}
 
void red1  (float red1) {
  fill(red1,0,0,o);
}
 
void g (float rage){
  fill (200,rage,0,o);
}
 
void smoke (float q) {
  fill(0,8);
  noStroke ();
  rect (1-width/2,1-height/2,width,height);
   
  fill (150,30);
 noStroke ();
 //rotate(mouseY);
  ellipse (mouseX+dms-width/2,mouseY+dms-height/2,gen,gen);
  loop();
}
 
void draw() {
    s = 20;
  fill(50);
  rect(height,width,0,0);
  translate(width/2, height/2);
  float x = r * cos(theta);
  float y = r * sin(theta);
  float d = 0;
  float q = 20;
  gen = random(20,100);
   
  ellipseMode(mouseX+CENTER);
  noStroke();
  fill (b,o);
  ellipse(mouseY-x,mouseX- y, s, s);
  fill (b,o);
  ellipse(d+mouseY+x,q-mouseX+ y, s, s);
  fill (b,o);
  ellipse(x,y, 16, 16);
  fill (b,o);
  ellipse(d-mouseX-x,d-mouseY- y, s, s);
  fill (b,o);
  ellipse(y-x, y, s, s);
  fill (b,o);
  ellipse(d +r-x,d-mouseY- y, s, s);
  fill (b,o);
   ellipse(d+x,y, s, s);
   fill (b,o);
   ellipse(x,r+y, s, s);
  smoke(240);
 
 d = d+2*2;
 if (gen <150) {
 gen = gen+11;
 }
if (r<=200){
  r = r+0.1;
}
  theta_vel += theta_acc;
  theta += theta_vel;
 
}               
