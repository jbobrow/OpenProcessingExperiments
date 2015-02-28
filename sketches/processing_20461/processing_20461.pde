
PImage a;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
PImage m;
PImage n;
PImage o;
PImage p;
PImage q;
PImage r;
PImage s;
PImage t;

 
void setup() {
  size(640, 480);
  background(255);
  smooth();
  a = loadImage("1.png");
  c = loadImage("2.png");
  d = loadImage("3.png");
  e = loadImage("4.png");
  f = loadImage("5.png");
  g = loadImage("6.png");
  h = loadImage("7.png");
  i = loadImage("8.png");
  j = loadImage("9.png");
  k = loadImage("10.png");
  l = loadImage("11.png");
  m = loadImage("12.png");
  n = loadImage("13.png");
  o = loadImage("14.png");
  p = loadImage("15.png");
  q = loadImage("16.png");
  r = loadImage("17.png");
  s = loadImage("18.png");
  t = loadImage("19.png");

  noLoop();
}
 
void draw() {
  background(255);
  smooth();
   
  pushMatrix();
  translate(50, 50);
  popMatrix();
   
  pushMatrix();
  float x = random(0, width - e.width);
  float y = random(0, height - e.height);
  translate(x + e.width/4, y + e.height/4);
  float angle = random(0, 180);
  rotate(radians(angle));
  image(e, -e.width/4, -e.height/4);
  popMatrix();
   
     pushMatrix();
  x = random(0, width - p.width);
  y = random(0, height - p.height);
  translate(x + p.width/4, y + p.height/4);
  angle = random(0, 240);
  rotate(radians(angle));
  image(p, -p.width/4, -p.height/4);
  popMatrix();
  
  
  pushMatrix();
  x = random(0, width - a.width);
  y = random(0, height - a.height);
  translate(x + a.width/2, y + a.height/2);
  angle = random(0, 45);
  rotate(radians(angle));
  image(a, -a.width/2, -a.height/2);
  popMatrix();
   
  pushMatrix();
  x = random(0, width - c.width);
  y = random(0, height - c.height);
  translate(x + c.width/4, y + c.height/4);
  angle = random(0, 240);
  rotate(radians(angle));
  image(c, -c.width/4, -c.height/4);
  popMatrix();
   
  pushMatrix();
  x = random(0, width - f.width);
  y = random(0, height - f.height);
  translate(x + f.width/2, y + f.height/2);
  angle = random(0, 180);
  rotate(radians(angle));
  image(f, -f.width/2, -f.height/2);
  popMatrix();
   
  pushMatrix();
  x = random(0, width - h.width);
  y = random(0, height - h.height);
  translate(x + h.width/2, y + h.height/2);
  angle = random(0, 240);
  rotate(radians(angle));
  image(h, -h.width/2, -h.height/2);
  popMatrix();
   
   pushMatrix();
  x = random(0, width - t.width);
  y = random(0, height - t.height);
  translate(x + t.width/2, y + t.height/2);
  angle = random(0, 300);
  rotate(radians(angle));
  image(t, -t.width/2, -t.height/2);
  popMatrix(); 
  
    pushMatrix();
  x = random(0, width - g.width);
  y = random(0, height - g.height);
  translate(x + g.width/2, y + g.height/2);
  angle = random(0, 360);
  rotate(radians(angle));
  image(g, -g.width/2, -g.height/2);
  popMatrix();
  
  pushMatrix();
  x = random(0, width - i.width);
  y = random(0, height - i.height);
  translate(x + i.width/2, y + i.height/2);
  angle = random(0, 90);
  rotate(radians(angle));
  image(i, -i.width/2, -i.height/2);
  popMatrix();
   
    pushMatrix();
  x = random(0, width - d.width);
  y = random(0, height - d.height);
  translate(x + d.width/2, y + d.height/2);
  angle = random(0, 300);
  rotate(radians(angle));
  image(d, -d.width/2, -d.height/2);
  popMatrix();
   
  pushMatrix();
  x = random(0, width - m.width);
  y = random(0, height - m.height);
  translate(x + m.width/2, y + m.height/2);
  angle = random(0, 360);
  rotate(radians(angle));
  image(m, -m.width/2, -m.height/2);
  popMatrix();
   
  pushMatrix();
  x = random(0, width - n.width);
  y = random(0, height - n.height);
  translate(x + n.width/2, y + n.height/2);
  angle = random(0, 360);
  rotate(radians(angle));
  image(n, -n.width/2, -n.height/2);
  popMatrix();
   
  pushMatrix();
  x = random(0, width - r.width);
  y = random(0, height - r.height);
  translate(x + r.width/4, y + r.height/4);
  angle = random(0, 300);
  rotate(radians(angle));
  image(r, -r.width/4, -r.height/4);
  popMatrix();
   
  pushMatrix();
  x = random(0, width - o.width);
  y = random(0, height - o.height);
  translate(x + o.width/2, y + o.height/2);
  angle = random(0, 360);
  rotate(radians(angle));
  image(o, -o.width/2, -o.height/2);
  popMatrix();
  
    pushMatrix();
  x = random(0, width - k.width);
  y = random(0, height - k.height);
  translate(x + k.width/2, y + k.height/2);
  angle = random(0, 45);
  rotate(radians(angle));
  image(k, -k.width/4, -k.height/4);
  popMatrix();
   
   
  pushMatrix();
  x = random(0, width - q.width);
  y = random(0, height - q.height);
  translate(x + q.width/2, y + q.height/2);
  angle = random(0, 240);
  rotate(radians(angle));
  image(q, -q.width/2, -q.height/2);
  popMatrix();
   
  pushMatrix();
  x = random(0, width - s.width);
  y = random(0, height - s.height);
  translate(x + s.width/2, y + s.height/2);
  angle = random(0, 180);
  rotate(radians(angle));
  image(s, -s.width/2, -s.height/2);
  popMatrix();
   
  pushMatrix();
  x = random(0, width - j.width);
  y = random(0, height - j.height);
  translate(x + j.width/2, y + j.height/2);
  angle = random(0, 300);
  rotate(radians(angle));
  image(j, -j.width/2, -j.height/2);
  popMatrix();
   
   
  pushMatrix();
  x = random(0, width - t.width);
  y = random(0, height - t.height);
  translate(x + t.width/2, y + t.height/2);
  angle = random(0, 300);
  rotate(radians(angle));
  image(t, -t.width/2, -t.height/2);
  popMatrix(); 
  
  pushMatrix();
  x = random(0, width - l.width);
  y = random(0, height - l.height);
  translate(x + l.width/2, y + l.height/2);
  angle = random(0, 360);
  rotate(radians(angle));
  image(l, -l.width/2, -l.height/2);
  popMatrix();
  
}
 
void mousePressed() {
  loop();
}
 
void mouseReleased() {
  noLoop();
}



