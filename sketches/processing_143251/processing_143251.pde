
int r=0, m=0, n=0, j=0, k=0;
boolean pinta = true, play = true;
float scale=1;

void setup() {
  //scale = (float)min(displayWidth, displayHeight)/220;
  size((int)(200*scale), (int)(200*scale));
  frameRate(10);
}

void draw() {
  background(255);
  stroke(#ff0000);
  if (!play) {
    triangle(160*scale, 160*scale, 160*scale, 180*scale, 180*scale, 170*scale);
  } 
  else {
    line(165*scale, 160*scale, 165*scale, 180*scale);
    line(175*scale, 160*scale, 175*scale, 180*scale);
  }
  stroke(0);
  if (r==40) {
    r=0;
    if (pinta) {
      k=39;
    } 
    else m=1;
    pinta = !pinta;
  }
  if ((k==40 && pinta) || (m==0 && !pinta)) {
    r += (r<40 && pinta && play)?1:0;
    if (!pinta) r=40;
  }
  if (n==20) {
    if (play)
      if (pinta) k += (k<40)?1:0;
      else k += (k>0)?-1:0;
    circulo(40, k, 100, 0, sqrt(50000)-100, 0, -PI);
  }
  if (j==20) {
    if (play)  
      if (pinta) n += (n<20)?1:0;
      else if (k==0) n += (n>0)?-1:0;
    strokeWeight(1*scale);
    line(100*scale, 200*scale, 100*scale, (200-n*200/20)*scale);
    strokeWeight(7*scale);
    point(100*scale, (200-n*200/20)*scale);
  }
  if (m==20) {
    if (play)
      if (pinta) j += (j<20)?1:0;
      else if (n==0) j += (j>0)?-1:0;
    circulo(20, j, 0, 200, 100, PI/2, -PI/2      );
  }
  if (play)
    if (pinta) m += (m<20)?1:0;
    else if (j==0) m += (m>0)?-1:0;
  strokeWeight(1);
  line(100*scale, 0, (100-m*100/20)*scale, (0+m*200/20)*scale);
  strokeWeight(7*scale);
  point((100-m*100/20)*scale, (0+m*200/20)*scale);
}

void circulo(int step, int j, int x, int y, float radio, float a0, float arco) {
  for (int i=-1; i<=j; i++) {
    strokeWeight((i/2+5)*scale);
    point((x + radio * cos(a0 + i*arco/step))*scale, 
    (y - radio*sin(a0 + i*arco/step))*scale);
  }
  strokeWeight(1*scale);
  line(x*scale, y*scale, (x + radio * cos(a0 + j*arco/step))*scale, 
  (y - radio*sin(a0 + j*arco/step))*scale);
}

void mousePressed() {
  if (mouseX>160*scale && mouseX<180*scale && mouseY>160*scale && mouseY<180*scale) {
    play = !play;
  }
}



