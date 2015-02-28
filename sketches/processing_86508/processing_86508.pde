
int x,y,xs,ys;
color c;
ys=random(10)-5;
xs=random(10)-5;
x=random(250);
y=random(250);
c=color(random(255),random(255),random(255));

void setup() {  
  size(250, 250);
}

void draw() {   
  noStroke();
  fill(c,random(255));
  int d=random(20);
  ellipse(x,y,d,d); 
  x=x+xs;
  y=y+ys;
  ys=ys+.1;
  if ((x>250)||(x<0)) {xs=xs*-1;}
  if ((y>250)||(y<0)) {ys=ys*-.95;}
}
void mousePressed() {
  c=color(random(255),0,random(255));
  ys=random(10)-5;
xs=random(10)-5;
}
