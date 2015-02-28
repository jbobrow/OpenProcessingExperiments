
//Melanie Danver 
//copyright 2012 mdanver
//r, g, b, is the color blue in the background of the letters
float r, g, b;
float tx, ty, td, txSpeed, tr;
float ux, uy, ud, uySpeed, ur;

void setup()
{
  size(400, 400);
  background(255, 255, 255);
  smooth();
  r = 0;
  g = 189;
  b = 255;

  tx = 0;
  ty = random(height);
  td =100;
  txSpeed = 1;
  tr = random(-5, 5);

  ux = random(width);
  uy = 50;
  ud =100;
  uySpeed = 1;
  ur = random(-2, 2);
}

void draw()
{

  drawMelanie(tx, ty, td, td); 
  wrapMelanie();
  bounceMelanie();
  drawMelanie(ux, uy, ud, ud);
}

void wrapMelanie()
{
  tx = tx + txSpeed;
  ty = ty + tr;
  if (tx >= width+(td/2))
  {
    tx = 0 - (td/2);
  }
  if (ty >= height+(td/2))
  {
    ty = 0-(td/2);
    tr = random(-5, 5);
  }
  if (ty <= 0-(td/2))
  {
    ty = height+(td/2);
    tr = random(-5, 5);
  }
}

void bounceMelanie()
{
  uy = uy + uySpeed;
  ux = ux + ur;
  if (uy >= height - (ud/2))
  {
    uySpeed = -uySpeed;
    ur = random(-2, 2);
  }
  else if (uy < 0+(ud/2))
  { 
    uySpeed = - uySpeed;
    ur = random(-2, 2);
  }
  if (ux >= width-(ud/2))
  {
    uySpeed = -uySpeed;
    ur = random(-2, 2);
  }
  if (ux <= 0+(ud/2))
  {
    uySpeed = -uySpeed;
    ur = random(-2, 2);
  }
}



void mousePressed()
{
  r = random(255);
  g = random(255);
  b= random(255);
}


