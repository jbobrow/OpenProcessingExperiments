
void setup() {
  size(800, 600);
  background(255);
  frameRate(40);
}
float x;
float y;
float a;
float c;
float linewidth;
float r, g, b;
float mx;
float my;
float mmx;
float mmy;

void draw() {
  //fill(0,3);
  //noStroke();
  //rect(0,0,width,height);
  //filter(ERODE);
  x=x+.5;
  y=y+.5;
  a=a-.5;
  c=c-.5;
  mmx=random(-200, 200);
  mmy=random(-200, 200);
  mx=mx+mmx;
  my=my+mmy;

  linewidth=abs(mx-mmx)/10;
  //strokeWeight(linewidth);
  r=random(0, 255);
  g=random(0, 255);
  b=random(0, 255);
  stroke(r, g, b);
  line(mx-mmx, my-mmy, mx, my);
  line(mx-mmx, my-mmy, mx+x, my+y);
  line(mx-mmx, my-mmy, mx+a, my+c);
  line(mx-mmx, my-mmy, mx+2*x, my+2*y);
  line(mx-mmx, my-mmy, mx+2*a, my+2*c);
  fill(r, g, b);
  ellipse(mx, my, linewidth, linewidth);

  if (mx>800) {
    mx=random(0, 800);
  }
  if (mx<0) {
    mx=0;
  }
  if (my>600) {
    my=random(0, 800);
  }
  if (my<0) {
    my=0;
  }
  if (x>20 && y>20) {
    x=0;
    y=0;
  }
  if (a<-20 && c<-20) {
    a=0;
    c=0;
  }
  if (mousePressed) {
    background(255);
    mx=mouseX;
    my=mouseY;
  }
}

void keyPressed() {
  println(key);
  if (key=='s') {
    String filename = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png";
    //This give us a unique filename for each press of "s"
    save(filename);
  }
  if (key=='b') {
    background(0);
  }
}

