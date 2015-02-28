
/*"The MADNESS"
 Por Bernardo Silva Catrilef.
*mover el mouse sobre la imagen.
si se aprieta el click derecho,cambiara a otra composición.
este es mi segundo trabajo en processing,cualquier 
critica o aporte se agradece.
 */
float margen, sp;


void setup(){
  margen = 1;
  sp =150;
  size(500, 500);//tamaño de la reproduccion
  smooth();// suavizado(pixeles)
  stroke(255,100);//linea,color y transparencia
  strokeWeight(2);//grosor de la linea
}


void draw(){
 
  background(0);//fondo, 0=negro
  translate(height/2,width/2);//posicion de la "figura" en el centro,divide el ancho y el alto en la mitad
  for(float y=margen ; y < height; y += sp/2){
    for(float x = margen; x < width; x += sp/12){
      float d; //esta es la distancia
      d = 100+sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));
       fill(255,10);
     ellipse(x,y,d*0.2, d*0.5); 
     ellipse(x,y,d/2, d/2); 
  rotate(100);
   
 if(mousePressed==true){   //si el mouse es presionado,saldran los "quad"
  rotate(100);
  stroke(#980505,100);
   fill(20,100);
   d = dist(mouseX, mouseY, x, y);//distancia
   //cuando se mueve el mouse se incrementa o disminuye su volumen
     
      quad(x,y,x,y,x,d,x,d);//quad= cuadrados
       quad(x/12,y+6,x,d,x,d,x*2,d);
    }   
    } 
  } 
} 

void keyPressed(){// si se presiona la tecla "f" se graba la foto en la carpeta del sketch
  saveFrame("the madness II.jpg");//nombre con el que se va a guardar la foto
  println("fotograma grabado");
}


