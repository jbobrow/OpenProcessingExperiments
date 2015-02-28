
PImage RTQ; 
 
void setup(){ 
  RTQ = loadImage ("rtq.jpg"); //carga la imagen 
  size(RTQ.width, RTQ.height); //toma el tamaño de la imagen cargada                             
  noStroke();    
  colorMode(HSB); //modo de color: H(matiz), S(saturación) y B(brillo) 
  noSmooth(); //sin suavisar los bordes para adquirir un toque mas tictorico
  background(255);  
   
} 
 
void draw(){ 
  float sp = 9; //valor del espaciador
    for(int y = 0; y < RTQ.height; y += sp){ //y es 0, si es menor que el alto le aumenta un espaciador 
    for(int x = 0; x < RTQ.width; x += sp){ //x es 0, si  es menor que el ancho le aumenta un espaciador 
      color c = RTQ.get(x,y); //toma los colores de la imagen 
      pincel(x, y, c, sp); //ejecuta el pincel 
     } 
  } 
} 
 
void pincel(float x, float y, color c, float a){ //variables del pincel: ubicacion (x, y), color y amplitud 
  int puntos = round(random(10)); //puntos redondeados, aleatorios entre 0 y 10 
  for(int i  = 0; i <= puntos; i++){ //ciclo for; indica que "i" aumentara mientras sea menor o igual a "puntos" 
    float h = hue(c); //mantiene los matices de la imagen cargada 
    float s = saturation(c) ; //la saturracion original más una aleatoriedad entre 0 y 70 
    float b = brightness(c); //el brillo original más una aleatoriedad entre 0 y 30 
    pushMatrix(); 
    translate(x, y); //se traslada segun x e y 
    fill(h,s,b); 
    float tam = random(a/2); 
    ellipse(random(-a, a), random(-a, a), random(70), random(10)); //el pincel es una elipse de forma variable 
    popMatrix();        

  } 
} 
 


