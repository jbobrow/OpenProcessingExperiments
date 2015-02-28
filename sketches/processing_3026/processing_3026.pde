
import processing.pdf.*; 
PImage paisaje;

void setup(){
  paisaje = loadImage("paisaje.JPG");
  size(800, 600);
  noStroke();
  noLoop(); 
  colorMode(HSB, 255);
 
  background(#A2CAD8);
}

void draw(){
  int spacer = 5; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = paisaje.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(random(10,30));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + random(-10, 90);//se aumenta los valores de "hue" para obtener tonos más oscuros
    float s = saturation(c) + random(200);
    float b = brightness(c) + random(-10, 30);
    
    
    pushMatrix();
    translate(x,y);
   rotate(amp*s);//permite creae un trazo en más de un sentido, con un efecto más entramado
    fill(h,s*2,b,80);
    float tam = random(2, amp/2);
    ellipse(random(amp, amp*2),random(-amp, amp*2), tam, tam*4);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




