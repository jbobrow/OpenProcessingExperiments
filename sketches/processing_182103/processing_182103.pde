
int KeySize;
int CaraEnf;

void setup()
{
  size(800, 400);
  background(0);
  noCursor();
}

void draw()
{
  if (mouseX<width/3)
  {
    KeySize = 100;
    CaraEnf = 20;
  }
  if (mouseX>width/3)
  {
    KeySize = 2*(mouseX-100)/3;
    CaraEnf = 45;
  }
  if (mouseX>2*width/3)
  {
    KeySize = 300;
  }
  
  background(0);
  fill(255);
  noStroke();
  arc(650, 195, 30, 30, HALF_PI+QUARTER_PI, TWO_PI+QUARTER_PI, OPEN);
  quad(645, 190, 655, 190, 665, 230, 635, 230);
  KeyBlade(mouseX, 200);
  KeyChain(mouseX, 200);
  fill(0);
  rect(665, 0, 665, 400, 800, 400, 800, 0);
  fill(255);
  ellipse(400, 100, 50, 100);
  ellipse(340, 100, 50, 100);
  fill(0);
  ellipse(mouseX/20+320, 120, 30, 30);
  ellipse(mouseX/20+380, 120, 30, 30);
  fill(255);
  strokeWeight(4);
  stroke(255);
  line(315, 30, 360, CaraEnf);
  line(425, 30, 380, CaraEnf);
  strokeWeight(1);
}

void KeyBlade(int kX, int kY)
{
  int Klargo = KeySize;
  int Kancho = Klargo/4;
  int LargoHoja = 3*Klargo/4;
  int LargoCrown = LargoHoja/5;
  int CrownLeftX = kX+(Klargo/4)+(4*LargoHoja/5);
  int LargoEmp = Klargo/4;
  //"Hoja"

  fill(206);
  noStroke();
  rect(kX, kY, Klargo, Kancho/6);
  ellipse(CrownLeftX+2*LargoCrown/6, kY+3*Kancho/8, LargoCrown/12, LargoCrown/12);
  ellipse(CrownLeftX+4*LargoCrown/6, kY+3*Kancho/8, LargoCrown/12, LargoCrown/12);
  beginShape();
  vertex(CrownLeftX, kY);
  vertex(CrownLeftX+LargoCrown/14, kY+Kancho/2);
  vertex(CrownLeftX+LargoCrown/6, kY+Kancho/2);
  vertex(CrownLeftX+LargoCrown/6-LargoCrown/28, kY+Kancho/4);
  vertex(CrownLeftX+2*LargoCrown/6, kY+3*Kancho/8);
  vertex(CrownLeftX+3*LargoCrown/6, kY+3*Kancho/16);
  vertex(CrownLeftX+4*LargoCrown/6, kY+3*Kancho/8);
  vertex(CrownLeftX+5*LargoCrown/6+LargoCrown/28, kY+Kancho/4);
  vertex(CrownLeftX+5*LargoCrown/6, kY+Kancho/2);
  vertex(CrownLeftX+LargoCrown-LargoCrown/14, kY+Kancho/2);
  vertex(CrownLeftX+LargoCrown, kY);
  endShape(CLOSE);

  //Empuñadura
  stroke(206);
  fill(0);
  rect(kX, kY, LargoEmp, Kancho/6);
  noStroke();
  fill(61, 66, 159);
  rect(kX+LargoEmp, kY, Klargo/18, Kancho/6);
  fill(255, 244, 99);
  rect(kX, kY, 2*LargoEmp/9, Kancho/6);
  rect(kX+7*LargoEmp/9, kY, 2*LargoEmp/9, Kancho/6);
  beginShape();
  vertex(kX+LargoEmp/36, kY+Kancho/6);
  vertex(kX+LargoEmp/18, kY+Kancho/2);
  vertex(kX+2*LargoEmp/9, kY+9*Kancho/16);
  vertex(kX+LargoEmp-LargoEmp/18, kY+17*Kancho/32);
  vertex(kX+LargoEmp-LargoEmp/18, kY+7*Kancho/16);
  vertex(kX+35*LargoEmp/36, kY+6*Kancho/16);
  vertex(kX+35*LargoEmp/36, kY+Kancho/6);
  vertex(kX+29*LargoEmp/36, kY+Kancho/6);
  vertex(kX+29*LargoEmp/36, kY+7*Kancho/16);
  vertex(kX+2*LargoEmp/9, kY+15*Kancho/32);
  vertex(kX+7*LargoEmp/36, kY+Kancho/6);
  endShape(CLOSE);
  ellipse(kX+5*LargoEmp/36, kY+17*Kancho/32, 2*Kancho/9, 2*Kancho/9);
  beginShape();
  vertex(kX+LargoEmp/36, kY);
  vertex(kX+LargoEmp/18, kY-2*Kancho/6);
  vertex(kX+2*LargoEmp/9, kY-6*Kancho/16);
  vertex(kX+LargoEmp-LargoEmp/18, kY-11*Kancho/32);
  vertex(kX+LargoEmp-LargoEmp/18, kY-4*Kancho/16);
  vertex(kX+35*LargoEmp/36, kY-3*Kancho/16);
  vertex(kX+35*LargoEmp/36, kY);
  vertex(kX+29*LargoEmp/36, kY);
  vertex(kX+29*LargoEmp/36, kY-4*Kancho/16);
  vertex(kX+2*LargoEmp/9, kY-9*Kancho/32);
  vertex(kX+7*LargoEmp/36, kY);
  endShape(CLOSE);
  ellipse(kX+5*LargoEmp/36, kY-17*Kancho/32+Kancho/6, 2*Kancho/9, 2*Kancho/9);
  //Sombras
  stroke(150);
  line(CrownLeftX, kY+Kancho/6, CrownLeftX+19*LargoCrown/20, kY+Kancho/6);
}

void KeyChain (int cX, int cY)
{
  int TailMail = KeySize/40; 
  //Cadena
  noFill();
  stroke(150);
  strokeWeight(KeySize/200);
  ellipse(cX, cY+TailMail, TailMail/2, TailMail);
  ellipse(cX-TailMail/2, cY+3*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-TailMail/2, cY+4*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-3*TailMail/4, cY+5*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-3*TailMail/4, cY+6*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-3*TailMail/4, cY+7*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-3*TailMail/4, cY+8*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-4*TailMail/4, cY+9*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-4*TailMail/4, cY+10*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-4*TailMail/4, cY+11*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-4*TailMail/4, cY+12*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-5*TailMail/4, cY+13*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-5*TailMail/4, cY+14*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-5*TailMail/4, cY+15*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-5*TailMail/4, cY+16*TailMail/2, TailMail/2, TailMail);
  ellipse(cX-5*TailMail/4, cY+17*TailMail/2, TailMail/2, TailMail);

  //MickeyMouse
  fill(206);
  noStroke();
  ellipse(cX-11*TailMail/8, cY+18*TailMail/2, 2*TailMail, 2*TailMail);
  ellipse(cX-16*TailMail/8, cY+16*TailMail/2, 5*TailMail/4, 5*TailMail/4);
  ellipse(cX-4*TailMail/8, cY+17*TailMail/2, 5*TailMail/4, 5*TailMail/4);
}

//TailMail = Kancho/12



