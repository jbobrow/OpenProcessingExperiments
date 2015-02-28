
int xpos;
int op;
void setup(){
size(600,600);

op= 255;
xpos = 275;
}

void draw(){
background(0);
ellipse(xpos, 300, 100, 100);

if (mousePressed){
op= op-5;

ellipse(xpos, 300, 100, 100);
fill(255,255,255,op);
}
}

