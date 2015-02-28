
//Basado en el sketch de Camila Valenzuela

PImage ritoque; 
 
void setup(){ 
  ritoque = loadImage ("ritoque.jpg"); //la imagen es cargada 
  size(ritoque.width, ritoque.height); //toma el tamaño de la imagen cargada                             
  noStroke();  
  noLoop();  
  colorMode(HSB); //modo de color: H(matiz), S(saturación) y B(brillo) 
  smooth(); 
  
   
} 
 
void draw(){ 
  float sp = 2; //espacio entre trazos 
    for(int y = 0; y < height; y += sp){ //y es 0, si es menor que el alto le aumenta un espaciador 
    for(int x = 0; x < width; x += sp){ //x es 0, si  es menor que el ancho le aumenta un espaciador 
      color c = ritoque.get(x,y); //se utilizan los colores de la imagen 
      pincel(x, y, c, sp); //ejecuta el pincel con las funciones anteriores
     
} 
  } 
} 
 
void pincel(float x, float y, color c, float amp){ //variables del pincel
  int puntos = round(random(4)); //puntos redondeados, aleatorios entre 0 y 4 
  for(int i  = 0; i <= puntos; i++){ 
    float h = hue(c); //mantiene los matices de la imagen cargada 
    float s = saturation(c) + random(50); //la saturracion original más una aleatoriedad entre 0 y 50 
    float b = brightness(c) + random(120); //el brillo original más una aleatoriedad entre 0 y 120 
    pushMatrix(); 
    translate(x, y);
    scale(random(2));
    fill(h,s,b); 
    float tam = random(amp); 
    rect(random(-amp, amp), random(-amp, amp), random(5), random(tam*4)); 
     popMatrix();        
 
  } 
} 
 


