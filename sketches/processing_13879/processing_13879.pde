
//Ian L.: DMA252A - Assignment #2, Part A - Collage 

float lastax = random(640);
float lastay = random(480);
float lastbx = random(640);
float lastby = random(480);
float lastcx = random(640);
float lastcy = random(480);
float lastdx = random(640);
float lastdy = random(480);
float lastex = random(640);
float lastey = random(480);
float lastfx = random(640);
float lastfy = random(480);
float lastgx = random(640);
float lastgy = random(480);
float lasthx = random(640);
float lasthy = random(480);
float lastix = random(640);
float lastiy = random(480);
float lastjx = random(640);
float lastjy = random(480);
float lastkx = random(640);
float lastky = random(480);
float lastlx = random(640);
float lastly = random(480);
float lastmx = random(640);
float lastmy = random(480);
float lastnx = random(640);
float lastny = random(480);
float lastox = random(640);
float lastoy = random(480);
float lastpx = random(640);
float lastpy = random(480);
float lastqx = random(640);
float lastqy = random(480);
float lastrx = random(640);
float lastry = random(480);
float lastsx = random(640);
float lastsy = random(480);
float lasttx = random(640);
float lastty = random(480);
float lastux = random(640);
float lastuy = random(480);
float lastvx = random(640);
float lastvy = random(480);
float lastwx = random(640);
float lastwy = random(480);
float lastxx = random(640);
float lastxy = random(480);
float lastyx = random(640);
float lastyy = random(480);

void setup() {
  size(640,480);
  background(#FFFFFF);
  smooth();
}

void draw(){
  
  noStroke();
  fill(#FFFFFF,30);
  rect(0,0, width, height);
  noFill();
  
  float ax = random(640);
  float ay = random(480);
  float bx = random(640);
  float by = random(480);
  float cx = random(640);
  float cy = random(480);
  float dx = random(640);
  float dy = random(480);
  float ex = random(640);
  float ey = random(480);  
  float fx = random(640);
  float fy = random(480);
  float gx = random(640);
  float gy = random(480);
  float hx = random(640);
  float hy = random(480);
  float ix = random(640);
  float iy = random(480);
  float jx = random(640);
  float jy = random(480);  
  float kx = random(640);
  float ky = random(480);  
  float lx = random(640);
  float ly = random(480);
  float mx = random(640);
  float my = random(480);
  float nx = random(640);
  float ny = random(480);
  float ox = random(640);
  float oy = random(480);
  float px = random(640);
  float py = random(480);  
  float qx = random(640);
  float qy = random(480);
  float rx = random(640);
  float ry = random(480);
  float sx = random(640);
  float sy = random(480);
  float tx = random(640);
  float ty = random(480);
  float ux = random(640);
  float uy = random(480);  
  float vx = random(640);
  float vy = random(480); 
  float wx = random(640);
  float wy = random(480);
  float xx = random(640);
  float xy = random(480);
  float yx = random(640);
  float yy = random(480);
 
  PImage img;

  img = loadImage("dollarvectorfrontsmall.jpg");
  image(img, ax, ay, 60, 25);
  stroke(#669933);
  line(ax+30, ay+12, bx+20, by+10);

  img = loadImage("bofa.jpg");
  image(img, bx, by, 40, 20);
  stroke(#FF0000);
  line(bx+20, by+10, cx+20, cy+10);

  img = loadImage("chase.jpg");
  image(img, cx, cy, 40, 20);
  stroke(#336699);
  line(cx+20, cy+10, dx+20, dy+10);

  img = loadImage("citi.gif");
  image(img, dx, dy, 40, 20);
  stroke(#0066CC);
  line(dx+20, dy+10, ex+10, ey+10);

  img = loadImage("td.jpg");
  image(img, ex, ey, 20, 20);
  stroke(#00CC00);
  line(ex+10, ey+10, fx+20, fy+10);

  img = loadImage("wellsfargo.jpg");
  image(img, fx, fy, 40, 20);
  stroke(#CC3333);
  line(fx+20, fy+10, gx+10, gy+10);

  img = loadImage("pnc.jpg");
  image(img, gx, gy, 20, 20);
  stroke(#FF6600);
  line(gx+10, gy+10, hx+20, hy+8);

  img = loadImage("bmo.jpg");
  image(img, hx, hy, 40, 15);
  stroke(#006699);
  line(hx+20, hy+8, ix+20, iy+10);

  img = loadImage("creditsuisse.gif");
  image(img, ix, iy, 40, 20);
  stroke(#003366);
  line(ix+20, iy+10, jx+20, jy+10);

  img = loadImage("ubs.gif");
  image(img, jx, jy, 40, 20);
  stroke(#CC0000);
  line(jx+20, jy+10, kx+20, ky+8);
 
  img = loadImage("ing.gif");
  image(img, kx, ky, 40, 15);
  stroke(#FF9900);
  line(kx+20, ky+8, lx+20, ly+8); 

  img = loadImage("mizuho.jpg");
  image(img, lx, ly, 40, 15);
  stroke(#000066);
  line(lx+20, ly+8, mx+10, my+10); 

  img = loadImage("cibcsmall.jpg");
  image(img, mx, my, 20, 20);
  stroke(#CC3300);
  line(mx+10, my+10, nx+20, ny+5);

  img = loadImage("hsbc.jpg");
  image(img, nx, ny, 40, 10);
  stroke(#CC0033);
  line(nx+20, ny+5, ox+20, oy+10);

  img = loadImage("socgen.gif");
  image(img, ox, oy, 40, 20);
  stroke(#000000);
  line(ox+20, oy+10, px+20, py+5);

  img = loadImage("barclays.jpg");
  image(img, px, py, 40, 10);
  stroke(#0099CC);
  line(px+20, py+5, qx+20, qy+5);

  img = loadImage("db.jpg");
  image(img, qx, qy, 40, 10);
  stroke(#000066);
  line(qx+20, qy+5, rx+20, ry+8);

  img = loadImage("fortis.gif");
  image(img, rx, ry, 40, 15);
  stroke(#FF0033);
  line(rx+20, ry+8, sx+20, sy+5);

  img = loadImage("btmu.gif");
  image(img, sx, sy, 40, 10);
  stroke(#FF3333);
  line(sx+20, sy+5, tx+10, ty+10);
 
  img = loadImage("dzbank.gif");
  image(img, tx, ty, 20, 20);
  stroke(#FF6633);
  line(tx+10, ty+10, ux+15, uy+10);

  img = loadImage("bbva.gif");
  image(img, ux, uy, 30, 20);
  stroke(#003399);
  line(ux+15, uy+10, vx+15, vy+8);  
 
  img = loadImage("lcl.gif");
  image(img, vx, vy, 30, 15);
  stroke(#FFFF00);
  line(vx+15, vy+8, wx+20, wy+10);

  img = loadImage("paribas.jpg");
  image(img, wx, wy, 40, 20);
  stroke(#006633);
  line(wx+20, wy+10, xx+20, xy+10);

  img = loadImage("rbs.jpg");
  image(img, xx, xy, 40, 20);
  stroke(#330099);
  line(xx+20, xy+10, yx+24, yy+10);

  img = loadImage("dollarvectorbacksmall.jpg");
  image(img, yx, yy, 60, 25);
  stroke(#669933);
  line(yx+30, yy+12, lastax, lastay);
  
  lastax = ax+30;
  lastay = ay+12;
  
}





