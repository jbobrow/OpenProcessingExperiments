
/**basado en el sketch malevich 2 de silvia guinó. En el "lienzo" blanco se ubican 
*figuras geométricas en colores primarios que representan distintos tipos de movimiento:
*independiente, rotativo y desplazamiento en respuesta al mouse; todos van dejando su estela.
*Además, se usan distintos filtros que se activan al apretar determinadas teclas, que permiten 
*apreciar el movimiento y color de las figuras de diferentes formas.*/


float x = 95;    
float y = 108; //  posición x/y inicial del círculo     
 
float velocidad = 5;   // definición del valor de velocidad inicial a 5 
 
float gravedad = 0.02;  // definición del valor de gravedad inicial a 0,02 
 
void setup() { 
  size(660,660); 
  
frameRate(30);

smooth(); 

} 



 
void draw() {   
  
  
  fill(255,10);
  rect(0,0,width,height);
  
 
         
 //----------------------------------figuras estaticas    
 

 stroke(29,38,118,90);
fill(29, 38, 110,60);  
quad(248, 230, 450, 217, 348, 373, 192, 413); 
  
//cuadrado azul
 
  
fill(0);  
quad(40, 40, 500,500, 600,630, 191, 125); 
noStroke();  
//  linea diagonal negra  
 

if(keyPressed)    
    if (key== 'n' || key == 'n') 
      filter (BLUR,1); 
  if (key == 'a' || key == 'a')  
filter (GRAY); 
    if (key == 'b' || key == 'b')  
      filter(INVERT);  
       if (key == 'c' || key == 'c')  
      filter(POSTERIZE, 5);  
      /* al apretar la tecla a, se ven los grises; al apretar b, aparecen los colores 
      invertidos, al apretar c se ven los colores en alto contraste y al apretar otra 
      tecla vuelve al estado original*/
filter(BLUR,1);
 
// figuras dinamicas
fill(171, 39,1, 190);// --------------círculo al que aplicamos la gravedad 
  noStroke(); 
  ellipseMode(CENTER); 
  ellipse(x,y,158,158); 

 translate(mouseX, mouseY/2);
fill(165, 40, 15);  
quad(426, y+200, 426, 580, 312, 642, 298, 620); 
noStroke();  
// figura roja
 
fill(205, 150, 1, 90);  
quad(x+100,458,464, 572,362,569,356,385);
noStroke();  
// figura amarilla 
  

fill(183, 155,63, 50 );  
quad(398, 176, 330, 311, 186, 238, 258, 105); 
// quadrat 
 
   
  
  velocidad = velocidad + gravedad; 
  y = y + velocidad; // añadimos el valor de "velocidad" a las coordenadas de "y" 
   
  x= x + velocidad;
  
   // añadimos el valor de gravedad a la propiedad "velocidad" 

  //si el ellipse toca la base del lienzo vuelve a aparecer por la esquina izquierda superior
  if (y > height) { 
 
    y = 0; 
   x= 0; 
  } 
   

} 

  