void drawMelanie(float x, float y, float wd, float ht)
{
  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);

  strokeWeight(15);
  stroke(r, g-99, b-137);
  fill(r, g-99, b-137);
  ellipse(x, y, wd-30, ht-40);
  strokeWeight(abs(.05*((wd+ht)/2)));
  noFill();
  stroke(r, g, b);
  //Melanie
  beginShape();
  curveVertex( x-(11/24.0*wd), y+(1/6.0)*ht);  //6
  curveVertex( x-(11/24.0*wd), y+(1/6.0)*ht);  //6
  curveVertex(x-(1/3.0)*wd, y-(1/3.0)*ht);//3
  curveVertex(x-(1/3.0)*wd, y+(1/3.0)*ht); // 7
  curveVertex(x-(1/3.0)*wd, y+(1/3.0)*ht); // 7
  endShape();
  beginShape();
  curveVertex(x-(1/3.0)*wd, y+(1/3.0)*ht); // 7
  curveVertex(x-(1/3.0)*wd, y+(1/3.0)*ht); // 7
  curveVertex(x-(1/6.0)*wd, y-(11/24.0)*ht);//2
  curveVertex(x-(1/6.0)*wd, y+(11/24.0)*ht);  //8
  curveVertex(x-(1/6.0)*wd, y+(11/24.0)*ht);  //8
  endShape();
  //Marie
  beginShape();
  curveVertex(x-(1/6.0)*wd, y+(11/24.0)*ht);  //8
  curveVertex(x-(1/6.0)*wd, y+(11/24.0)*ht);  //8
  curveVertex(x, y-.5*ht);
  curveVertex(x, y+.5*ht); //9
  curveVertex(x, y+.5*ht); //9
  endShape();
  beginShape();
  curveVertex(x, y+.5*ht); //9
  curveVertex(x, y+.5*ht); //9
  curveVertex(x+(1/6.0)*wd, y-(11/24.0)*ht); //16
  curveVertex(x+(1/6.0)*wd, y+(11/24.0)*ht);  //10
  curveVertex(x+(1/6.0)*wd, y+(11/24.0)*ht);  //10
  endShape();
  //Danver
  beginShape();
  curveVertex(x+(1/3.0)*wd, y+(1/3.0)*ht); //11
  curveVertex(x+(1/3.0)*wd, y+(1/3.0)*ht); //11
  curveVertex( x+(11/24.0*wd), y+(1/6.0)*ht); //12
  curveVertex(x+.5*wd, y); //13
  curveVertex( x+(11/24.0*wd), y-(1/6.0)*ht); //14
  curveVertex(x+(1/3.0)*wd, y-(1/3.0)*ht); //15
  curveVertex(x+(1/3.0)*wd, y-(1/3.0)*ht); //15
  endShape();
  strokeWeight(abs((.05*((wd+ht)/2))+3));
  line(x+(1/3.0)*wd, y+(1/3.0)*ht-3, x+(1/3.0)*wd, y-(1/3.0)*ht+3);

  //shaded blue shadowing
  noFill();
  translate(4, 4);
  stroke(r+201, g+52, b);
  strokeWeight(abs(.048*((wd+ht)/2)));
  //Melanie
  beginShape();
  curveVertex( x-(11/24.0*wd), y+(1/6.0)*ht);  //6
  curveVertex( x-(11/24.0*wd), y+(1/6.0)*ht);  //6
  curveVertex(x-(1/3.0)*wd, y-(1/3.0)*ht);//3
  curveVertex(x-(1/3.0)*wd, y+(1/3.0)*ht); // 7
  curveVertex(x-(1/3.0)*wd, y+(1/3.0)*ht); // 7
  endShape();
  beginShape();
  curveVertex(x-(1/3.0)*wd, y+(1/3.0)*ht); // 7
  curveVertex(x-(1/3.0)*wd, y+(1/3.0)*ht); // 7
  curveVertex(x-(1/6.0)*wd, y-(11/24.0)*ht);//2
  curveVertex(x-(1/6.0)*wd, y+(11/24.0)*ht);  //8
  curveVertex(x-(1/6.0)*wd, y+(11/24.0)*ht);  //8
  endShape();
  // Marie
  stroke(r+152, g+39, b);
  beginShape();
  curveVertex(x-(1/6.0)*wd, y+(11/24.0)*ht);  //8
  curveVertex(x-(1/6.0)*wd, y+(11/24.0)*ht);  //8
  curveVertex(x, y-.5*ht);
  curveVertex(x, y+.5*ht); //9
  curveVertex(x, y+.5*ht); //9
  endShape();
  beginShape();
  curveVertex(x, y+.5*ht); //9
  curveVertex(x, y+.5*ht); //9
  curveVertex(x+(1/6.0)*wd, y-(11/24.0)*ht); //16
  curveVertex(x+(1/6.0)*wd, y+(11/24.0)*ht);  //10
  curveVertex(x+(1/6.0)*wd, y+(11/24.0)*ht);  //10
  endShape();
  // Danver
  stroke(r+108, g+26, b);
  beginShape();
  curveVertex(x+(1/3.0)*wd, y+(1/3.0)*ht); //11
  curveVertex(x+(1/3.0)*wd, y+(1/3.0)*ht); //11
  curveVertex( x+(11/24.0*wd), y+(1/6.0)*ht); //12
  curveVertex(x+.5*wd, y); //13
  curveVertex( x+(11/24.0*wd), y-(1/6.0)*ht); //14
  curveVertex(x+(1/3.0)*wd, y-(1/3.0)*ht); //15
  curveVertex(x+(1/3.0)*wd, y-(1/3.0)*ht); //15
  endShape();
  strokeWeight(abs(.048*((wd+ht)/2)+3));
  line(x+(1/3.0)*wd, y+(1/3.0)*ht-3, x+(1/3.0)*wd, y-(1/3.0)*ht+3);
}


