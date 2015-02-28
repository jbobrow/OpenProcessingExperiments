
float h = 100*0.75;
float w = 250*0.75;
float l = 670*0.75;
float s = 1;
float t;
//theta
float q;
//alpha
float t2;
// theta 2
float q2;
// alpha 2
float sx;
// start x
float sy;
// strat y

int cm;
// curve multiplier


float ax;
float ay;
float bx;
float by;
float cx;
float cy;
float dx;
float dy;
float ex;
float ey;
float fx;
float fy;
float gx;
float gy;
float hx;
float hy;

float cax;
float cay;
float cbx;
float cby;
float ccx;
float ccy;
float cdx;
float cdy;
float cex;
float cey;
float cfx;
float cfy;
float cgx;
float cgy;
float chx;
float chy;

int on;
float a = radians(18);
//test variable
int count = 0;

void setup() {
  size(800, 800);
  smooth();
  background(255);
  on = 1;
  fill(0, 0, 0, 0);
}

void draw() {
  if (on == 1) {
    strokeWeight(s);
    background(255);
      a = a;
      t = a;
      t2 = (PI/2)-t;
      q = a+0.01+radians(90);
      q2 = (radians(90)-q);
      sx = width/4;
      sy = height/4;
      h = h;
      w = w;
      l = l;
      ax = sx;
      ay = sy;
      hx = ax+h*cos(q2);
      hy = ay+h*sin(q2);
      bx = ax+w*cos(t);
      by = ay+w*sin(t);
      cx = ax+l*cos(t2);
      cy = ay+l*sin(t2);
      dx = ax+(l*cos(t2)+w*cos(t));
      dy = ay+(l*sin(t2)+w*sin(t));
      ex = ax+(l*cos(t2)+h*cos(q2));
      ey = ay+(l*sin(t2)+h*sin(q2));
      fx = ax+(l*cos(t2)+h*cos(q2)+w*cos(t));
      fy = ay+(l*sin(t2)+h*sin(q2)+w*sin(t));
      gx = ax+(cos(t2)+cos(t2)+h*cos(q2)+w*cos(t));
      gy = ay+(+h*sin(q2)+w*sin(t));
      cm = 8;
      cax = ax+(count*cm);
      cay = ay+(count*cm);
      chx = hx+(count*cm);
      chy = hy+(count*cm);
      cbx = bx+(count*cm);
      cby = by+(count*cm);
      ccx = cx+(count*cm);
      ccy = cy+(count*cm);
      cdx = dx+(count*cm);
      cdy = dy+(count*cm);
      cex = ex+(count*cm);
      cey = ey+(count*cm);
      cfx = fx+(count*cm);
      cfy = fy+(count*cm);
      cgx = gx+(count*cm);
      cgy = gy+(count*cm);
      curve (cax, cay, ax, ay, bx, by, cbx, cby);
      curve (cax, cay, ax, ay, cx, cy, ccx, ccy);
      curve (cbx, cby, bx, by, gx, gy, cgx, cgy);
      curve (cbx, cby, bx, by, dx, dy, cdx, cdy);
      curve (ccx, ccy, cx, cy, ex, ey, cex, cey);
      curve (ccx, ccy, cx, cy, dx, dy, cdx, cdy);
      curve (cdx, cdy, dx, dy, fx, fy, cfx, cfy);
      curve (cex, cey, ex, ey, fx, fy, cfx, cfy);
      curve (cfx, cfy, fx, fy, gx, gy, cgx, cgy);
      curve (cax, cay, ax, ay, hx, hy, chx, chy);
      curve (cex, cey, ex, ey, hx, hy, chx, chy);
      curve (cgx, cgy, gx, gy, hx, hy, chx, chy);

    }
  }


void mousePressed() {
  if (on == 1) {
    on = 0;
  }
  else {
    on = 1;
  }
}

void keyPressed(){
  if (key == 'c'){
    count = count+2;
    save("Curves/"+frameCount+".png");
  }
  if(key == 't'){
    a = a+radians(5);
    save("Rotate/"+frameCount+".png");
  }
  if(key == 'h'){
    h = h+5;
    save("Height/"+frameCount+".png");
  }
  if(key == 's'){
    s = s+1;
    save("Stroke/"+frameCount+".png");
  }
  if(key == 'l'){
    l = l+5;
    save("Length/"+frameCount+".png");
  }
  if(key == 'w'){
    w = w+5;
    save("Width/"+frameCount+".png");
  }

}


