
int variable=40;
int yo=46;

int pX=1;
int pY=1;

void setup (){
  size(400,300);
// background(210,20,14);
rectMode(CENTER);
noStroke();
variable=yo+80;
}

void draw ( ) {
  // if (musePressed){


rect (pX,pY,4,4);
rect (mouseX,mouseY,40,40);

pX= mouseX;
pY= mouseY;
// )
  }


