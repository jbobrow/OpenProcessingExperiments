
int px;
void setup() {
    size (900,510);
    background(223,233,234);
    smooth (); 
    frameRate (25);
   px=0; 
}

void draw()  {
 background(223,233,234); 

   noStroke (); 
 fill (255);
 ellipse (160,60,100,25); // nuvem
 ellipse (260,60,100,25); // continuação nuvem
 ellipse (210,70,90,25); // continuação nuvem
 ellipse (210,50,90,25); // continuação nuvem
 
 ellipse (410,90,100,25); // nuvem
 ellipse (510,90,100,25); // continuação nuvem
 ellipse (460,100,90,25); // continuação nuvem
 ellipse (460,80,90,25); // continuação nuvem
 
  ellipse (710,60,100,25); // nuvem
 ellipse (810,60,100,25); // continuação nuvem
 ellipse (760,70,90,25); // continuação nuvem
 ellipse (760,50,90,25); // continuação nuvem
 
  px++;
  noStroke ();
  fill (242,245,183);
  ellipse (px,90,65,65);
  fill (247,250,159);
  ellipse (px,90,50,50); 

  
 fill (150,180,138);
 rect (0,430,900,80); // chão
 
 stroke (0);
 strokeWeight (1);
 fill (255);
 rect (30,280,560,150); // porção inferior

fill (191,184,160);
rect (30,430,560,30); // continuação porção inferior

fill (88,87,85); 
rect (60,300,130,130); // primeira janela à esquerda
rect (215,300,50,130); // segunda janela à esquerda
rect (400,300,130,130); // primeira janela à direita

fill (198,188,152);
rect (60,300,130,50); // divisória janela 1
rect (215,300,50,50); // divisória janela 2
rect (400,300,130,50); // divisória janela 3

fill (229,203,109);
rect (300,320,75,140); // porta de entrada

fill(255);
rect (590,280,200,160); //garagem 

fill (157,132,81);
rect (590,330,45,110); // porta na garagem

fill (255);
quad (130,200,130,280,30,280,30,155); // parede lateral à esquerda
rect (130,200,230,80); // porção superior à esquerda
quad (130,200,115,193,380,193,380,200); // beiral porção superior à esquerda

if (mouseX>200) {
  fill (245,227,126);
  rect (135,210,110,70);// primeira janela 
}
else { 
  fill (180);
  rect (135,210,110,70); // primeira janela 
}


if (mouseX>300) {
  fill (245,227,126);  
  rect (250,210,110,70); // segunda janela
}
else {
  fill (180);
  rect (250,210,110,70); // segunda janela
}


for ( int i=240;  i<280;  i+=20) { 
  stroke (80);
  strokeWeight (2);
  line (30,i,560,i); } // grades da sacada à esquerda
  
strokeWeight (1);
fill (255);
rect (360,150,200,80); // porção superior
rect (330,135,230,15); // beiral na porção superior

if (mouseX>400) {
  fill (245,227,126);  
  rect (380,170,180,60); // janela porção superior 
}
else {
  fill(180);
  rect (380,170,180,60); // janela porção superior
}

strokeWeight (2);
stroke (75);
line (460,170,460,230); // divisória janela
for (int i=420; i<540; i+=80) {
  strokeWeight (2);
  stroke (90);
  line (i,150,i,230); } // pilares sacada à direita


fill (183,165,116);
strokeWeight (1);
rect (560, 80, 270,220); // painel 
rect (240,230, 320, 70); // continuação painel 

fill (183,165,116);
rect (800,300,10,180); // pilar à direita

stroke (183,165,116);
line (800,300,810,300);

stroke (183,165,116);
line (560,230,560,300);

 }
