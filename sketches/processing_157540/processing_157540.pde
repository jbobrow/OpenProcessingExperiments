
int p = 0;
int m;
int mm=1 ;
int y;
int yy=1;
void setup () {
  size (333, 333);
}
void draw() {
  p++;
  m+=mm;
  y+=yy;
  background (p, p, p);
  strokeWeight(5);
  stroke (random(255));
  if(y>166 || y<0) {yy=yy*-1;}
  line((0-y), (0-y), (width/2+y), (height/2+y));
  stroke (random(255));
  line(width, 0, (width/2), (height/2));
  stroke (random(255));
  line(width/2, height/2, width/2, height);

  if (m>111 || m<0) {
    mm=mm*-1;
  }
  stroke (random(255));
  line((width/3+m), 0, (width/3+m), height);
  stroke (random(255));
  line((width*2/3-m), 0, (width*2/3-m), height);
  stroke (random(255));
  line(0, (height/3+m), width, (height/3+m));
  stroke (random(255));
  line(0, (height*2/3-m), width, (height*2/3-m));
}
int p = 0;
int m;
int mm=1 ;
int y;
int yy=1;
void setup () {
  size (333, 333);
}
void draw() {
  p++;
  m+=mm;
  y+=yy;
  background (p, p, p);
  strokeWeight(5);
  stroke (random(255));
  if(y>166 || y<0) {yy=yy*-1;}
  line((0-y), (0-y), (width/2-y), (height/2-y));
  stroke (random(255));
  line(width, 0, (width/2+y), (height/2-y));
  stroke (random(255));
  line(width/2, height/2+y, width/2, height);

  if (m>111 || m<0) {
    mm=mm*-1;
  }
  stroke (random(255));
  line((width/3+m), 0, (width/3+m), height);
  stroke (random(255));
  line((width*2/3-m), 0, (width*2/3-m), height);
  stroke (random(255));
  line(0, (height/3+m), width, (height/3+m));
  stroke (random(255));
  line(0, (height*2/3-m), width, (height*2/3-m));
}
