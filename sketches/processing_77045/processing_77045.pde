
float angle = 0.0;
float offset = 100;
float scalar = 550;
float speed = 0.01;
float xoff = 0.01;

void setup() {
  background(220, 255, 60);
  size (1800,480
  );
}
void draw(){
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  //line(n, 0, n, height);
  stroke(100,255,100);


   float y1 = offset +sin(angle) *scalar;
  float y2 = offset +sin(angle + 0.4) *scalar;
  float y3 = offset +sin(angle + 0.8) *scalar;
  float y4 = offset +sin(angle + 1) *scalar;

  
  ellipse(-150,y1,n,n);
  //ellipse(550+n,y2,120,120);
  ellipse(n,100+y1,80,80);
   fill(100,15);
   
  //quad(20,y1+n,120,y2+n,2,y3,790+n,y4);

 angle += speed;
}
