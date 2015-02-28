
float px1, px2, pix, pfx, piy, pfy, piz, pfz, py1, py2, lim2, inc=10;

void setup() {
  size(800, 400, P3D);
  background(0);
  smooth();
  int lim=width/2, lim2=height/3;
  pix=random(-lim, lim); 
  pfx=random(-lim, lim); 
  piy=random(-lim, lim); 
  pfy=random(-lim, lim); 
  piz=random(-lim, lim); 
  pfz=random(-lim, lim);
}

void draw() {
  frameRate(20);

  translate(width/2, height/2);
  noFill();
  stroke(255, random(40, 60));
  strokeWeight(0.5);
  beginShape();
  vertex(pix, piy, piz);
  bezierVertex(px1, px1, px2, px1, px1, px2, pfx, pfy, pfz);
  endShape();
  strokeWeight(4);
  stroke(255);
  point(pix, piy, piz);
  point(pfx, pfy, pfz);
  if (px1>lim2) {
    px1=0;
    px2=0;
    pix=random(-500, 500); 
    pfx=random(-500, 500); 
    piy=random(-500, 500); 
    pfy=random(-500, 500); 
    piz=random(-500, 500); 
    pfz=random(-500, 500);
  }
  px1+=inc;
  px2+=inc;
}


