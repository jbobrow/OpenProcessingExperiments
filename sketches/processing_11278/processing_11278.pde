
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), and ellipse(). Squares are made
 * with rect() and circles are made with
 * ellipse(). Each of these functions requires a number
 * of parameters to determine the shape's position and size. 
 */
 
size(600, 600);
smooth(); 
background(390);
noStroke();
fill(236);
triangle(109, 160, 210, 200, 145, 300);
rect(45, 876, 35, 35);
quad(105, 10, 120, 10, 120, 200, 80, 200);
ellipse(140, 80, 40, 40);
triangle(160, 10, 295, 200, 160, 200); 
//PS un circulo es una ellipse que tiene el mismo ancho y alto.

//setae una ventana en processing a 200 pixels ancho y 200 pixeles de alto

size(600, 200);

//Por defecto, processing coloca un borde pixeleado negro alrededor de sus graficas.
//la funcion noStroke() lo apagara.

noStroke();

//cambiar el fondo a negro. Lo que va () se puede cambiar para que resulte otro color.

background(699);

//Hagamos el circulo suave, por defecto, lucira un poco “duro”

smooth();

/*por defecto ellipseMode es CENTER. Quiero comenzar con CORNER.
Si una caja fuera a ser dibujada alrededor de la ellipse, el costado superior izquierdo de esa caja estaria en los primeros 2 argumentos
*/

ellipseMode(CORNER);


//dibuja una elipse que sea de 50 pixeles de ancho por150 pixeles de alto
//y el costado superior iquierdo de la caja este 75, 10

ellipse(75, 10, 50, 150);

/*cambiemos ellipseMode atras a CENTER, por defecto.
Ahora el centro de la elipse esta situado en losprimeros 2 argumentos.
 is placed at the first two arguments en la funcion ellipse().  
Ancho y alto son son aun los mismos.
*/

ellipseMode(CENTER);

//cambiaremos el "fill" de la siguiente elipse a un gris claro 

fill(185);

//hagamos que esta elipse luzca “dura”, apagaremos smooth() y lo llamaremos noSmooth().

noSmooth();

/*Dibujaremos una elipse que tenga 100 pixeles de ancho y 55 pixeles de alto y su centro este a 50, 100.
El lado izquierdo de la elipse deberia tocar el lado izquierdo de la pantalla.
Puedes ver por que?
 Tambien fijate que parte de esta nueva elipse tapa parte de la elipse antigua, eso es porque  processing pinta sobre cualquier imagen en el algoritmo.
*/

ellipse(50, 100, 100, 55);

//Mejor volvamos a smooth…

smooth();



/*Cambiemos el ellipseMode a CORNERS.  
CORNERS nos permite dibujar una elipse definiendo la esquina izquierda superior y la esquina derecha inferior de su caja
*/

ellipseMode(CORNERS);

//cambiar "fill" a un gris oscuro

fill(200);

//dibujar un rectangulo donde su esquina superior izquierda sea de 0,175
//y su esquina inferior derecha este a 200, 190

// dibujar una ellpse donde su esquina superior izquierda sea de 0,155
//y su esquina inferior derecha este a 200, 190

ellipse(0, 155, 200, 190);

//dibujaremos una caja alrededor del ultimo circulo.
//es el mismo argumento que la elipse, pero usa rectMode y rect.

rectMode(CORNERS);

//apaga fill y enciende stroke con un grosor de 2 pixeles.
//de otra manera el rect's fill pintara sobre nuestra elipse!

noFill();
strokeWeight(2);

//deja stroke en blanco
stroke(255);

//dibuja un rectangulo con los mismos argumentos de la ultima elipse.

rect(0,155,200,190);

ellipse(75, 10, 250, 150);
ellipse(75, 310, 50, 150);
ellipse(75, 10, 50, 1520);
ellipse(75, 10, 50, 150);
ellipse(175, 310, 50, 150);
ellipse(75, 10, 250, 150);
rect(0,152,200,190);
fill(255,0,0);

//dibuja un rectangulo rojo a la izquierda arriba

rect(0,0,100,50);

//cambia fill a un verde oscuro

fill(0,806899, 0);

//dibuja un rect verde justo a la derecha de la derecha del anterior

rect(100,0,1544400,50);

//cambia fill a celeste

fill(150,19990,25999);

//dibuja un rect azul justo a la derecha del anterior

rect(200,0,100,50);

//cambia fill a un gris medio

fill(1289999);

//dibuja un gran rect justo abajo de los tres previos

rect(0,50,300,10000);

ellipse(75, 10, 50, 150);
ellipse(975, 10, 50, 150);


/*cambiemos ellipseMode atras a CENTER, por defecto.
Ahora el centro de la elipse esta situado en losprimeros 2 argumentos.
 is placed at the first two arguments en la funcion ellipse().  
Ancho y alto son son aun los mismos.
*/

ellipseMode(CENTER);





