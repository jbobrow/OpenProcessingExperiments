
PGraphics pg;

void setup()
{
  background(0);
  size(400,400,P2D);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  
  noCursor();
  
  pg = createGraphics(width/3,height/3,P2D);
  
  colorMode(HSB,255);
  
  frameRate(60);
  
  strokeJoin(ROUND);
  strokeCap(ROUND);
}

void draw()
{
  pg.beginDraw();
  pg.background(0);
  pg.blend(get(),0,0,width,height,0,0,pg.width,pg.height,ADD); // to be small
  pg.endDraw();
  
  background(0);
  
  blend(pg,0,0,pg.width,pg.height,0,0,width,height,ADD);
  
  noFill();
  strokeWeight(8);
  stroke((frameCount/2.0)%255,255,255);
  
  for(int i=0;i<3;i++){
    line(mouseX,mouseY,pmouseX, pmouseY);
  }
  
  println(frameRate);
}

