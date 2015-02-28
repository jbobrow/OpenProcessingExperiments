
void setup(){
size(800,450);
background(#B9D3EE);
}


void draw(){
  int x=int(random(0,800));
int y=int(random(0,450));

frameRate(12);
noStroke();
fill(.0005*y,x*.5,x*.5,70);

rectMode(CORNERS);
rect(x,y,160,90);

}

