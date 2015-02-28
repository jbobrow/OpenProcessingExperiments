
PImage ritoque;

void setup(){
  ritoque = loadImage ("arbol.jpg"); //carga la imagen
  size(ritoque.width, ritoque.height); //toma el tamaño de la imagen cargada                            
  noStroke(); 
  noLoop(); 
  colorMode(HSB); //modo de color: H(matiz), S(saturación) y B(brillo)
  smooth(); //sin suavisar los bordes
  background(255); 
  
}

void draw(){
  float sp = 3; //el espaciados equivale a 3
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
    float s = saturation(c) + random(20); //la saturracion original más una aleatoriedad entre 0 y 20
    float b = brightness(c) + random(80); //el brillo original más una aleatoriedad entre 0 y 80
    pushMatrix();
    translate(x, y); //se traslada segun x e y
    scale(random(1));//redimensiona el tamaño del pincel
    rotate(random(PI*2)); //rota aleatoreamente hasta un ángulo equivalente al doble de PI
    fill(h,s,b);
    float tam = random(amp/2);
    ellipse(random(-amp, amp), random(-amp, amp), random(60), random(tam*2)); //el pincel es una elipce de forma veriable
    popMatrix();       

  }
}


