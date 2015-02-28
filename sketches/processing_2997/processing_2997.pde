
PImage ritoque; 
void setup(){ 
  ritoque = loadImage("ritoque.jpg"); //cargar imagen ritoque
  size(ritoque.width, ritoque.height); //tamaño de pantalla: tamaño de imagen
  noStroke(); //sin lineas
  noLoop();  
  colorMode(HSB,255); //modo del color Hue, Saturation & brightness al máximo
  smooth(); 
  background(255);

} 
 
void draw(){ 
  int spacer = 3; //espaciador entre figuras 3  
  for(int y = 3; y < height; y += spacer){ //Si, y=3, y éste es menor al largo de la imagen entonces agrégale un espaciador
    for(int x = 3; x < width; x += spacer)//Si, x=3, y éste es menor al ancho de la imagen entonces agrégale un espaciador
    { 
      color c = ritoque.get(x,y); //Saca los colores de la imagen
      pincel(x, y, c, spacer); //mi pincel estará conformado por mi X sujeta a su "for", a Y (idénticas condiciones), el color de la imagen y mi espaciador
    } 
  } 
} 
 
void pincel(float x, float y, color c, float amp){ //Función pincel
  int puntos = round(random(1,100)); //Los puntos serán al random redondeado
  for(int i = 1; i <= puntos; i++){ //Ciclo "for" determina que cuando i=1, hará PUNTOS
    float h =  hue (c) +random(0,55); //Croma y un poquito de random (intensifica los colores)
    float s = saturation (c)+ random (100) ; //Saturacion y random (hace que parezca un "filtro de color"a la cámara)
    float b = brightness (c); //Brillo
    pushMatrix(); 
    translate(x,y); 
    fill(h,s,b); //Llenar con esas caracteristicas del color
 
    float tam = random(4, amp/4);  //Tamaño será definido por 
    ellipse(random(-amp, amp),random(-amp, amp), tam*4, tam*4); //elipses de tamaño
    
    popMatrix(); 
    
  } 
} 
 



