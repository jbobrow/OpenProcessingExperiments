
void setup () {
  size(300, 300);
  background(255);
  smooth();
}

void draw () {
  float x=mouseX;
  float y=mouseY;
  float ix=mouseX/8;
  float iy=mouseY/10;
  //  arcs (180,100);
  if ((y>0) || (y>=300)) {
    noFill();
    background(250, 255, 180);
    strokeWeight(3);
    curve(230, width/3, y/2.5, 110, y/2.5, 190, 230, width/1.5);
    curve(230, width/3, y/2.5-30, 115, y/2.5-30, 185, 230, width/1.5);
    curve(230, width/3, y/2.5-60, 120, y/2.5-60, 180, 230, width/1.5);

    curve(70, width/3, y/2.5+60, 110, y/2.5+60, 190, 70, width/1.5);
    curve(70, width/3, y/2.5+90, 115, y/2.5+90, 185, 70, width/1.5);
    curve(70, width/3, y/2.5+120, 120, y/2.5+120, 180, 70, width/1.5);
    float a=random (255);
    fill (115, 255, 125, a);
    ellipse(width/2, height/2, iy, iy);
  }
  if (keyPressed==true) {
      float a=random(255);
    float b=random(255);
    float c=random(255);
    background(a,b,c);    
    noFill();
    stroke(255);
    strokeWeight(3);
    curve(230, width/3, y/2.5, 110, y/2.5, 190, 230, width/1.5);
    curve(230, width/3, y/2.5-30, 115, y/2.5-30, 185, 230, width/1.5);
    curve(230, width/3, y/2.5-60, 120, y/2.5-60, 180, 230, width/1.5);

    curve(70, width/3, y/2.5+60, 110, y/2.5+60, 190, 70, width/1.5);
    curve(70, width/3, y/2.5+90, 115, y/2.5+90, 185, 70, width/1.5);
    curve(70, width/3, y/2.5+120, 120, y/2.5+120, 180, 70, width/1.5);
    fill (0);
    ellipse(width/2, height/2, iy+10, iy+10);

  }
}

/* if ((x>185) && (x<300)) {
 background(255);
 curve(x*-2,100,x,110,x,190,x*-2,200);*/


