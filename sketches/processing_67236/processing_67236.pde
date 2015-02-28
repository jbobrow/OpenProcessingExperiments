
import ddf.minim.*;//cargo libreria sonido
Minim minim;//defino el objeto minim 
AudioPlayer player1;// sonido radar escena 1
AudioSample bordes1;//cuando choca con el borde en la escena 1
int col = 0;
/*guarda los datos de cada posicion de los circulos que giran alrededor
del cuadrado blanco para que luego gire en circulo 
y no se deforme con el movimiento del mouse*/
float [] posX = new float [126];//posicion en x
float [] posY = new float [126];//posicion en y
// para el recorrido circular
float angle = 0.0;//angulo
float speed = 0.05; //velocidad
float radius = 100.0; //radio
float angulo = 0.0;//para usar en la rotacion en el draw. 
float angulo2 = 0.0; // para girar el cuadrado
//para que arranque desde el centro - no use width/2 porque no me lo toma
int  x = 200;
int y = 200;
/*n define el color del circulo negro y b el color cuadrado blanco, 
cuando se coloca en la posicion correcta los invierto con un if en el draw*/
int n = 0;
int b = 255;
/*Estas variables son para ir cambiando la imagen de fondo ya que no me toma el gif animado. Tiempo total esta en miliseg, 
1000 equivale a 1 seg. El tiempo equivale a millis, y el contadorImg es para ir cambiando las imagenes que guarde en el array 
nombres que a su vez conforma la cantidad de elementos en el array imagenes*/
int tiempo;//lo que le voy restando a tiempo total - equivale a millis();
int tiempoTotal = 1000;//equivale a 1 segundo
int contadorImg = 0;//contador de las imagenes
//cargo en un array los nombres de las imagenes y otro array cuya cantidad esta definida por el array con los nombres
String[] nombres = {"fondo1.jpg", "fondo2.jpg", "fondo3.jpg", "fondo4.jpg", "fondo5.jpg", "fondo6.jpg", "fondo7.jpg", "fondo8.jpg", "fondo9.jpg", "fondo10.jpg", "fondo11.jpg", "fondo12.jpg"};
PImage[] imagenes = new PImage[nombres.length];
void setup() 
{loadFont("Georgia-16.vlw");//cargo la fuente a usar
  size(400, 400); //tamaño del lienzo
  colorMode(HSB);//modo de color
  rectMode(CENTER);//modo de centrado
  smooth(); //para suavizar las formas
  background(0);//color de fondo
  frameRate(60);//frame por segundos
  minim = new Minim(this);//defino minim
  player1 = minim.loadFile("radar.wav");//cargo el sonido escena 1 que es constante
  bordes1 = minim.loadSample("rebote.wav");//cargo el sonido escena 1 se activa con trigger
//con este for guardo las posiciones en el array de los circulos
for(int i = 0; i < posX.length; i++)
   { angle += speed; //al angulo le voy sumando la velocidad
     float sinval = sin(angle);//defino el seno
     float cosval = cos(angle);//defino el coseno
     float x = 50 + (cosval * radius);//posicion en x
     float y = 50 + (sinval * radius);//posicion en y
    posX[i] = x; //voy cargando los valores en el array
    posY[i] = y; //voy cargando los valores en el array
   };
//con este for voy cargando las imagenes que declare mas arriba en el array
tiempo = millis();//inicio con un valor a la variable tiempo
for(int i = 0; i < nombres.length; i++)
   {imagenes[i] = loadImage(nombres[i]);
    }; 
}//-##########################################################-fin del setup/ inicio del DRAW
void draw() 
{ player1.play();//empieza a correr el player con el sonido de radar
   col = (col + 1)% 256;//color de los circulos que giran alrededor del cuadrado blanco van cambiando
   int tiempoPasado = millis() - tiempo;//con esto controlo el tiempo que transcurre para saber cuando cambiar la imagen
   image (imagenes[contadorImg], 0, 0, width, height);//la imagen como fondo, con su posicion y tamaño
   if(tiempoPasado > tiempoTotal)//condicional para que vaya cambiando la imagen
     {contadorImg++;//sumo 1 al contador de imagenes
       tiempo = millis();//restauro la variable tiempo
     };
    if(contadorImg > nombres.length-1)//condicional para volver a empezar cuando ya hayan pasado todas las imagenes
      {contadorImg = 0;//pongo el contador en 0
      };
//Estos if es para controlar que la figura no se vaya de la escena por los 4 bordes y si choca se dispare un sonido
    if (x > (width-30)) //control lado derecho
       { x = width-30;
         bordes1.trigger();
       };  
    if (x < 30) //control lado izquierdo
       { x = 30;
         bordes1.trigger();
       };  
    if (y > (height-30)) //control lado inferior
       { y = height-30;
        bordes1.trigger();
        };    
    if (y < 30) //control lado superior
       { y = 30;
        bordes1.trigger();
        };   
//para mover con las teclas chequeo cual esta presionada para asi desplazar el "cursor"    
    if (keyPressed == true)
       {if(keyCode==UP)//si mueve para arriba
           {y -= 1; };//cambio la direccion
         if(keyCode==DOWN)//si mueve para abajo
           {y += 1; }; //cambio la direccion
        if(keyCode==LEFT)//si mueve para la izquierda
         {x -= 1; };//cambio la direccion
        if(keyCode==RIGHT)//si mueve para la derecha
         {x += 1; }; //cambio la direccion
       };
//cuando se posiciona en el cuadradito negro, el fondo cambia y como tiene el blend se ve la imagen de fondo
    if(x >= 320 && x <= 345 && y >= 315 && y <= 335)//aqui delimito la zona en la cual se activa el cambio
      { n = 255;//lo que es negro pasa a blanco
        b = 0;//lo que es blanco lo paso a negro
        background(255); //fondo blanco
        fill(0);//color negro
        rect(width/2, height/2, 330, 50);//rectangulo de fondo para que se vea el texto
        fill(col, 255, 255);//color del texto
        text("                    ¡Felicitaciones! - Ha finalizado", 50, 200);//frase indicando el fin de la escena
       }else{ background(0);// si sale de la zona delimitada restauro los valores
              n = 0; //restauro los valores
              b = 255;//restauro los valores  
             };
/*con este push traslado y giro: el circulo y cuadrado blanco y la linea que los une; al que les aplico blend 
y tambien el circulo negro para que que no me quede el rastro de los circulos que giran alrededor del cuadrado blanco*/
    pushMatrix();
      translate(x, y);//traslado
       angulo2 = angulo2 - 0.01;//determino el angulo para girar   
       rotate(angulo2); //giro
       stroke(255);//borde
       fill(255);//color de relleno
       ellipse(64, 64, 35, 35);//circulo blanco
       fill(n);//circulo negro que tapa el rastro de los circulos verdes
       noStroke();//sin borde
       ellipse(0,0, 146, 146);//circulo
       fill(255);//color de relleno
       stroke(b);//borde
       rect(0, 0, 30, 30);//cuadrado blanco central
       stroke(255);//borde
       strokeWeight(1);//grosor del borde
       line(-14, -14, 50, 50);//linea que une el cuadrado con el circulo blanco
       blend(imagenes[contadorImg], 0, 0, width, height, 0, 0, width, height, DARKEST);// blend para que solo se vea lo que esta por debajo del color blanco
//los circulos que cambian de color, estan despues del blend para que no los afecte
       for(int a = 0; a < 26; a++)//con este for los dibujo
          {angulo += 0.00003;//voy incrementando el angulo
           rotate(angulo);//utilizo ese angulo para rotar
           stroke(col, 255, 255);//color del trazo
           //fill(col, 255, 255);//color de relleno
           noFill();//sin color relleno
           ellipse(posX[a]-90, posY[a]-90, a, a);//elipse - posicion y tamaño
           ellipse(posX[a]-90, posY[a]-90, a/1.5, a/1.5);//elipse - posicion y tamaño
           ellipse(posX[a]-90, posY[a]-90, a/2, a/2);//elipse - posicion y tamaño
           }
     popMatrix();   
//-##########################################################- FIN DRAW 
}
    







