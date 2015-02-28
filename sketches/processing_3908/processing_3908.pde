
PImage ritoque;

void setup(){
  ritoque = loadImage("ritoque_futbol.jpg");
  size(ritoque.width, ritoque.height);
  noStroke();
  noLoop(); 
  colorMode(HSB, 255);
  smooth();
  background(255);
}

void draw(){
  int spacer = 5; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
int puntos = 2;
  for(int i = 0; i <= puntos; i++){
    float b = brightness(c) -50 ;
    pushMatrix();
    translate(x,y);
    float tam = random(amp);
    
    strokeWeight(0.7);
    stroke(b);
    line(2,2,12,12);
    
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




