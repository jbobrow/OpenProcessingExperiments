
/**  KitaokaDemo 2012/12/10 by Peter Bosshard Schneider<br />
 *   This sketch is inspired by the work of Akiyoshi Kitaoka<br />
 *   (http://www.ritsumei.ac.jp/~akitaoka/index-e.html)<br />
 *   Press 't' to toggle transparency of the circles<br />
 *   Press 'g' to toggle growth of the circles<br />
 *   Click mouse to toggle manual angles adjustment<br />
 *   Horizontal mouse movement adjusts horizontal angle increment<br />
 *   Vertical mouse movement adjusts vertical angle increment<br />
 *   Press keys '1' - '5' to set stroke weight<br />
 *   Press keys '6' - '0' to change color set*/

Kitaoka[] scheiben;
float theta = 0;
int num_rows = 10;
int num_cols = 10;
float row_dist;
float col_dist;
float dot_rad;
float col_offset, row_offset;
float anginc_horz = 0.26;
float anginc_vert = 0.26;
float transparency = 255;
int rot = 50;
int gruen = 100;
int blau = 200;
boolean adjust = false;
boolean transparent = false;
boolean growth = false;

void setup() {
  size(500, 500, JAVA2D);
  //size(displayWidth,displayHeight,JAVA2D); //Present in fullscreen mode
  background(0);
  row_dist = (height/(num_rows+1));
  col_dist = row_dist;
  col_offset = (width-((num_cols-1)*col_dist))/2.0;
  row_offset = (height-((num_rows-1)*row_dist))/2.0;
  dot_rad = height/(num_cols+1)*0.35;
  scheiben = new Kitaoka[num_rows*num_cols];
  for (int i=0;i<num_rows;i++) {
    for (int j=0;j<num_cols;j++) {
      scheiben[i*num_cols+j] = new Kitaoka(new PVector(col_offset+j*col_dist, row_offset+i*row_dist), dot_rad, 1, 0);
    }
  }
  smooth();
}

void draw() {
  background(255-rot, 255-gruen, 255-blau);
  if (growth) {
    PVector mp = new PVector(mouseX, mouseY);
    for (int i=0;i<scheiben.length;i++) {
      float d = dist(scheiben[i].position.x,scheiben[i].position.y,mp.x,mp.y);
      scheiben[i].setDotRadius(map(d,0,height,dot_rad*1.3,dot_rad*0.3));
    }
  }else{
     for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setDotRadius(dot_rad);
    }
  }

  if (adjust) {
    anginc_horz = map(mouseY, 0, width, 0.001, 0.5);
    anginc_vert = map(mouseX, 0, height, 0.001, 0.5);
  }

  for (int i=0;i<num_cols;i++) {
    for (int j=0;j<num_rows;j++) {
      scheiben[i*num_cols+j].setAngle(theta+(i*anginc_horz)+(j*anginc_vert));
    }
  }

  for (int i=0;i<scheiben.length;i++) {
    scheiben[i].display();
  }
}

void mouseReleased() {
  adjust = !adjust;
  //println("h: " + anginc_horz + " v: " + anginc_vert);
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("Demo_##.jpg");
  if (key =='t') {
    transparent = !transparent;

    if (transparent) {
      transparency = 200;
    }
    else {
      transparency = 255;
    }
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setColor(color(rot, gruen, blau, transparency));
    }
  }
  if (key == 'g') growth = !growth;

  switch(key) {
  case '1':
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setWeight(1);
    }
    break;
  case '2':
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setWeight(2);
    }
    break;
  case '3':
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setWeight(3);
    }
    break;
  case '4':
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setWeight(4);
    }
    break;
  case '5':
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setWeight(5);
    }
    break;
  case '0':
    rot = 50;
    gruen = 100;
    blau = 200;
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setColor(color(rot, gruen, blau, transparency));
    }
    break;
  case '9':
    rot = 100;
    gruen = 200;
    blau = 0;
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setColor(color(rot, gruen, blau, transparency));
    }
    break;
  case '8':
    rot = 0;
    gruen = 160;
    blau = 100;
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setColor(color(rot, gruen, blau, transparency));
    }
    break;
  case '7':
    rot = 200;
    gruen = 200;
    blau = 55;
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setColor(color(rot, gruen, blau, transparency));
    }
    break;
  case '6':
    rot = 100;
    gruen = 160;
    blau = 200;
    for (int i=0;i<scheiben.length;i++) {
      scheiben[i].setColor(color(rot, gruen, blau, transparency));
    }
    break;
  }
}

class Kitaoka {
  PVector position = new PVector(0, 0);
  float outerRadius = 100;
  float weight = 10;
  float innerRadius = outerRadius - weight;
  float angle = 0;
  color[] palette = new color[3];


  Kitaoka() {
    // default constructor
    this.palette[0] = color(0);
    this.palette[1] = color(255);
    this.palette[2] = color(50, 100, 200);
  }

  Kitaoka(PVector pos, float or, float wgt, float ang) {
    this.position = pos;
    this.outerRadius = or;
    this.weight = wgt;
    this.innerRadius = or - wgt;
    this.angle = ang;
    this.palette[0] = color(0);
    this.palette[1] = color(255);
    this.palette[2] = color(50, 100, 200);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    noStroke();
    fill(palette[0]);
    arc(0, 0, 2*outerRadius, 2*outerRadius, angle, angle+PI);
    fill(palette[1]);
    arc(0, 0, 2*outerRadius, 2*outerRadius, angle+PI, angle+TWO_PI);
    fill(palette[2]);
    ellipse(0, 0, 2*innerRadius, 2*innerRadius);
    popMatrix();
  }
  
  void setAngle(float ang){
    this.angle = ang;
  }
  
  void setColor(color clr){
    this.palette[2] = clr;
  }
  
  void setWeight(float wgt){
    this.weight = wgt;
    this.innerRadius = outerRadius - wgt;
  }
  
  void setDotRadius(float rad){
    this.outerRadius = rad;
    this.innerRadius = outerRadius - weight;
  }
}



