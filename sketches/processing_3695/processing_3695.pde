
PImage ellasnosotras;

void setup(){
  ellasnosotras = loadImage("ellasnosotras.jpg"); //fotografía de Pilar Castro
  size(ellasnosotras.width, ellasnosotras.height);
  noStroke();
  noLoop(); 
  colorMode(HSB, 255);
  smooth();
  background(#F5DFB2); //el tono del fondo suaviza el contraste entre la pincelada y los espacios vacíos
}

void draw(){
  int spacer = 10; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ellasnosotras.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(7);
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + 0;
    float s = saturation(c) + 50; //se aumentó la saturación para que los colores no se vieran tan pálidos
    float b = brightness(c) + 0;
    pushMatrix();
    translate(x,y);
    fill(h,s,b);
    triangle(random(-amp, amp), random(-amp, amp),random(-amp, amp),random(-amp, amp),random(-amp, amp),random(-amp, amp)); //la pincelada se conforma por varios triángulos 
    popMatrix();
  }
}



