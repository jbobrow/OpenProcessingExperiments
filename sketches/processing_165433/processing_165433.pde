
float locationX=100;

float locationY=100;

float vX=5;

float vY=3;

int sizeA=300;

void draw(){

if(locationX>sizeA){

vX=-vX;

}

if(locationX<0){

}

locationX=locationX+vX;

locationY=locationY+vY;

size(sizeA,sizeA);

background(mouseX,mouseY,0);

fill(mouseY,mouseX,0);

ellipse(locationX,locationY,50,50);



}

