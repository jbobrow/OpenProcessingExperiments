
/**
 * Extrusion. 
 * tomado del tutorial de processing.
 * convierte una imagen en datos tipo punto.
 * Gabychica xperimental...
 */

PImage extrude;
int[][] values;
float angle = 0;

void setup() {
  size(600, 500, P3D);
  
  // Load the image into a new array
  extrude = loadImage("love.png");
  extrude.loadPixels();
  values = new int[extrude.width][extrude.height];
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      
      color pixel = extrude.get(x, y);
      values[x][y] = int(brightness(pixel));
      
    
    }
  }
}

void draw() {
  background(0);
  
   // dibujo lineas para hacer degradados 
  float i=0.005;

while (i<width){
  
  //degradado de rosa, rojo a negro animado :D
  
 //smooth();
  stroke (235-i,0,115-i);
  
  //rotate(360/12);
 line(i*random(3),width,0,i*random(3));
  //arc (i*random(3),0,0,i*random(3),3,3);
  i=i+0.9;
  
  }
  

  
  // actualiza el ángulo
  angle += 0.005;
  
 //girar en torno a la X y velocidad 
  translate(width/2, 0, -128);

  rotateY(angle*4);  
  translate(-extrude.width/2, 50, -128);
  
  // proyecta la masa de la imagen 
  for (int y = 0; y < extrude.height; y++) {
    for (int x = 0; x < extrude.width; x++) {
      stroke(values[x][y]);
      point(x, y, -values[x][y]);
      //fill(11,218,227);
    }
  }

}

