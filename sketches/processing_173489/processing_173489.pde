
int cx=32, cy=16, w=512, h=512, ni=w/cx, nj=h/cy, sw=4;

void setup() {
  size(w, h);
  smooth();
  noLoop();
  //frameRate(1);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(sw);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  for(int i=0; i<ni; i++) {
    for(int j=0; j<nj; j++) {
      int r=int(random(4));
      if(r!=0) line(i*cx+cx/2, j*cy+cy/2, i*cx, j*cy);
      if(r!=1) line(i*cx+cx/2, j*cy+cy/2, (i+1)*cx, j*cy);
      if(r!=2) line(i*cx+cx/2, j*cy+cy/2, i*cx, (j+1)*cy);
      if(r!=3) line(i*cx+cx/2, j*cy+cy/2, (i+1)*cx, (j+1)*cy);
    }
  }
  loadPixels();
  for(int i=0; i<ni; i++) {
    for(int j=0; j<nj; j++) {
      Fill(i*cx, j*cy+cy/2, color(255), color((int(random(7))+1)*32, (int(random(7))+1)*32, (int(random(7))+1)*32));
      Fill(i*cx+cx/2, j*cy, color(255), color((int(random(7))+1)*32, (int(random(7))+1)*32, (int(random(7))+1)*32));
      Fill(i*cx+cx-1, j*cy+cy/2, color(255), color((int(random(7))+1)*32, (int(random(7))+1)*32, (int(random(7))+1)*32));
      Fill(i*cx+cx/2, j*cy+cy-1, color(255), color((int(random(7))+1)*32, (int(random(7))+1)*32, (int(random(7))+1)*32));
    }
  }
  updatePixels();
}

void mousePressed() {
  //redraw();
  loop();
}

void mouseReleased() {
  //redraw();
  noLoop();
}

void Fill(int x, int y, color oldColor, color newColor){
  if(x<0 || y<0 || x>=width || y>=height) return;
  if(pixels[y*width+x]!=oldColor) return;
  pixels[y*width+x]=newColor;
  Fill(x + 1, y, oldColor, newColor); 
  Fill(x - 1, y, oldColor, newColor); 
  Fill(x, y + 1, oldColor, newColor);
  Fill(x, y - 1, oldColor, newColor);
}

