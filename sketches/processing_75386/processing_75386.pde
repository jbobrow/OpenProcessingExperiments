
//Jordan Leung 4,5 Computer Programming 
void setup()
{
  smooth();
  background(0);
  size(500,500,P3D);
}
float x=0.001;
float y=0.001;
int w=0;
int wchange=1;
float z=0.0009;
float k=0.0009;
float zchange= 0.001;
float kchange= 0.001;
int v = 0;
float e= 1;
float j= 1;
int direction= int (random(0,4));


void draw()
{
  background(0);
  translate(250+e,250+j,0);
  fill(100,255,230);
  stroke(0);
  strokeWeight(5);
  rotateX(x);
  rotateY(y);
  lights();
  box(100+v);
 
noStroke(); 
//rotateY(-y);
//rotateX(-x);
translate(-250,-250,0);
translate(250,100,0);
rotateX(z);
rotateY(z);
fill(255-w,50,20);
sphere(50+v);

rotateY(-z);
rotateX(-z);
translate(-250,-100,0);
translate(250,400,0);
rotateX(z);
rotateY(z);
fill(w+55,w,255-w);
sphere(50+v);

rotateY(-z);
rotateX(-z);
translate(-250,-400,0);
translate(100,250,0);
rotateX(z);
rotateY(z);
fill(w+55,w,255-w);
sphere(50+v);

rotateY(-z);
rotateX(-z);  
translate(-100,-250,0);
translate(250,100,0);
rotateX(z);
rotateY(z);
fill(w,w,w);
sphere(50+v);

rotateY(-z);
rotateX(-z);
translate(-250,-100,0);
translate(400,250,0);
rotateX(z);
rotateY(z);
fill(w+55,w,255-w);
sphere(50+v);

   x=x+.01;
 y=y+.01;
 w=w+ wchange;
 z=z+ zchange;
 k= k+ kchange;
 
 if(w>255)
 {
   wchange=-1;
 }
 if(w<0)
 {
   wchange=1;
 }
 
}

void mouseDragged()
{
  if (mouseButton==LEFT)
  {

    v=v+1;
  
  }
  if(mouseButton==RIGHT)
  {
    v=v-1;
  }
}
