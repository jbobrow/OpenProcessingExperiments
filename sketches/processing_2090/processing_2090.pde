
/*
SESION 2: ejercicio Malevich

Annabel Salinas
IDEP - Motion Graphic 09
Processing: Alba G Corral

DUDAS
PImage sería una variable?
Pq fondo tiene tres parámetros?
Bloques?
*/


//VARIABLES (declarar aquí las variables)


//VOID SETUP (función de inicialización GENERALES: tamaño, fondo, punto de anclaje)
size(450,625);
//elementios sin trazo pq pone trazo por defecto
noStroke();


//FOTO DE FONDO
//PImage = imagenes que están en el directorio para cargar. Lo de "fondo" es un apunte para mi aclaración.
PImage fondo;
// cargar la imagen del fondo
fondo = loadImage("Malevich - fons.jpg");
image(fondo, 0,0);

//CÍRCULO ROJO
//fill= color (si es RGB tiene 3 valores - 1 valo es escala de grises y 4 es RGB+alfa))
fill(178,50,1);
//los valores son x+y del lienzo, x+y de la elipse
ellipse(90,100,150,150);


// RECTÁNGULO ROJO ABAJO IZQUIERDA
fill(132,35,18);
//los valores son x+y del lienzo, x+y de la elipse, situación PUNTOS FIGURA
quad(186,377,221,377,152,565,122,565);

// RECTÁNGULO ROJO ABAJO DERECHA
fill(132,35,18);
quad(280,584,401,518,401,546,293,604);

// RECTÁNGULO AMARILLO HORIZONTAL
fill(208,153,0);
quad(25,260,351,229,352,254,29,290);

// RECTÁNGULO AMARILLO ABAJO IZQUIERDA
fill(208,153,0);
quad(157,399,179,399,103,625,81,625);

// RECTÁNGULO AMARILLO ABAJO DERECHA
fill(208,153,0);
quad(340,586,437,537,437,558,340,604);

// RECTÁNGULO BLANCO ABAJO
fill(212,212,217);
quad(233,392,282,392,233,539,179,539);

// CRUZ AZUL = beginShape (es como dibujar una forma con la plumilla: punto por punto)
fill(3,6,121);
beginShape(); //formas complejas
vertex(201, 113);
vertex(181, 118);
vertex(180, 109);
vertex(199, 103);
vertex(196, 84);
vertex(206, 82);
vertex(209, 100);
vertex(230, 94);
vertex(233, 102);
vertex(211, 110);
vertex(290, 549);
vertex(279, 556);
endShape(CLOSE);

// CUADRADO AZUL ROTADO (pushmatrix el punto 0.0, trasladar a otro lugar, rotar, color, cuadrado colocado en el nuevo punto0.0)
pushMatrix();
translate(244,98);
rotate(PI/5.8); 
fill(9,5,28);
rect(0,0,146,140);
popMatrix();

//

