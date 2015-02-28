
float col = 200;
void setup() {
  size(600, 600);
  background(255);
  noFill();
  colorMode(HSB);
  translate(width/2,height/2);
  rectMode(CENTER);
  drawRect(0,0, 250,250);
}

void drawRect(float x,float y, float w,float h){
  if(w > 1){
    stroke(noise(col)*255,255,200);
    col+= 0.01;
rect(x,y,w,h);
PVector a,b,c,d;
a = new PVector(x,y);
a.add(w/2,h/2,0);
b = new PVector(x,y);
b.add(-w/2,-h/2,0);
c = new PVector(x,y);
c.add(-w/2,h/2,0);
d = new PVector(x,y);
d.add(w/2,-h/2,0);
w = w/2;
h = h/2;
rect(a.x,a.y,w,h);
rect(b.x,b.y,w,h);
rect(c.x,c.y,w,h);
rect(d.x,d.y,w,h);
drawRect(a.x,a.y,w,h);
drawRect(b.x,b.y,w,h);
drawRect(c.x,c.y,w,h);
drawRect(d.x,d.y,w,h);
  }
}


