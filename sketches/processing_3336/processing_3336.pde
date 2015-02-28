

PImage ritoque; 
 
 
 
void setup(){ 
ritoque = loadImage("ritoque.jpg"); //se carga la foto
  size(604, 296, P3D);  //tamaño en pixeles
 noStroke(); //con borde de dibujo (negro)
  noLoop();
  smooth();
  background(255); //fondo
colorMode(HSB, 170); // modo color
  
   
} 
 
 
 
void draw(){ 
  float spacer =7; //espacio entre colores (figuras)
   
  for(int y = 0; y < ritoque.height; y += spacer){ 
    for(int x = 0; x < ritoque.width; x += spacer){ 
         float p = map(x, 0, ritoque.width, 0,624); //se configura según el tamaño de la imagen
      float pl = map(y, 0, ritoque.height, 0,330); 
      color c = ritoque.get(x,y); 
      fill(c); //imagen total (color)
      Brushing(p, pl, c, 10); //se reúnen las funciones anteriores para abarcarse
    } 
  } 
   
} 
 
void Brushing(float x, float y, color c, float am){ //para definir
  int puntos = round(random(70)); 
  for(int i = 0; i <= puntos; i++){ 
   float M = hue(c)+random(0); //se definen los colores
   float S = saturation(c)+random(0); 
   float B = brightness(c)+random(255);  
   fill(M,S,B); //relleno de los 3 colores
   pushMatrix(); 
    translate(x,y); 
 
    float t = random(-am, am); 
  ellipse(random(t/am, am/t),random(t,t),random(t, -am),random(-am,am)); // forma del relleno (que contiene el color) 
    popMatrix(); // se cierra
  }} 
        

