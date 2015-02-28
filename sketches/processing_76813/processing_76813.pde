
//Autor: Sergio.S
/*Descripción: cara de persona normal 
con la capacidad de mutar a un lagarto*/
/*NOTA: se recomienda pulsar el botón
cuando los ojos de la cara están cerrados.
Pura estética tan solo*/
int ojos = (#FFE70A);
void setup(){
  size (400,400);
  smooth ();
}
void draw(){
background(10,182,247);
// cara
fill(255,194,95);
ellipse (200,200,300,300);
//ojos
fill(255);
ellipse (145,138,70,mouseX/5);
ellipse (260,138,70,mouseX/5);
fill (0);
ellipse (145,138,30,mouseX/7);
ellipse (260,138,30,mouseX/7);
//nariz
stroke(0);
fill(255);
triangle (200,240,156,240,200,200);
//boca
noFill ();
arc (200,250,170,mouseY/3, radians(0),radians(180));
if (mousePressed){
  fill(#197E11);
ellipse (200,200,300,300);
  fill(ojos);
ellipse (145,138,70,mouseX/5);
ellipse (260,138,70,mouseX/5);
fill (0);
ellipse (145,138,30,mouseX/5);
ellipse (260,138,30,mouseX/5);
noFill ();
arc (200,250,170,mouseY/3, radians(0),radians(180));
line (180,195,180,231);
line (215,195,215,231);
}
}

void mouseReleased(){
  fill(255);
ellipse (145,138,70,mouseX/5);
ellipse (260,138,70,mouseX/5);
}

