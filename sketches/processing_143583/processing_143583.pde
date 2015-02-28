
float posicioX;
float posicioY;


void setup(){
size(600,600);
background(255);
noCursor();

posicioX= mouseX;
posicioY= mouseY;
}

void draw(){
  stroke(0);
  background(mouseX,mouseY,0);
  
fill(10,172,198);
ellipse(mouseX,mouseY,250,240);

fill(255);
ellipse(mouseX,mouseY+15,225,200);

line(mouseX-98,mouseY-42,mouseX-35,mouseY-15);
line(mouseX-115,mouseY-3,mouseX-38,mouseY+3);
line(mouseX-102,mouseY+40,mouseX-37,mouseY+27);

line(mouseX+102,mouseY-42,mouseX+38,mouseY-15);
line(mouseX+110,mouseY-3,mouseX+40,mouseY+3);
line(mouseX+106,mouseY+40,mouseX+39,mouseY+23);

line(mouseX+3,mouseY-40,mouseX+3,mouseY+67);

noFill();
arc(mouseX+3,mouseY+25,190,85,2*PI,3*PI);


fill(255);
ellipse(mouseX-25,mouseY-76,55,70);

fill(255);
ellipse(mouseX+30,mouseY-76,55,70);

fill(255,0,0);
ellipse(mouseX+3,mouseY-36,35,35);

stroke(255);

fill(255);
ellipse(mouseX-2,mouseY-38,11,11);

fill(0);
ellipse(mouseX+25,mouseY-74,12,12);

ellipse(mouseX-19,mouseY-74,12,12);
}

