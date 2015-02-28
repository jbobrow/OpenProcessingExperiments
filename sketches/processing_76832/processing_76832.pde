
//Autor: Adri
int relleno=0;
void setup (){
size(200,300);
background(252,219,219);
smooth();
}
void draw (){
fill(252,219,219);
rect (0,0,200,300);
fill (198,76,100);
stroke (198,76,100);
rect(25,125,150,90);
fill(255,255,255);
stroke (255,255,255);
rect(10,10,50,50);
rect(140,10,50,50);
fill(252,219,219);
stroke (0);
rect(95,45,10,75);
rect(25,125,150,20);
stroke (0);
triangle(105,65,105,120,135,120);
triangle(95,65,95,120,65,120);
fill(255,255,255);
stroke (255,255,255);
rect(25,125,150,20);
rect(25,200,150,20);
fill(255,0,0);
triangle(42,125,56,125,50,180);
triangle(156,125,142,125,150,180);
ellipse (25,25,30+mouseX/15,30+mouseX/15);
ellipse (155,25,30+mouseX/15,30+mouseX/15);
fill (56,177,206);
stroke (56,177,206);
rect (140,190,30,mouseY/2.5);
fill (relleno);
noStroke ();
ellipse (25,25,15+mouseX/15,15+mouseX/15);
ellipse (155,25,15+mouseX/15,15+mouseX/15);

}

void mousePressed(){
  relleno=255;
}

void mouseReleased(){
  relleno=0;
}

  


