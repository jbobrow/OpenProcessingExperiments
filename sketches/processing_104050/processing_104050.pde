
float[][] data;
String[] name;
String[] level;
float D=200;
float []d;
PFont f;
int namenum=0;
String[] rows ;
float angle;
float[] cdata_;

void setup() {
  background(255);
  size(500, 500);
  rows = loadStrings("data.csv") ;  
  level = subset(split(rows[0], ","), 1);
  angle = PI*2/(level.length);  
  data = new float[rows.length-1][];
  name = new String[rows.length-1];
  for (int i=0;i<rows.length-1;i++) {
    data[i] = parseFloat(subset(split(rows[i+1], ","), 1));
    name[i] = split(rows[i], ",")[0];
  }
}

void mousePressed() {
  if (namenum<=name.length-2) namenum++;
  else namenum=0;
}
void draw() {
  background(255);

  drawaxis();
  drawthis(namenum);
  println(cdata(namenum));
}

float[] cdata(int namenum_) {
  cdata_ = new float[level.length];
  cdata_ = data[0];
  float[] target = new float[level.length];
  target = data[namenum_];

  for (int i = 0;i<=level.length-1;i++) {
    cdata_[i] +=(target[i]-cdata_[i])*0.01;
    
  }
  
  return cdata_;
}

void drawaxis() {
  float[] topx=new float[level.length];
  float[] topy=new float[level.length];

  for (int i =0 ;i<=level.length-1;i++) {
    topx[i]=D*sin(angle*i);
    topy[i]=D*cos(angle*i);
  }
  pushMatrix();
  translate(width/2, height/2);
  noFill();
  stroke(0);
  beginShape();
  vertex(topx[0], topy[0]);
  vertex(topx[1], topy[1]);
  vertex(topx[2], topy[2]);
  vertex(topx[3], topy[3]);
  vertex(topx[4], topy[4]);
  vertex(topx[5], topy[5]);
  endShape(CLOSE);
  popMatrix();
}



void drawthis(int namenum_) {
  float[] namex = new float[level.length];
  float[] namey = new float[level.length];

  for (int i = 0;i<=level.length-1;i++) {
    namex[i]=map(cdata(namenum_)[i], 0, 10, 0, D)*sin(i*angle);
    namey[i]=map(cdata(namenum_)[i], 0, 10, 0, D)*cos(i*angle);
  }

  pushMatrix();
  translate(width/2, height/2);
  fill(255, 255, 0);
  stroke(255, 255, 0);
  beginShape();

  vertex(namex[0], namey[0]);
  vertex(namex[1], namey[1]);
  vertex(namex[2], namey[2]);
  vertex(namex[3], namey[3]);
  vertex(namex[4], namey[4]);
  vertex(namex[5], namey[5]);
  endShape(CLOSE);
  popMatrix();
}



