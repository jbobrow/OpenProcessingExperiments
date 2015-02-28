
int rectsize = 20;
PVector _rectsize = new PVector(rectsize,rectsize);
int w = int(_rectsize.x*_rectsize.x);
int h = int(_rectsize.x*_rectsize.y);
boolean plant=false;


void mousePressed(){
  if(!plant){
    downx = mouseX;
    downy = mouseY; 
  }
  plant = true; 



}

int downx;
int downy;

void mouseReleased(){
  plant = false; 
  background(-1);
  strokeWeight(1);
  stroke(1,91);
  for (int xi=0;xi<w;xi+=_rectsize.x){
    // line(0,xi,w,xi);
    line(xi,0,xi,h);
  }

  for (int x=0;x<h;x+=_rectsize.y){
    line(0,x,w,x);
    //line(x,0,x,h);
  }
  _rectsize = new PVector(abs(downx-mouseX),abs(downy-mouseY));
  halfrectsizex = _rectsize.x/2;
  halfrectsizey = _rectsize.y/2;
  //updatePixels();
  //arraycopy(pixels,stage.pixels);
  stage=get();

}
void setup(){
  size(400,400);
  rectMode(CENTER); 
  smooth();
  loadPixels();
  stage=new PImage(w,h);

  background(-1);
  strokeWeight(1);
  stroke(1,91);
  for (int xi=0;xi<w;xi+=_rectsize.x){

    line(xi,0,xi,h);
  }

  for (int x=0;x<h;x+=_rectsize.y){
    line(0,x,w,x);

  }

  stage=get();
}

void mouseDragged(){
  _rectsize = new PVector(abs(downx-mouseX),abs(downy-mouseY));
  halfrectsizex = _rectsize.x/2;
  halfrectsizey = _rectsize.y/2;



}
float halfrectsizex = _rectsize.x/2;
float halfrectsizey = _rectsize.y/2;
PImage stage;
void draw(){
  if (_rectsize.x<2)_rectsize.x=2;
  if (_rectsize.y<2)_rectsize.y=2;
  image(stage,0,0); 
  if(plant){
    noStroke();
    fill(255,0,0,111);
    ellipseMode(CENTER);
    ellipse(downx,downy,_rectsize.x,_rectsize.y);
    stroke(1);
    line(downx,downy,mouseX,mouseY);
  }
  strokeWeight(2);
  stroke(255,0,0);

  rect(int(mouseX/_rectsize.x)*_rectsize.x+halfrectsizex,int(mouseY/_rectsize.y)*_rectsize.y+halfrectsizey,_rectsize.x,_rectsize.y);

}

