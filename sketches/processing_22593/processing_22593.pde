
int w = 15;
int h = 30;

void setup()
{
  size(192,157);
}
void draw()
{
  int x = round(random(-w,width));
  int y = round(random(-h,width));
  translate(x,y);
  beginShape();
  vertex(0+disp(), 0+disp());
  bezierVertex(w+disp(), 0+disp(), w+disp(), h+disp(), 0+disp(), h+disp());
  bezierVertex(-w+disp(), h+disp(), -w+disp(), 0, 0, 0);
  endShape();
  translate(0,round(2*h/3));
  beginShape();
  vertex(disp(), disp());
  bezierVertex(disp(), disp(), disp(), disp(), disp(), disp());
  bezierVertex(-disp(), disp(), -disp(), 0, 0, 0);
  endShape();
  translate(-round(w/3),-round(h/3));
  beginShape();
  vertex(disp(), disp());
  bezierVertex(disp(), disp(), disp(), disp(), disp(), disp());
  bezierVertex(-disp(), disp(), -disp(), 0, 0, 0);
  endShape();
  translate(round(w/3),0);
  beginShape();
  vertex(disp(), disp());
  bezierVertex(disp(), disp(), disp(), disp(), disp(), disp());
  bezierVertex(-disp(), disp(), -disp(), 0, 0, 0);
  endShape();
}

int disp()
{
  return round(random(-round(w/3),round(w/3)));
}

