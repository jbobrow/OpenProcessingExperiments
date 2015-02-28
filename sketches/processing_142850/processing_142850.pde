
void setup(){
  
size(500,500);

 
  
}
void draw() {
  
background(255,0,0);
fill(#166AF7);
ellipse(250,250,480,480);
fill(#F0F511);

//mecha

noStroke();
fill(255,255,255);
rect(mouseX-5,mouseY-180,10,80);
fill(#D1730F);
ellipse(mouseX,mouseY-180,30,45);
fill(#FFDA03);
ellipse(mouseX,mouseY-170,15,35);

//Piernas

rect(mouseX-40,mouseY+80,25,60);
rect(mouseX+20,mouseY+80,25,60);
ellipse(mouseX-45,mouseY+140,70,40);
ellipse(mouseX+45,mouseY+140,70,40);

//Cuerpo

fill(0,0,0);
ellipse(mouseX,mouseY,200,200);

//Ojos

fill(255,255,255);
ellipse(mouseX-40,mouseY,40,80);
ellipse(mouseX+40,mouseY,40,80);
fill(#5D5A5A);

//Guarda mecha
noStroke();
rect(mouseX-50,mouseY-120,100,50);
ellipse(mouseX-45,mouseY-95,50,50);
ellipse(mouseX+50,mouseY-95,50,50);

}


