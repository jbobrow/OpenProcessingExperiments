
//__________________________________par_GUIGUI_le_22_2_2009______________________8^)_________________
PFont sax;
int huemode = 2;
int brightmode = 2;
YY[] yy;
int Xnum = 8;
int Ynum = 5;
//___________________________________________________________________________________________________
void setup()
{
  size(880, 520);

  sax = loadFont("saxMono-30.vlw"); 

  frameRate(25);
  
  smooth();
  colorMode(HSB, 1);
  noStroke();

  yy = new YY[Xnum*Ynum];
  for (int i = 0; i < Ynum; i++) {
    for (int j = 0; j < Xnum; j++) {
      int index = (i * Xnum) + j;
      yy[index] = new YY(float(j*120),float(i*120));
      yy[index].colorize();
    }
  }
}
//___________________________________________________________________________________________________
void draw()
{ 
  background(0,0,.5);

  huemode = floor(mouseY/175);
  brightmode = floor(mouseX/300);

  for (int i = 0; i < Xnum*Ynum; i++) {
    yy[i].move();
    yy[i].trace();
  }

  fill(0,0,.4);
  rect(0, 0, 40, 480);
  rect(0, 480, 880, 40);
  fill(0,0,1);
  textFont(sax, 20);
  text("The horizontal coordinate of the mouse control the new Taijitus brightness",55,20);
  pushMatrix();
  translate(850,22);
  rotate(PI/4);
  text("&",0,0);
  rotate(PI/4);
  text("vertical coordinate control the hue.",12,-10);
  popMatrix();
  textFont(sax, 30);
  if(brightmode == 0) {
    fill(0,0,1);
  } 
  else {
    fill(0,0,.3);
  }
  text("contrast",140,510);
  if(brightmode == 1) {
    fill(0,0,1);
  } 
  else {
    fill(0,0,.3);
  }
  text("random",430,510);
  if(brightmode == 2) {
    fill(0,0,1);
  } 
  else {
    fill(0,0,.3);
  }
  text("soft",680,510);
  rotate(-PI/2);
  if(huemode == 0) {
    fill(0,0,1);
  } 
  else {
    fill(0,0,.3);
  }
  text("camaïeu",-120,27);
  if(huemode == 1) {
    fill(0,0,1);
  } 
  else {
    fill(0,0,.3);
  }
  text("random",-264,27);
  if(huemode == 2) {
    fill(0,0,1);
  } 
  else {
    fill(0,0,.3);
  }
  text("complementary",-515,27);
}
//___________________________________________________________________________________________________
class YY {

  float Xpos, Ypos, h1, b1, h2, b2, taille, tailleIn, rot;

  YY (float posX, float posY) {
    Xpos=posX;
    Ypos=posY;
    taille = random(90,111);
    tailleIn = random(9,24);
    rot = random(.5, 1);
  }

  void colorize() {
    h1 = random(1);
    switch(huemode) {
    case 0: // -----------------------------------camaïeu
      h2 = h1 + random(.03, .12);
      if ( h2 > 1) {
        h2 = h2 -1;
      }
      break;
    case 1: // -----------------------------------random
      h2 = random(1);
      break;
    case 2: // -----------------------------------complementary
      h2 = h1 + .5;
      if ( h2 > 1) {
        h2 = h2 -1;
      }
      break;
    }    
    switch(brightmode) {
    case 0: // -----------------------------------contrast
      b1= random(.3);
      b2= b1+.4+random(.5);
      break;
    case 1: // -----------------------------------random
      b1= random(1.1)-.1;
      b2= random(1.1);
      break;
    case 2: // -----------------------------------soft
      b1= .2+random(.8);
      b2= (b1+.2 < 1) ? b1+random(.2) : b1-random(.2);
      break;
    }    
  }

  void trace() {
    pushMatrix();
    fill((h1+h2)/2,1,(b1+b2)/2);
    translate(Xpos, Ypos);
    ellipse(0, 0, taille-3, taille-3);
    rotate((rot)*float(millis())/2000);
    demi(taille,h1,b1);
    rotate(PI);
    demi(taille,h2,b2);
    fill(h1,1,b1);
    ellipse(taille/4, 0, tailleIn, tailleIn);
    fill(h2,1,b2);
    ellipse(-taille/4, 0, tailleIn, tailleIn);
    popMatrix();
  }

  void move(){
    Xpos = Xpos+sin(float(millis())/12000);
    Ypos = Ypos+cos(float(millis())/12000);
    if (Xpos>940) { 
      Xpos = Xpos - 960;
      colorize();
    }
    if (Xpos<-20) { 
      Xpos = Xpos + 960;
      colorize();
    }
    if (Ypos>540) { 
      Ypos = Ypos - 600;
      colorize();
    }
    if (Ypos<-60) { 
      Ypos = Ypos + 600;
      colorize();
    }
  }
}
//___________________________________________________________________________________________________
void demi(float scaleYY,float hhh,float bbb) {
  fill(hhh,1,bbb);
  beginShape();
  vertex(-scaleYY/2, 0);
  bezierVertex(-scaleYY/2, -scaleYY/3.6, -scaleYY/3.6, -scaleYY/2, 0, -scaleYY/2);
  bezierVertex(+scaleYY/3.6, -scaleYY/2, +scaleYY/2, -scaleYY/3.6, +scaleYY/2, 0);
  bezierVertex(+scaleYY/2, +scaleYY/7.2, +scaleYY/4+scaleYY/7.2, +scaleYY/4, +scaleYY/4, +scaleYY/4);
  bezierVertex(+scaleYY/4-scaleYY/7.2, +scaleYY/4, 0, +scaleYY/7.2, 0, 0);
  bezierVertex(0, -scaleYY/7.2, -scaleYY/4+scaleYY/7.2, -scaleYY/4, -scaleYY/4, -scaleYY/4);
  bezierVertex(-scaleYY/4-scaleYY/7.2, -scaleYY/4, -scaleYY/2, -scaleYY/7.2, -scaleYY/2, 0);
  endShape(CLOSE);
}
//___________________________________________________________________________________________________








