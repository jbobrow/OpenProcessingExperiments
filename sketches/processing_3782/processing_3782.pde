
float R, r; //defino mis floats

void setup(){ 
 size (500,500); //Tamaño 
 noStroke(); //sin lineas
  smooth(); //Suavizando
  r=0.3; //Velocidad con que gira el espiral
} 


void draw(){ 
  fill (255,17);  //Para simular el "velo" se crea un cuadrado del mismo tamaño que el lienzo y se llena de color blanco, con poca opacidad para que deje ver los colores que siguen
  rect (0,0, 500, 500); // Tamaño del cuadrado

  R+=r;


  uno();  // Void uno, el fondo de cuadrados
  dos(); // Espiral derecho
  tres();// Espiral izquierdo
}

void uno(){  // FONDO DE CUADRADOS 

  fill(random(100,136),random(100,200), random(200,237), 25); //El color de cómo se llenan los cuadrados
  for(float y=0; y<=500; y+=10){ 
    for(float x=0; x<=500; x+=10){ 
      rect(x, y, 5,5); 
    } 
  } 
} 



void dos (){ //Espiral Derecho
  for(float x=20; x<=480; x+=15){ 
    for(float y=20; y<=480; y+=15){ 
  pushMatrix();
  translate(mouseX,mouseY); // Que gire alrededor del mouse
    rotate(R); //Que gire a la Derecha
      float d; 
      d= sqrt(((mouseX-x)*(mouseX-x))+((mouseY-y)*(mouseY-y))); 
      fill  (0,mouseY,mouseY, random (70,150));     
      ellipse(x, y, d/30, d/30);   
      popMatrix();
    } 
  } 
} 



void tres (){
  for(float x=20; x<=480; x+=15){ 
    for(float y=20; y<=480; y+=15){ 
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(-R); // que gire hacia la izquierda
      float d; 
      d= sqrt(((mouseX-x)*(mouseX-x))+((mouseY-y)*(mouseY-y))); 
      fill  (0,mouseX,mouseX, random(70,150));     
      ellipse(x, y, d/30, d/30);   
      popMatrix();
    } 
  } 
} 



