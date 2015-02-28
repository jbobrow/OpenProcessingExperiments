
void setup() {
size (800,600);


// delcaro variables
int anchura = 600;
int altura = 350;
int anchuraGol = altura/5;
int alturaGol = anchura/5;


// configuro trazos y colores y modos
background (0);
stroke(230,80,0);
strokeWeight(6);
fill(130,30,0);
rectMode (CENTER);


//dibujo base do campo
rect ( width/2, height/2, anchura, altura );

//dibujo centro do campo
ellipse (width/2, height/2, altura/3, altura/3);

//dibujo goles

rect ((width/2)-(anchura/2)+(anchuraGol/2), height/2, anchuraGol, alturaGol);
rect ((width/2)+(anchura/2)-(anchuraGol/2), height/2, anchuraGol, alturaGol);

// dibujo linha de medio

line (width/2,(height/2) - (altura/2),width/2,  (height/2) + (altura/2));


}



