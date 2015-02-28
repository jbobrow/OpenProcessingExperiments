
float posicioX;
float posicioY;

void setup (){
  size (500,500);
  background (255);
  posicioX = mouseX;
  posicioY = mouseY;
}

void draw() { 
background (255);
//fons cara
fill (0);
ellipse (mouseX,mouseY,260,260);
ellipse (mouseX-120,mouseY-120,130,130);
ellipse (mouseX+120,mouseY-120,130,130);
//detalls cara
fill(255,mouseX,mouseX);
ellipse (mouseX,mouseY,160,80);
fill (255,mouseX,mouseX);
noStroke ();
ellipse (mouseX,mouseY+40,220,170);
ellipse (mouseX-40,mouseY-10,100,200);
ellipse (mouseX+40,mouseY-10,100,200);
fill (0);
ellipse (mouseX,mouseY+70,160,80);
ellipse (mouseX-25,mouseY-10,50,75);
ellipse (mouseX+25,mouseY-10,50,75);
noStroke();
fill(255,mouseX,mouseX);
ellipse(mouseX-10,mouseY-10,5,10);
ellipse (mouseX+10,mouseY-10,5,10);
ellipse (mouseX,mouseY+50,150,60);
fill(0);
ellipse (mouseX,mouseY+40,80,40);
fill(255);
ellipse (mouseX,mouseY+30,30,10);

}




