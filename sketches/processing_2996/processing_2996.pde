
PImage ritoque;

void setup(){
  ritoque = loadImage("ritoque.jpg");// cargar el jpg
  size(ritoque.width, ritoque.height); //el tamaño del jpg
  noStroke();
  colorMode(HSB, 150);
  smooth();
  noLoop();
}
void draw(){
  int ciador = 3; 
  for(int y = 0; y < height; y += ciador){
    for(int x = 0; x < width; x += ciador){
      color c = ritoque.get(x,y);
      tec(x, y, c, ciador);
    }}}

void tec(float x, float y, color c, float bro){// la técnica del trazo
  int puntos = round(random(5,20));
  for(int i = 0; i <= puntos; i++){//el esquema del color del trazo
    float h = hue(c) + random(-10, 30); // arcoiris
    float s = saturation(c) + random(240);//saturación del color
    float b = brightness(c) + random(-10, 30);//luminocidad/opacidad del color
    pushMatrix();
    translate(x,y);
    fill(h/1.1,s/1.1,b/1.1);//el color con respecto a las variables anteriores
    float zise = random(2, bro/2);
    ellipse(random(-bro, bro),random(-bro, bro), zise, zise);
    popMatrix();
  }
}
void keyPressed(){
  redraw(); 
}


