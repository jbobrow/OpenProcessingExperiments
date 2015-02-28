
import timeline.*;

Timeline tl;

PGraphics pg;

void setup(){
  size(400,400);
  tl = new Timeline(this);
  
  fill(255);
  noStroke();
  
  ellipseMode(CENTER);
  colorMode(HSB,255);
  
  pg = createGraphics(width,height,P2D);
}

void draw(){
  if(frameCount%100<10){ fill(255); text("click to replay", 20,20); }
  
  fill(0,4);
  rect(0,0,width,height);
  
  translate(width/2,height/2);
  rotate(frameCount/20.);
  
  float x = tl.getValue("x");
  float y = tl.getValue("y");
  float s = tl.getValue("s");
  
  int n = 8;
  float r = TWO_PI/float(n);
  for(int i=0; i<n; i++){
    rotate(r);
    fill(s,200,255);
    ellipse(x,y,s,s);
  }
  
  //blend(pg,0,4,width,height,0,0,width,height,ADD);
  //blend(pg,4,0,width,height,0,0,width,height,ADD);
  blend(pg,3,3,width-4,height-4,0,0,width,height,BURN);
  
  pg.beginDraw();
  pg.fill(255,230);
  pg.noStroke();
  pg.image(get(),0,0);
  pg.rect(0,0,width,height);
  pg.endDraw();
}

void mousePressed(){
  tl.setTime("x",0f);
  tl.setTime("y",0f);
  tl.setTime("s",0f);
}


