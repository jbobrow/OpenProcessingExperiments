
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
int a = 0;
int b = 0;
int c = 0;
int d = 0;

void draw ( ) { 
  a = mouseX * 2 -300;
  b = mouseY /3 +100;
  c = mouseX /2;
  d= mouseY /2;
  line(a,b,c,d);
}



