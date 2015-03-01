
ArrayList<PVector> a = new ArrayList();
int b, x, y, s, fx, fy, d;
int[] dx= {
  -2, 0, 2, 0
};
int[] dy= {
  0, -2, 0, 2
};
void setup() {
  size(400, 400);
  rectMode(CENTER);
  textAlign(CENTER);
  reset();
}
void reset() {
  while (a.size ()>0)a.remove(0);
  b=20;
  x=width/2;
  y=height/2;
  s=-1;
  fruit();
  d=1;
}
void fruit() {
  s++;
  b+=20;
  fx = int(random(5, width-5));
  fy = int(random(5, height-5)
    );
}
void draw() {
  background(255);
  if (keyPressed&&key==' ') {
    fill(0);
    text("Fruits eaten so far: " + s, width/2, height/2);
    return;
  }
  stroke(0, 0, 0);
  strokeWeight(2);
  for (int i=0; i<a.size ()-1; i++)
    line(a.get(i).x, a.get(i).y, a.get(i+1).x, a.get(i+1).y);
  noStroke();
  fill(255, 0, 0);
  rect(fx, fy, 7, 7);
  x+=dx[d];
  y+=dy[d];
  if (x<0||x>width||y<0||y>height||get(x, y)==color(0, 255, 0))reset();
  if (get(x, y)==color(255, 0, 0))fruit();
  a.add(new PVector(x, y, 0));
  while (a.size ()>b)a.remove(0);
}
void keyPressed() {
  if (key==CODED&&keyCode>=37&&keyCode<=40)d=keyCode-37;
}



