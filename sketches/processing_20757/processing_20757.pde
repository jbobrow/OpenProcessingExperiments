
//very begining level
PImage imagen;  // para cargar la imagen que usaré de fondo
void setup(){
  size(156,156);   
  imagen = loadImage("Viñedo.jpg"); //carga la imagen como tal
  background(0);  
  image(imagen, 0, 0);    
  smooth();
}

void draw() {
  image(imagen, 0, 0);  
  // Centrar los cículos
  ellipseMode(CENTER);
   
   // Un rastro de baba caracoleana, cuarto parametro para trasparencia
  stroke(201,245,146,75);
  strokeWeight (20);
  line(0,150,mouseX-15,mouseY+44);
 
  // Cuerpo del caracolito
  strokeWeight(3);
  stroke(0);
  fill(100,0,100);
  
  // Dibuja el cuerpo del caracolito en la posicion del mouse
  ellipse(mouseX-10,mouseY,30,90);  
  fill(172,29,180);
  ellipse(mouseX-50,mouseY+15,90,90);
  ellipse(mouseX-50,mouseY+15,50,50);

  // Cabeza del Caracolito
  stroke(0);
  fill(244,192,247);
  // Dibujar la cabeza sobre cuerpo
  ellipse(mouseX,mouseY-30,60,60); 

  // Ojos del caracolito
  fill(0,100,0); 
  ellipse(mouseX-15,mouseY-30,16,30); 
  ellipse(mouseX+15,mouseY-30,16,30);
  fill(0); 
  ellipse(mouseX-11,mouseY-30,6,22); 
  ellipse(mouseX+19,mouseY-30,6,22);

  // Antenas del caracolito
  stroke(0);
  line(mouseX+10,mouseY-58,mouseX+25,mouseY-67);
  line(mouseX-10,mouseY-58,mouseX-25,mouseY-67);
  ellipse(mouseX+24,mouseY-65,5,5);
  ellipse(mouseX-24,mouseY-65,5,5); 
  
  

 }





