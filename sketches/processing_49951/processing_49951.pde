
int posicionX;


void setup(){
size(700,300);
smooth();
posicionX=100;

}

void draw(){
background(255);
noFill();
ellipse(posicionX,150,100,100);
ellipse(700-posicionX,150,100,100);
rect(posicionX-50,100,100,100);
posicionX=posicionX+1; //posicionX y se suma 1 


posicionX=posicionX+1;

}

