
int x=700;
int y=700;
int mida=50;
int bolesPetites=75;
int petites=25;

void setup () {

size(x,y);
strokeWeight(3);
stroke(12,77,247);

}




void draw () {
background (0);

fill(mouseX,150,mouseY);

line(mouseX,mouseY,mida,mida);
line(mouseX,mouseY,mida+600,mida);
line(mouseX,mouseY,mida,mida+600);
line(mouseX,mouseY,mida+600,mida+600);

fill(mouseX,mouseX,135);

ellipse(mouseX,mouseY,mida/3,mida/3);

fill(255,56,mouseX);
ellipse(mouseX-mida,mouseY+mida,mouseY/5,mouseY/4);
ellipse(mouseX+mida,mouseY+mida,mouseY/5,mouseY/4);

fill(mouseX,47,mouseY);
ellipse(mouseX-mida,mouseY-mida,mouseY/5,mouseY/4);
ellipse(mouseX+mida,mouseY-mida,mouseY/5,mouseY/4);

//condicionals

if(mouseX>=x/2){
stroke(255,0,0);
}
if(mouseX<=x/2){
  stroke(255,247,3);
}
if(mouseY>=y/2){
  stroke(random(150,255),40,68);
}

if(mouseY<=y/2){
  stroke(random(90,150), 150, 45);
}


fill(255,mouseY,255);
ellipse(mouseX-bolesPetites,mouseY,mouseY/5,random(50,80));
ellipse(mouseX+bolesPetites,mouseY,mouseY/5,random(50,80));


fill(mouseX,255,mouseY);
ellipse(mouseX,mouseY-bolesPetites,mouseX/5,random(50,80));
ellipse(mouseX,mouseY+bolesPetites,mouseX/5,random(50,80));


}

