
int posicion1=0;
int posicion2=50;
void setup(){
  size(550,600);
  noStroke();
}

void draw(){
  background(posicion1);
    stroke(posicion1,10,10);
    posicion1=(posicion1+2)%200;
    
//Borde del dibujo
strokeWeight (4);

//Bordes de cara

noStroke();
fill(#FF6600);
ellipse (250,190,250,200);
fill(#CCFF00);
ellipse (250,190,200,150);
fill(#FFFFFF);
ellipse (250,190,150,110);

//Cuerpo
fill(#006600);
rect (215,285,70,200);

//Hojas
ellipse (385,430,200,80);
ellipse (115,430,200,80);
fill (#00CC00);
    stroke(posicion1,10,10);
    posicion1=(posicion1+2)%200;

//Ojos
fill(#080500);
ellipse (230,170,10,mouseY/10);
ellipse (280,170,10,mouseY/10);

//Sorprendido
ellipse (255,225,50,mouseX/20);

}


