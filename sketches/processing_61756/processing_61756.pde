


void setup(){
size(800,450);
background(#B9D3EE);
}



void draw(){
  
  frameRate(12);
 if (mouseX<400) {
   icecube();
 } else {
   fireball();
 
}}

  void icecube() {
    int x=int(random(0,800));
int y=int(random(0,450));
  noStroke();
  fill(.0005*y,x*.5,x*.5,70);
  rectMode(CORNERS);
  rect(x,y,160,90);
}

void fireball() {
  int x=int(random(0,800));
int y=int(random(0,450));
 noStroke();
 smooth();
 fill(x*.5,x*.005,.0005*y,70);
 ellipse(700,350,x,x);
}
  

