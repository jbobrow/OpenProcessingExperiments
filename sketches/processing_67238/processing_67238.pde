
import ddf.minim.*;//cargo libreria sonido
Minim minim;//defino el objeto minim 
AudioPlayer player3;// sonido para escena 3
int col = 0;//color usado en las escenas
pelota[] pelotas8 = new pelota[24];//array para llenar con el objeto definido en la clase pelota
//-##########################################################-inicio del SETUP
void setup() 
{loadFont("Georgia-16.vlw");//cargo la fuente a usar
  size(400, 400); //tamaño del lienzo
  colorMode(HSB);//modo de color
  rectMode(CENTER);//modo de centrado
  smooth(); //para suavizar las formas
  background(0);//color de fondo
  frameRate(60);//frame por segundos
  minim = new Minim(this);//defino minim
  player3 = minim.loadFile("fairyfinal.wav");//cargo el sonido escena 3 que es constante
//Acá construyo los objetos con los argumentos correspondientes - mediante un for voy llenando el array mas arriba definido
  for (int i = 0; i < pelotas8.length; i++) 
  { float x = random(0, 400);//posicion inicial en x aleatoria
    float y = random(0, 400);//posicion inicial en y aleatoria
    float vel = 0.3 + (i/2)*0.3;//velocidad de cada pelota
//con los if voy llenando el constructor de cada objeto para que no todos tengan la misma direccion dependiendo de si i es par o no
    if(i % 2 == 0)
      {pelotas8[i] = new pelota(x, y, 30, vel, 1, -1);//la posicion x e y, el diametro y la velocidad, direccion x e y
       };
    if(i % 2 != 0)
      { pelotas8[i] = new pelota(x, y, 30, vel, -1, 1);//la posicion x e y, el diametro y la velocidad, direccion x e y
       };    
   }; 
}//-##########################################################-fin del setup/ inicio del DRAW
void draw() 
{player3.play();//inicia el sonido
   background(0);//fondo
   col = (col + 1) % 256;//color para que vayan cambiando
   for(int i = 0; i < pelotas8.length; i++) //con este for nos activo el movimiento y el display de cada objeto
      {stroke(col, 255, 255);//trazo
       noFill();//sin relleno
       pelotas8[i].display(); //muestro los objeto que guarde en el array
       pelotas8[i].move(); //muevo los objeto que guarde en el array
       //con este if determino si el mouse esta posicionado sobre una pelota, si es asi con el switch determino que es lo que sucede
       if(mouseX >= (pelotas8[i].x - pelotas8[i].diameter/2) && mouseX <= (pelotas8[i].x + pelotas8[i].diameter/2) && mouseY >=(pelotas8[i].y - pelotas8[i].diameter/2) && mouseY <= (pelotas8[i].y + pelotas8[i].diameter/2))
         { switch(i)//con el switch chequeo si es la pelota correcta, cualquier otra o la ultima del array
               {//si se posiciona en la pelota 15 apareceran lineas que la conectan con todas las otras pelotitas
                case 5:for(int a = 0; a < pelotas8.length; a++)//el for es para que dibuje todas las lineas que une a la pelota 15 con las otras
                         {line(pelotas8[5].x, pelotas8[5].y, pelotas8[a].x, pelotas8[a].y);
                          };   
                        fill(0);//color negro
                        rect(width/2, height/2, 330, 50);//rectangulo q sirve de fondo para q se vea el texto
                        fill(col, 255, 255);//color del texto
                        text("                    ¡Felicitaciones! - Ha finalizado", 50, 200);//frase q indica el final de la escena 3
                        break;    
                //si es la ultima del array la uno con la primera del mismo        
                case 23:noFill(); line(pelotas8[23].x, pelotas8[23].y, pelotas8[0].x, pelotas8[0].y);
                       break;
                //si es cualquier otra se une a la siguiente         
                default:noFill(); line(pelotas8[i].x, pelotas8[i].y, pelotas8[i+1].x, pelotas8[i+1].y);
                        break;               
                }; 
          };
       };
//-##########################################################- FIN DRAW 
}


