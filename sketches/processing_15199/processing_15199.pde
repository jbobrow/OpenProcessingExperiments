
void setup () {
  size (600,600);
  rectMode (CENTER);
  ellipseMode (CENTER);
  noCursor ();
  smooth ();
}

void draw () {
  background (200);
  happyFace (100,100, 100,200, 100);
  happyFace (100,300, 260,310, 0);
  happyFace (100,500, 320,50, 70);
  happyFace (300,100, 250,120, 150);
  happyFace (300,300, 120,170, 75);
  happyFace (300,500, 160,180, 120);
  happyFace (500,100, 75,240, 200);
  happyFace (500,300, 280,200, 30);
  happyFace (500,500, 100,120, 125);
  happyFace (mouseX,mouseY, 50,50, 0);
}

void happyFace (float faceX, float faceY, int faceW, int faceH, int faceStroke) {
  stroke (faceStroke);
  strokeWeight (5);
  rect (faceX,faceY, faceW,faceH);
  ellipse (faceX + (faceW/5),faceY - (faceH/5), (faceW * faceH)/1000,(faceW * faceH)/1000);
  ellipse (faceX - (faceW/5),faceY - (faceH/5), (faceW * faceH)/1000,(faceW * faceH)/1000);
  arc (faceX, faceY + (faceH/10), faceW/2,faceH/5, 0,PI);
}


