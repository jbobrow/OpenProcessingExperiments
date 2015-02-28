
//pacmanrana
float inicio1=0.0;
float fin1=TWO_PI;
float inicio2=0.63;
float fin2=5.61;
float temp=0.0;

void setup(){
size(500,500);
smooth();
strokeWeight(2);
noStroke();
fill(270,280,0);
frameRate(5);
ellipseMode(CENTER);
}

void draw(){
background(800);
fill(0,200,0);
arc(mouseX,mouseY,100,100,inicio1,fin1);
fill(255);
ellipse(mouseX+5,mouseY-50,30,30);
fill(0);
ellipse(mouseX+5,mouseY-50,15,10);

temp=inicio1;
inicio1=inicio2;
inicio2=temp;
temp=fin1;
fin1=fin2;
fin2=temp;
}



