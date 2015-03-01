
void setup () {
size (255,255);
noCursor (); 
}

void draw () {
  float punta1 = mouseY +50;
  float punta2 = mouseY -50;
  float punta3 = mouseX -50;
  float punta4 = mouseX +50;
  float punta5x = mouseX -35;
  float punta5y = mouseY -35;
  float punta6x = mouseX +35;
  float punta7y = mouseY +35;
background (0,150,200);


line (mouseX,mouseY,mouseX,punta1);
line (mouseX,mouseY,mouseX,punta2);
line (mouseX,mouseY,punta3,mouseY);
line (mouseX,mouseY,punta4,mouseY);

fill (0,20,70);
stroke (0,150,200);

line (mouseX,mouseY,punta5x,punta5y);
line (mouseX,mouseY,punta6x,punta5y);
line (mouseX,mouseY,punta5x,punta7y);
line (mouseX,mouseY,punta6x,punta7y);



fill (0,0,50,mouseY);
stroke (random (50,200),60,170,60);
strokeWeight (1);
ellipse (mouseX,mouseY,mouseY/3,mouseY/3);

fill (255,235,13);
ellipse (mouseX,mouseY,mouseX/3.5,mouseX/3.5);

strokeWeight (mouseX/3);

fill (0,0,mouseY);
ellipse (mouseX,punta1,mouseX/5,mouseX/9);
ellipse (mouseX,punta2,mouseX/5,mouseX/9);
ellipse (punta3,mouseY,mouseY/5,mouseY/9);
ellipse (punta4,mouseY,mouseY/5,mouseY/9);

fill(255,255,255);
ellipse (punta5x,punta5y,mouseX/3,mouseX/3);
ellipse (punta6x,punta5y,10,10);
ellipse (punta5x,punta7y,10,10);
ellipse (punta6x,punta7y,mouseX/3,mouseX/3);


}


