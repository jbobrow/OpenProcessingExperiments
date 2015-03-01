
//set all variables 
float a;
float b;
float c;
float d;
float dia;
float x;
float y;

void setup(){
  size (400,400);
  background(255);
}

void draw(){
//choosing random values to draw ellipse
dia=random (100);
x=random(height);
y=random(width);
//choosing random RGB colurs for ellipse
a=random(255);//to choose random colour
b=random(255);//to choose random colour
c=random(255);//to choose random colour
d=random (255);//to add transparency to the colours
stroke(a,b,c,d);//to add colour to the border
noFill();
ellipse(x,y,dia,dia);
}


