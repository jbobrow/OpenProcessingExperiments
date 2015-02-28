
float x,y,x2,y2,px,py;
float nx,ny;
color c;

void setup(){
  size(500,400);
  colorMode(HSB);
  background(0);
  c = 255;
  stroke(c,20);
  nx = 0;
  ny = 10000;
  x = map(noise(nx),0,1,0,width); 
  y = map(noise(ny),0,1,0,height);
  px = x;
  py = y;
}

void draw(){
  x = map(noise(nx),0,1,0,width); 
  y = map(noise(ny),0,1,0,height);
  // c = color(sin(angle1)*255,cos(angle2)*255,255);
    for(int i = 0;i<int(random(25,50));i++){
      x2 = x + random(-50,50);
      y2 = y + random(-50,50);
      stroke(c,20);
      line(x,y,x2,y2);
    }
    stroke(c,200);
    line(x,y,px,py);
  nx+=0.02;
  ny+=0.02;
  px = x;
  py = y;
}
