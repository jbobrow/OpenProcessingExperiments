
int x;
int y;
int x2;
int y2;

int rectopac = 15;
int rectomatch;

float u;
float d;

int v;


float a;
float b;
// rand angle 2

float t;

int cx;
int cy;
int cx2;
int cy2;
int dx;
int dy;
int dx2;
int dy2;
float edgex;
float edgey;

int h;
int w;


int c;
int o;

int p1 = 250;

int count;

int on;

void setup() {
  size (500, 500);
  background(0);
  smooth();
  on = 1;
  count = 1;
}
void draw() {
  if (on == 1) {
    noStroke();
    fill(255);   
    ellipse(250, 250, h, w);
    h = (int)random(30, 38);
    w = (int)random(30, 38);
    stroke(c, c+20, c-20, 90);
    c = (int)random(255);
    o = (int)random(80, 100);
    fill(0, 0);
    curve(cx, cy, 250, 250, edgex, edgey, cx2, cy2);
    c = c-40;
    p1 = (int)random(240, 260);
    curve(cx, cy, p1, p1, edgex, edgey, cx2, cy2); 
    c = c-40;
    curve(cx, cy, 252, 252, edgex, edgey, cx2, cy2);
    cx = (int)random(-2000, 2000);
    cy = (int)random(-2000, 2000);
    cx2 = (int)random(-2000, 2000);
    cy2 = (int)random(-2000, 2000);
    x = (int)random(200);
    y = (int)random(-2000, 2000);
    x2 = (int)random(-2000, 2000);
    y2 = (int)random(-1750, 2000);
    stroke (255);
    fill(255);
    b = (int)random(2*PI);
    a = (int)random(2*PI);
    t = a+.2;
    u = (int)random(10, 80);
    d = (int)random(10, 80);
    edgex = 350*sin(t)+250;
    edgey = 350*cos(t)+250;
    v = (int)random(200);
    stroke(c,80);
      w = (int)random(0, 12);
      h = (int)random(0, 12);
      rectomatch = (int)random(5, 25);
      if(rectopac>rectomatch){
        rectopac = rectopac-4;
      }else{
        rectopac = rectopac+4;
      }
    fill(0, rectopac);
    rect (-5, -5, width+5, height+5);
  }

}
void mousePressed() {
  if (on==1) {
    on=0;
  }
  else {
    on=1;
  }
}


