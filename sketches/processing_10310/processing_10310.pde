
PImage lettera;
PImage letterb;
PImage letterc;
PImage letterd;
PImage lettere;
PImage letterf;
PImage letterg;
PImage letterh;
PImage letteri;
PImage letterj;
PImage letterk;
PImage letterl;
PImage letterm;
PImage lettern;
PImage lettero;
PImage letterp;
PImage letterq;
PImage letterr;
PImage letters;
PImage lettert;
PImage letteru;
PImage letterv;
PImage letterw;
PImage letterx;
PImage lettery;
PImage letterz;
PFont amtype;
PFont cotype;

float x, y, r, s;

void setup() {
  size(640, 480); 
  background(0);
  smooth();
  
  lettera = loadImage("letterA.jpg");
  letterb = loadImage("letterB.jpg");
  letterc = loadImage("letterC.jpg");
  letterd = loadImage("letterD.jpg");
  lettere = loadImage("letterE.jpg");
  letterf = loadImage("letterF.jpg");
  letterg = loadImage("letterG.jpg");
  letterh = loadImage("letterH.jpg");
  letteri = loadImage("letterI.jpg");
  letterj = loadImage("letterJ.jpg");
  letterk = loadImage("letterK.jpg");
  letterl = loadImage("letterL.jpg");
  letterm = loadImage("letterM.jpg");
  lettern = loadImage("letterN.jpg");
  lettero = loadImage("letterO.jpg");
  letterp = loadImage("letterP.jpg");
  letterq = loadImage("letterQ.jpg");
  letterr = loadImage("letterR.jpg");
  letters = loadImage("letterS.jpg");
  lettert = loadImage("letterT.jpg");
  letteru = loadImage("letterU.jpg");
  letterv = loadImage("letterV.jpg");
  letterw = loadImage("letterW.jpg");
  letterx = loadImage("letterX.jpg");
  lettery = loadImage("letterY.jpg");
  letterz = loadImage("letterZ.jpg");
  noLoop();
}

void draw() {
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);
  image(lettera, -lettera.width/2, -lettera.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);
  image(letterb, -letterb.width/2, -letterb.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);
  image(letterc, -letterc.width/2, -letterc.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);
  image(letterd, -letterd.width/2, -letterd.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);
  image(lettere, -lettere.width/2, -lettere.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);
  image(letterf, -letterf.width/2, -letterf.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);
  image(letterg, -letterg.width/2, -letterg.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);
  image(letterh, -letterh.width/2, -letterh.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);ro
  image(letteri, -letteri.width/2, -letteri.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterj, -letterj.width/2, -letterj.height/2);
  popMatrix();
  
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterk, -letterk.width/2, -letterk.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterl, -letterl.width/2, -letterl.height/2);
  popMatrix();
  
    x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterm, -letterm.width/2, -letterm.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(lettern, -lettern.width/2, -lettern.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(lettero, -lettero.width/2, -lettero.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterp, -letterp.width/2, -letterp.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterq, -letterq.width/2, -letterq.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterr, -letterr.width/2, -letterr.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letters, -letters.width/2, -letters.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(lettert, -lettert.width/2, -lettert.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letteru, -letteru.width/2, -letteru.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterv, -letterv.width/2, -letterv.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterw, -letterw.width/2, -letterw.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterx, -letterx.width/2, -letterx.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(lettery, -lettery.width/2, -lettery.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  s = random(1, 4);
  pushMatrix();
  translate(x, 300);
  //rotate(r);
  //scale(s);tr
  image(letterz, -letterz.width/2, -letterz.height/2);
  popMatrix();
  
  amtype = loadFont("AmericanTypewriter-48.vlw");
  textFont(amtype);
  textSize(48);
  
  pushMatrix();
  //translate(0, 0);
  //rotate(r);
  fill(0, 255, 0);
  text("Word Creator", 20, 20, width, height);
  popMatrix();
  
  cotype = loadFont("CourierStd-20.vlw");
  textFont(cotype);
  textSize(20);
  
  pushMatrix();
  //translate(0, 0);
  //rotate(r);
  fill(255);
  text("Ever needed to come up with a creative name for a volcano, pet, or newborn child?", 20, 100, width, height);
  text("Use this letter scrambler to help you!", 20, 200, width, height);
  popMatrix();
}

void mousePressed() { 
  redraw(); 
  background(0);
}


//save("screen.jpg");

