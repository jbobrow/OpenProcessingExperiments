
PImage ritoque;

void setup(){
  ritoque = loadImage ("ciudad abierta.jpg"); //carga la imagen
  size(ritoque.width, ritoque.height); //toma el tamaño de la imagen cargada                            
  noStroke(); 
  noLoop(); 
  colorMode(HSB); //modo de color: H(matiz), S(saturación) y B(brillo)
  noSmooth(); //sin suavisar los bordes
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
  int puntos = round(random(10)); //puntos redondeados, aleatorios entre 0 y 10
  for(int i  = 0; i <= puntos; i++){ //ciclo for; indica que "i" aumentara mientras sea menor o igual a "puntos"
    float h = hue(c); //mantiene los matices de la imagen cargada
    float s = saturation(c) + random(80); //la saturracion original más una aleatoriedad entre 0 y 70
    float b = brightness(c) + random(80); //el brillo original más una aleatoriedad entre 0 y 30
    pushMatrix();
    translate(x, y); //se traslada segun x e y
    rotate(random(PI*2)); //rota aleatoreamente hasta un ángulo equivalente al doble de PI
    fill(h,s,b);
    float tam = random(amp/2);
    ellipse(random(-amp, amp), random(-amp, amp), random(100), random(10)); //el pincel es una elipce de forma veriable
    popMatrix();       

  }
}


