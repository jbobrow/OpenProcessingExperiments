
void setup(){
size(300,500);
background(0);
fill(70,130,180,175);
Background1(100,250);
filter(BLUR,100);

PImage img;
img = loadImage("logo.png");
  image(img,-30,-10);
  
}

void draw(){
  rotate(PI/48);
Background2(100,300);
Web(250,50);
Spiderman(8,16);
}

void Background1(int x, int y){
ellipse(150,x,y,y);
}

void Web(int w, int z){
strokeWeight(3);
stroke(w,w,w,z);
line(150,250,150,-20);
}


void Background2(int a, int b){
  noLoop();
fill(0,0,0,255);
ellipse(150,b,b,a);
filter(BLUR,10);
;
}

void Spiderman(int c, int d){
  
fill(250,250,250,255);
noStroke();
ellipse(145,400,c,d);
ellipse(155,400,c,d);
fill(0);
triangle(140,408,160,408,150,392);
}


