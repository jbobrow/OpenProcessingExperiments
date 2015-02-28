
PSpiral p;
float r,g,b,a;
int m,n,pn,npn; 
float cx,cy;
float x1,y1,x2,y2;
float x1init,y1init,x2init,y2init;
float x1margin,y1margin,x2margin,y2margin;
float nx1,ny1,nx2,ny2;
float prx,pry,pang;
float pninit,prxinit,pryinit,panginit;
float pnmargin, prxmargin, prymargin, pangmargin;
float nprx,npry,npang;

void setup() {
  size(920,500);
  smooth();
  restart();   
}

void restart() {
  // choose stroke colors and weight
  float strokeweight = random(1.5,4);
  r=0; g=0;  b=0;
  while (r+g+b<350) {       // make sure color isn't too dark
    r = random(255);
    g = random(255);
    b = random(255);
  }
  a = random(180,250) - strokeweight*20;
  stroke(r,g,b,a);    
  strokeWeight(strokeweight); 
  
  // center point
  cx = width/2;  cy = height/2;
  
  m=20; n=20;
  while (m*n>80) {                // avoid having too many shapes
    m = (int)random(2,10);         // # 1st level slices
    n = (int)random(3,11);         // # 2nd level slices
  }
  
  // first level of symmetry
  x1init = random(20,width/5);
  y1init = random(20,height/5);
  x1margin = random(60,180);
  y1margin = random(60,160);
  
  // second level of symmetry
  x2init = random(20,width/3 - x1init);
  y2init = random(20,height/3 - y1init);
  x2margin = random(40,180);
  y2margin = random(40,160);
  
  
  // parameters of spiral (p)
  // spiral width and height
  prxinit = 0; pryinit = 0;
  while (prxinit + pryinit < 140 ) {    // ensure that the shape isn't too small
    prxinit = random(30,150);
    pryinit = random(30,150); 
  }
  prxmargin = random(160);
  prymargin = random(160);
  // total angle
  panginit = random(-12*PI,12*PI);
  pangmargin = random(5*PI,24*PI);
  // number of vertices
  pninit = (int)random(18,35);
  pnmargin = random(0,pn-1);

  // initialize noise
  npn = (int)random(10);
  nprx = random(10);
  npry = random(10);
  npang = random(10);  
  nx1 = random(10);
  ny1 = random(10);
  nx2 = random(10);
  ny2 = random(10);  
}

void update() { 
  // update symmetry points
  x1 = x1init + x1margin*(noise(nx1)-0.5);
  y1 = y1init + y1margin*(noise(ny1)-0.5);
  x2 = x2init + x2margin*(noise(nx2)-0.5);
  y2 = y2init + y2margin*(noise(ny2)-0.5);
  nx1 += 0.015;
  ny1 += 0.015;
  nx2 += 0.015;
  ny2 += 0.015;  
  // update parameters of spiral
  pn = (int)pninit;
  //  pn = (int)(pninit + pnmargin*(noise(npn)-0.5));
  prx = prxinit + prxmargin*(noise(nprx)-0.5);
  pry = pryinit + prymargin*(noise(npry)-0.5);
  pang = panginit + pangmargin*(noise(npang)-0.5);;
  //npn += 0.008;
  nprx += 0.01;
  npry += 0.01;
  npang += 0.005;  
  // create the spiral
  p = new PSpiral(pn,0,0,prx,pry,pang);  
}

void draw() {
  //background(0);  
  pushStyle(); fill(0,60); rect(0,0,width,height); popStyle();
  fill(255);
//  text("click me", width-50,0,width,50);
  translate(cx,cy);
  update();
  fill(r,g,b,a/(float)8.0);  for (int i=0; i<n; i++) {
    pushMatrix();
    rotate(2*PI*(float)i/n);
    translate(x1,y1);
    for (int j=0; j<m; j++) {
      pushMatrix();
      rotate(2*PI*(float)j/m);
      translate(x2, y2);   
      p.drawCurves();
      popMatrix();
    }
    popMatrix();
  }  
}

void mousePressed() {
  restart();
} 

class PSpiral {  
  float[][] pts;
  float ang; int n;
  PSpiral(int _n,float cx,float cy,float rx,float ry,float _ang) {
    ang = _ang; n = _n;
    pts = new float[n][2];
    float currAng,currRx,currRy;
    for (int i=0; i<n; i++) {
      currAng = ang*i/(n-1);
      currRx = rx*i/(n-1);
      currRy = ry*i/(n-1);
      pts[i][0] = cx + currRx*cos(currAng);
      pts[i][1] = cy + currRy*sin(currAng);
    }
  }
  void drawCurves() {
    beginShape();
    for (int i=0; i<pts.length; i++) {
      curveVertex(pts[i][0],pts[i][1]);
    }
    endShape();
  }
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
