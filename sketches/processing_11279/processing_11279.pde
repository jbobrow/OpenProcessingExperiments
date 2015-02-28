
//setea una ventana de processing a 200 pixeles de ancho y 200 pixeles de alto.

size(600, 600);

//Por defecto, processing coloca un borde pixeleado negro alrededor de sus graficas.
//la funcion noStroke() lo apagara.

noStroke();

//cambiar el fondo a negro. Lo que va () se puede cambiar para que resulte otro color.

background(500);

/*por defecto rectMode es CORNER (costado).  Colocara al rectangulo en la parte superior izquierda, en los 2 primeros argumentos, y dibujara el ancho y alto desde aqui.
 */
//dibuja un rectangulo de 50 pixeles de ancho y 150 pixeles de alto
//costado superior izquierdo es de 75, 10

rect(210, 0, 50, 600);
rect(310, 0, 50, 600);
rect(260, 0, 50, 600);


//cambiemos rectMode a CENTER.  Ahora el centro del rectangulo //esta en los primeros dos argumentos en la funcion rect

rectMode(CENTER);

//cambiaremos el "fill" del rectangulo a un gris claro

fill(15);

/*Dibujemos un rectangulo que sea de 40 pixeles de ancho y 55 pixeles de alto y su centro de 20, 100.
El borde izquierdo del rectangulo deberia tocar el lado izquierdo de la pantalla. Puedes ver por que? */

rect(235, 28, 50, 55);
rect(235, 135, 50, 55);
rect(235, 240, 50, 55);
rect(235, 340, 50, 55);
rect(235, 440, 50, 55);
rect(235, 540, 50, 55);

rect(335, 540, 50, 55);
rect(335, 440, 50, 55);
rect(335, 340, 50, 55);
rect(335, 240, 50, 55);
rect(335, 135, 50, 55);
rect(335, 28, 50, 55);

rect(285, 589, 50, 46);
rect(285, 80, 50, 53);
rect(285, 189, 50, 53);
rect(285, 290, 50, 46);
rect(285, 390, 50, 46);
rect(285, 489, 50, 46);


/*Cambiemos el rectMode a CORNERS.  
CORNERS nos permite dibujar un rectangulo definiendo la esquina izquierda superior y la esquina derecha inferior. Las otras dos esquinas pueden ser deducidas desde estas dos otras esquinas.
*/

rectMode(CORNERS);

//cambiar "fill" a un gris oscuro

fill(200);

//dibujar un rectangulo donde su esquina superior izquierda sea de 0,175
//y su esquina inferior derecha este a 200, 190




//PS un circulo es una ellipse que tiene el mismo ancho y alto.

//setae una ventana en processing a 200 pixels ancho y 200 pixeles de alto

size(600, 600);

//Por defecto, processing coloca un borde pixeleado negro alrededor de sus graficas.
//la funcion noStroke() lo apagara.

noStroke();

//cambiar el fondo a negro. Lo que va () se puede cambiar para que resulte otro color.



//Hagamos el circulo suave, por defecto, lucira un poco “duro”

smooth();

/*por defecto ellipseMode es CENTER. Quiero comenzar con CORNER.
Si una caja fuera a ser dibujada alrededor de la ellipse, el costado superior izquierdo de esa caja estaria en los primeros 2 argumentos
*/

ellipseMode(CORNER);


//dibuja una elipse que sea de 50 pixeles de ancho por150 pixeles de alto
//y el costado superior iquierdo de la caja este 75, 10

ellipse(5, 420, 200, 180);
ellipse(5, 240, 200, 180);


/*cambiemos ellipseMode atras a CENTER, por defecto.
Ahora el centro de la elipse esta situado en losprimeros 2 argumentos.
 is placed at the first two arguments en la funcion ellipse().  
Ancho y alto son son aun los mismos.
*/

ellipseMode(CENTER);

//cambiaremos el "fill" de la siguiente elipse a un gris claro 

fill(15);

