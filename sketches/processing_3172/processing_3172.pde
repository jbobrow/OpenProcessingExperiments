
//Basado en sketch anterior

PImage ritoque; 
 
void setup(){ 
  ritoque = loadImage ("ritoque.jpg"); //carga la imagen 
  size(ritoque.width, ritoque.height); //toma el tamaño de la imagen cargada                             
  noStroke();  
  noLoop();  
  colorMode(HSB); //modo de color: H(matiz), S(saturación) y B(brillo) 
  smooth(); //sin suavisar los bordes 
  background(0);  //color negro de fondo 
   
} 
 
void draw(){ 
  float sp = 2; //el espaciados equivale a 2 
    for(int y = 0; y < height; y += sp){ //y es 0, si es menor que el alto le aumenta un espaciador 
    for(int x = 0; x < width; x += sp){ //x es 0, si  es menor que el ancho le aumenta un espaciador 
      color c = ritoque.get(x,y); //toma los colores de la imagen 
      pincel(x, y, c, sp); //ejecuta el pincel 
     
} 
  } 
} 
 
void pincel(float x, float y, color c, float amp){ //variables del pincel: ubicacion (x, y), color y amplitud 
  int puntos = round(random(4)); //puntos redondeados, aleatorios entre 0 y 4 
  for(int i  = 0; i <= puntos; i++){ //ciclo for; indica que "i" aumentara mientras sea menor o igual a "puntos" 
    float h = hue(c); //mantiene los matices de la imagen cargada 
    float s = saturation(c) + random(50); //la saturracion original más una aleatoriedad entre 0 y 50 
    float b = brightness(c) + random(100); //el brillo original más una aleatoriedad entre 0 y 100 
    pushMatrix(); 
    translate(x, y); //se traslada segun x e y 
    scale(random(1));//redimensiona el tamaño del pincel 
    rotate(random(PI*3)); //rota aleatoreamente hasta un ángulo equivalente al triple de PI 
    fill(h,s,b); 
    float tam = random(amp/2); 
    rect(random(-amp, amp), random(-amp, amp), random(8), random(tam*2)); //el pincel son rectàngulos de forma variable
    rect(random(-amp, -amp), random(-amp, -amp), random(tam), random(60));
    popMatrix();        
 
  } 
} 
 

