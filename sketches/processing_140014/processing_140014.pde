

int[] par = { 120, 100, 320, 40, 320, 320, 120, 320 };
int iPar = 0;

int textX = 0;
int textY = 440;
int charH = 17;
int parX, parY;
int parW, parDX;

void setup() 
{
  size(420, 450, P2D);

  PFont font = createFont("Courier New Bold", charH );                            
  textFont(font);

  textX = (width-int(textWidth("bezier(000,000,000,000,000,000,000,000);"))) / 2;
  int charW = int(textWidth("x"));
  parW = charW*3+2;
  parDX = charW*4+1;
  parY = textY - int(charH*0.8);
  parX = textX + int(textWidth("bezier(")) - 1;
}

void draw()
{
  background(230);

  fill(255);
  stroke(0);                           
  bezier( par[0], par[1], par[2], par[3], par[4], par[5], par[6], par[7] );  

  fill(255);
  noStroke();
  rect(0, width, 420, 30);

  fill(255, 255, 0);
  noStroke();
  rect(parX+parDX*iPar, parY, parW, charH);

  fill(0);
  String[] ps = new String[par.length];
  for (int i=0; i<ps.length; ++i) {
    ps[i] = ((par[i]<10)? "  ":(par[i]<100)? " ":"") + par[i];
  }
  text( "bezier("+ps[0]+","+ps[1]+","+ps[2]+","+ps[3]+","+ps[4]+","+ps[5]+","+ps[6]+","+ps[7]+");", textX, textY);

  if (iPar==0)
    drawPointX(par[0], par[1]);
  else if (iPar==1)
    drawPointY(par[0], par[1]);
  else 
    drawPoint(par[0], par[1]);

  if (iPar==2)
    drawPointX(par[2], par[3]);
  else if (iPar==3)
    drawPointY(par[2], par[3]);
  else 
    drawPoint(par[2], par[3]);

  if (iPar==4)
    drawPointX(par[4], par[5]);
  else if (iPar==5)
    drawPointY(par[4], par[5]);
  else 
    drawPoint(par[4], par[5]);

  if (iPar==6)
    drawPointX(par[6], par[7]);
  else if (iPar==7)
    drawPointY(par[6], par[7]);
  else
    drawPoint(par[6], par[7]);
}

void keyPressed()
{
  switch (keyCode) {
  case LEFT:
    if (iPar>0) --iPar;  
    break;
  case RIGHT: 
    if (iPar<7) ++iPar;  
    break;
  case UP:
    if (par[iPar]<500) ++par[iPar];
    break;  
  case DOWN:
    if (par[iPar]>0) --par[iPar];
    break;
  }
}

void drawPoint(int x, int y) 
{
  fill(200);
  noStroke();
  ellipse(x, y, 8, 8);
}

void drawPointX(int x, int y) 
{
  fill(255, 255, 0);
  stroke(0);
  line(x-11, y, x+11, y);
  line(x-11, y, x-8, y-3);
  line(x-11, y, x-8, y+3);
  line(x+11, y, x+8, y-3);
  line(x+11, y, x+8, y+3);
  ellipse(x, y, 8, 8);
}

void drawPointY(int x, int y) 
{
  fill(255, 255, 0);
  stroke(0);
  line(x, y-11, x, y+11);
  line(x, y-11, x+3, y-8);
  line(x, y-11, x-3, y-8);
  line(x, y+11, x+3, y+8);
  line(x, y+11, x-3, y+8);
  ellipse(x, y, 8, 8);
}


