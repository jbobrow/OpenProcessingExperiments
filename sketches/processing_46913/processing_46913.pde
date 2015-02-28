
PImage img;

int xpos;
int op;
void setup(){
size(600,600);
img = loadImage("medusa.jpg");

op= 0;
xpos = 0;
}

void draw(){
background(0);

rect(xpos, 0, 600, 600);
image(img, 0, 0);

if (mousePressed){
op= op+3;




rect(xpos, 0, 600, 600);
fill(0,0,0,op);



}else{
  op=0;
}



}

