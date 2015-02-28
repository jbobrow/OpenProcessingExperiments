


//variables de tiempo
float t1 = 0.0;
float t2 = 0.2;
float t3 = 0.4;
float tX = 0.0;
float tY = 0.3;
float tHue =0.0f;
//tamanio de los incrementos
float incrementoX = 0.01;
float incrementoY = 0.015;
float incremento = 0.1;
float incrementoH =0.1f;

void setup() {
  size(500,500);
  frameRate(30);
  smooth();
  background(120);
  colorMode(HSB);
}

void draw() {
  noStroke();

  rectMode(CORNERS);    


  //Efecto destello
  //checa que usa transparencia
  float c = map(tHue,0,255,100,250);
  
  fill(c, 250, 250,1);
  //rect(0, 0, width, height);

  
  translate(width/2,height/2);
  //evaluamos el noise
  //notese la multiplicacion
  //el noise va de 0 a 1, multiplicar lo hace mas grande
  float noise1 = sin(t1)*40;
  float noise2 = sin(t2)*80;
  float noise3 = noise(t3)*20;

  //incrementos para el generador de noise
  t1 += incremento;
  t2 += incremento;
  t3 += incremento;
  tX += incrementoX;
  tY += incrementoY;

  //incremento color
  tHue += incrementoH;
  //reseteamos si llegamos al valor maximo
  if(tHue > 255) tHue=0.0f;

  // obtenemos posiciones
//  float x = sin(tX)*width/2;
//  float y = cos(tY)*height/2;

  float x = 0;
  float y = 0;
  
  stroke(255);
  
  translate(x,y);

  // dibujar elipse pero con el tamano dependiente del noise
  noFill();
  stroke(c, 250, 250);
  
  for (int i=0; i< 20; i+=1){
    ellipse(50*i*cos(tX), 50*i*sin(tX), noise1, noise1);
  }

  
//  ellipse(noise2, -noise2, noise2, noise2);
//  ellipse(noise2, noise2, noise2, noise2);
//  
//  ellipse(-noise2, -noise2, noise2, noise2);
//  ellipse(-noise2, noise2, noise2, noise2);
  
  noFill();
  rectMode(CENTER);
//  rotate(radians(20*tX));
//  rect(0, 0, width*0.1*noise2, width*0.1*noise2);
//  ellipse(0, 0, width*0.1*noise2, width*0.1*noise2);

//  rotate(radians(40*tX));
//  rect(0, 0, width*0.1*noise2, width*0.1*noise2);

}

void keyPressed() {
  if(key == ' ') {
    saveFrame("  #### imagen.png");
  }
}


