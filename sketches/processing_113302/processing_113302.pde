
PGraphics colIm;
PImage cols;
PImage msk;

void setup(){
  size(900,900);
  colIm = createGraphics(width,height,P2D);
  cols = createImage(width,height,ARGB);
  msk = createImage(width,height,ARGB);
}

void draw(){
  noLoop();
  background(255);
  drawBlock();
  image(cols,-300,-300);
  drawBlock();
  image(cols,-300,0);
  drawBlock();
  image(cols,-300,300);

  drawBlock();
  image(cols,-0,-300);
  drawBlock();
  image(cols,-0,0);
  drawBlock();
  image(cols,-0,300);

  drawBlock();
  image(cols,300,-300);
  drawBlock();
  image(cols,300,0);
  drawBlock();
  image(cols,300,300);

}

void drawBlock(){
  colIm.beginDraw();
  //colIm.background(255);
  colIm.noFill();
  colIm.noSmooth();
  colIm.translate(width/2,height/2);
  color cTest = color(random(0,255),random(0,255),random(0,255));
  for (int a=0;a<50;a++){
    gradEllipse(cTest);
  }
  
  colIm.loadPixels();
  for (int i = 0; i < (width*height)-width; i++) {
    color c1 = colIm.pixels[i];
    colIm.pixels[i] = lerpColor(c1,color(255,0),random(0,0.15));
  }
  colIm.updatePixels();
  colIm.endDraw();
  cols.copy(colIm, 0, 0, width, height, 0, 0, width, height);
  colIm.beginDraw();
  colIm.background(0);
  colIm.smooth();
  colIm.fill(255);
  colIm.noStroke();
  //ellipse(0,0, 500, 500);
  colIm.rectMode(CENTER);
  colIm.rect(width/2,height/2, 270, 270);
  colIm.endDraw();
  msk.copy(colIm, 0, 0, width, height, 0, 0, width, height);
  cols.mask(msk);
}
  
void gradEllipse(color cBase){
  float x = random(-150,150);
  float y = random(-150,150);
  color c = color(random(0,255),random(0,255),random(0,255));
  color cPaint = lerpColor(cBase,c,0.2);
  color c1 = color(cPaint,50);
  color c2 = color(cPaint,0);
  for (int i=0;i<200;i++){
    colIm.stroke(lerpColor(c1,c2,i/200.0));
    colIm.ellipse(x,y,i,i);
  }
}

void keyPressed(){
  saveFrame("faintShading02###.png");
}

