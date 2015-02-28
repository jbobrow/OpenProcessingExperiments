
PVector  p1, v1, a1, p2, v2, a2;
void setup() {
  background (12,203, 234); 
  size (800, 600);
  fill (235, 0, 255);
  v1=new PVector (4, 5);
  p1=new PVector (0, 0);
  a1=new PVector (0, 1);
  
  v2=new PVector (10,15);
  p2=new PVector (0, 0);
  a2=new PVector (0, 1);
}
void draw () {
  
//erste Kugel

  //fill (130, 180, 230, 30);
  //rect (0, 0, width, height);
  v1.add (a1);
  p1.add (v1);
  fill (255);
  ellipse (p1.x, p1.y, 20, 20);

  if (p1.y>height) {
    v1.y=-v1.y;
  }
  if (p1.x>width) {
    v1.x=-v1.x;
  }

  if (p1.x<0) {v1.x=-v1.x;};


//zweite Kugel

  v2.add (a2);
  p2.add (v2);
  fill (234, 12, 53);
  ellipse (p2.x, p2.y, 10,10);

  if (p2.y>height) {
    v2.y=-v2.y;
  }
  if (p2.y<0) {
    v2.y=-v2.y;
  }
    
  if (p2.x>width) {
    v2.x=-v2.x;
  }

  if (p2.x<0) {v2.x=-v2.x;};
}


