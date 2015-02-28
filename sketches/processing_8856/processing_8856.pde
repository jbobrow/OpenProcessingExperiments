
int compt, compt_max;
int niv, niv_max;

void setup()
{
  size(900, 900);
  smooth();
  stroke(0); strokeWeight(1);
  
  compt = 0;
  niv = 3;
  compt_max = 4;
  niv_max = 7;
  fractale(compt, niv);
}

void draw()
{}

void mousePressed()
{
  background(200);
  compt = (compt+1)%2;
  fractale(compt, niv);  
}

void keyPressed()
{
  if (keyCode == LEFT)  {compt -=1;}
  if (keyCode == RIGHT) {compt +=1;}
  if (keyCode == UP)    {niv +=1;}
  if (keyCode == DOWN)  {niv -=1;}
  
  compt = compt%compt_max;
  niv = niv%niv_max;
  if (compt < 0) {compt = compt_max-1;}
  if (niv < 0) {niv = niv_max-1;}
  
  background(200);
  fractale(compt, niv);  
  
  if (keyCode == ENTER) {saveFrame("im-####.jpg");}
}

//-------FRACTALES---------
void fractale (int i, int niveau)
{
  if (i == 0) {translate(30, 30); flocon(niveau, width-2*30); translate(30, 30);}
  if (i == 1) {translate(width/2, 30); tri(niveau, height - 60); translate(width/2, 30);}
  if (i == 2) {translate(30, 30); car(niveau, width-2*30); translate(30, 30);}
  if (i == 3) {translate(width/2, height-30); foug(niveau, width/3); translate(30, 30);}
}

//Flocon
void flocon(int n, float tay)
{
  if (n > 0) 
  {
    translate(0, 0); rotate(0);
    flocon(n-1, tay/3.0);
    translate(tay/3.0, 0); rotate(+PI/3);
    flocon(n-1, tay/3.0);
    translate(tay/3.0, 0); rotate(-2*PI/3);
    flocon(n-1, tay/3.0);
    translate(tay/3.0, 0); rotate(+PI/3);
    flocon(n-1, tay/3.0);
    translate(-2*tay/3.0, 0); rotate(0);
  }
  
  if (n == 0)
  {
    line(0, 0, tay, 0);
  }
}

//Serpinski : le triangle
void tri(int n, float tay)
{
  if (n > 0) 
  {
    translate(0, 0); rotate(0);
    tri(n-1, tay/2.0);
    translate(-(tay/2.0)/2.0, +sqrt(3)/2.0*(tay/2.0)); rotate(0);
    tri(n-1, tay/2.0);
    translate(+tay/2.0, 0); rotate(0);
    tri(n-1, tay/2.0);
    translate(-(tay/2.0)/2.0, -sqrt(3)/2.0*(tay/2.0)); rotate(0);
  }
  
  if (n == 0)
  {
    noFill();
    beginShape();
    vertex(0, 0);
    vertex(-tay/2, sqrt(3)/2.0*tay);
    vertex(+tay/2, sqrt(3)/2.0*tay);
    endShape(CLOSE);
  }
}

//Serpinski : le carré
void car(int n, float tay)
{
  if (n > 0) 
  {
    for (int i = 0; i < 3; i++)
    {
      for (int j = 0; j < 3; j++)
      {
        translate(i*tay/3, j*tay/3);
        if ((i == 1)&&(j == 1)) {rect(0, 0, tay/3, tay/3);}
        else {car(n-1, tay/3.0);}
        translate(-i*tay/3, -j*tay/3);
      }
    }
  }
  
  if (n == 0)
  {
    fill(0);
    rect(tay/3, tay/3, tay/3, tay/3);
  }
}

//Fougere
void foug(int n, float tay)
{
  if (n > 0) 
  {
    translate(0, 0); rotate(0);
    motif_foug(tay);
    translate(0, -tay); rotate(-PI/6); translate(0, -tay/2); rotate(+PI/4);
    foug(n-1, tay/3);
    rotate(-PI/4);  translate(0, +tay/2); rotate(+PI/6); rotate(+PI/4);
    foug(n-1, tay/3.0);
    rotate(-PI/4); translate(0, tay);
  }
  
  if (n == 0)
    {motif_foug(tay);}
}
void motif_foug(float tayy)
{
  line(0, 0, 0, -tayy);
  translate(0, -tayy);
  rotate(-PI/6);
  line(0, 0, 0, -tayy/2);
  rotate(+PI/6);
  translate(0, +tayy);
}

