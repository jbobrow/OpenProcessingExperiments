
PImage img;
PGraphics pg;

PImage tapioka;

boolean flag =false;

void setup(){
  size(300,300);
  background(0);
  
  img = loadImage("sample.jpg");
  
  pg = createGraphics(width,height,P2D);
  
  pg.beginDraw();
  pg.fill(0,165);
  pg.noStroke();
  pg.endDraw();
  
  imageMode(CENTER);
  ellipseMode(CENTER);
  
  noCursor();
}

void draw(){
  background(0);
  
  pushMatrix();
  translate(mouseX,mouseY);
  scale(map(sin(frameCount/20.),-1,1,0.5,0.7));
  rotate(frameCount/40.);
  image(img,0,0);
  popMatrix();
  
  noStroke();
  fill(255);
  
  //blend(pg,3,3,width-5,height-5,0,0,width,height,SCREEN);
  blend(pg,0,4,width,height,0,0,width,height,SCREEN);
  blend(pg,4,0,width,height,0,0,width,height,SCREEN);
  blend(pg,3,3,width,height,0,0,width,height,SCREEN);
  
  pg.beginDraw();
  pg.image(get(),0,0);
  pg.rect(0,0,width,height);
  pg.endDraw();
}

int r(int n){
  return int(random(n));
}

