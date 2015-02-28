
PImage EN;

void setup(){
  background(0);
  EN = loadImage("ellasnosotras4.jpg"); // fotografía de Pilar Castro
  size(EN.width, EN.height);
  noStroke();
  noLoop(); 
  colorMode(HSB, 255);
  smooth();
}

void draw(){
  int spacer = 4; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = EN.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(random(10,30));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) - 100; // se disminuye al máximo la tonalidad,
    float s = saturation(c) - 100; // la saturación y 
    float b = brightness(c) - 100; // el brillo, con el fin de crear una escala de grises
    pushMatrix();
    translate(x,y);
    fill(h,s,b);
    float tam = random(5, amp);
    rect(random(-amp, amp),random(-amp, amp), tam/5, tam*10);
    popMatrix(); // con esta pincelada se busca imitar el carboncillo
  }
}

