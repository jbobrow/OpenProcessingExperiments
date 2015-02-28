
/**
 * Autoretrato. 
 * basado del tutorial de processing.
 * convierte una imagen en datos tipo punto.
 * Gabychica xperimental...
 */

PImage extrude;
int[][] values;
float angle = 0;


void setup() {
  size(700, 700, P3D);

//carga mi autoretrato en un nuevo array
  extrude = loadImage("autoretrato3.jpg");
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
  
pushMatrix();
background(0);

//dibujo el ashurado aleatoreo

float i=0.005;

while (i<width){
stroke (113-i,0,255-i);
//strokeWeight(0.5*random(1));
//rotate(45/35);
//line(i,i*random(3),i,i*random(3));
line(i*random(3),i,i*random(3),i);
line(width,i*random(3),i,i*random(3));
line(height,i*random(3),0,i*random(3));

i=i+0.9;
  }
  
// actualiza el ángulo
angle -= 0.005;
 
 
 popMatrix(); 
 //girar en torno a la Y y velocidad del ángulo
  translate(width/2, 0, -128);
  rotateY(angle*8);  
  translate(-extrude.width/2, 50, -128);
  
  // proyecta la masa de la imagen :D esta chido verdad!!
  for (int y = 0; y < extrude.height; y++) {

    for (int x = 0; x < extrude.width; x++) {
     stroke(values[x][y]);
     //stroke(113,2,245);
     stroke(3,215,255);
    // stroke(30,61,175);
     point(x, y, -values[x][y]);
    }
  }

}