//hagamos que esta elipse luzca “dura”, apagaremos smooth() y lo llamaremos noSmooth().

noSmooth();

/*Dibujaremos una elipse que tenga 100 pixeles de ancho y 55 pixeles de alto y su centro este a 50, 100.
El lado izquierdo de la elipse deberia tocar el lado izquierdo de la pantalla.
Puedes ver por que?
 Tambien fijate que parte de esta nueva elipse tapa parte de la elipse antigua, eso es porque  processing pinta sobre cualquier imagen en el algoritmo.
*/

ellipse(100, 300, 85, 75);
ellipse(100, 480, 85, 75);

//Mejor volvamos a smooth…

smooth();



/*Cambiemos el ellipseMode a CORNERS.  
CORNERS nos permite dibujar una elipse definiendo la esquina izquierda superior y la esquina derecha inferior de su caja
*/

ellipseMode(CORNERS);

//cambiar "fill" a un gris oscuro

fill(100);

//dibujar un rectangulo donde su esquina superior izquierda sea de 0,175
//y su esquina inferior derecha este a 200, 190

// dibujar una ellpse donde su esquina superior izquierda sea de 0,155
//y su esquina inferior derecha este a 200, 190

ellipse(360, 0, 600, 180);
ellipse(360, 250, 600, 450);

//dibujaremos una caja alrededor del ultimo circulo.
//es el mismo argumento que la elipse, pero usa rectMode y rect.

rectMode(CORNERS);

//apaga fill y enciende stroke con un grosor de 2 pixeles.
//de otra manera el rect's fill pintara sobre nuestra elipse!

noFill();
strokeWeight(2);

//deja stroke en blanco
stroke(15);

//dibuja un rectangulo con los mismos argumentos de la ultima elipse.

rect(10,50,200,230);
rect(10,50,200,220);
rect(10,50,200,210);
rect(10,50,200,200);
rect(10,50,200,190);
rect(10,50,200,180);
rect(10,50,200,170);
rect(10,50,200,160);
rect(10,50,200,150);
rect(10,50,200,140);
rect(10,50,200,130);
rect(10,50,200,120);
rect(10,50,200,110);
rect(10,50,200,100);
rect(10,50,200,90);
rect(10,50,200,80);
rect(10,50,200,70);
rect(10,50,200,60);
rect(10,50,200,50);
rect(10,50,200,40);
rect(10,50,200,30);



 






//setea tamano de ventana

size(600, 600);

//setea background a negro.  Fijate que solo uso un argumento.
//Processing lo suficientemente inteligente para saber que 1 argumento significa un tipo de gris

//apaga stroke

noStroke();

//cambia fill a rojo brillante

fill(4,249,235);

//dibuja un rectangulo rojo a la izquierda arriba

rect(460,250,510,600);

//cambia fill a un verde oscuro

fill(249,4, 200);

//dibuja un rect verde justo a la derecha de la derecha del anteriorhacer

rect(100,0,100,50);

//cambia fill a celeste

fill(247,7,92);

//dibuja un rect azul justo a la derecha del anterior

rect(560,250,610,600);

//cambia fill a celeste

fill(21,239,10);

rect(360,250,410,600);

//cambia fill a un gris medio

fill(15);

//dibuja un gran rect justo abajo de los tres previos

rect(360,240,600,250);
rect(360,180,600,190);
rect(360,210,600,220);








//setea tamano de ventana

size(600, 600);

//setea background a negro.  Fijate que solo uso un argumento.
//Processing lo suficientemente inteligente para saber que 1 argumento significa un tipo de gris



//apaga stroke

noStroke();

//cambia fill a rojo brillante

fill(247,233,8);

//dibuja un rectangulo rojo a la izquierda arriba

rect(360,0,410,180);
//cambia fill a rojo brillante

fill(114,13,75);

rect(459,0,512,180);

fill(242,40,7);

rect(559,0,612,180);
//cambia fill a un verde oscuro















