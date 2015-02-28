
PImage ritoque;

void setup(){
  ritoque = loadImage("ritoque_futbol.jpg");
  size(ritoque.width, ritoque.height);
  noStroke();
  noLoop(); 
  colorMode(RGB, 255);
  smooth();
  background(255);
}

void draw(){
  int spacer = 7; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
int puntos = 9;
  for(int i = 0; i <= puntos; i++){
    
    float r = red(c) + 34 ;
    float g = green(c) + 25 ;
    float b = blue(c) - 9 ;
    pushMatrix();
    translate(x,y);
    float tam = random(amp);
    strokeWeight(4);
    stroke(r,g,b,123);
    line(random (-amp,amp),random(-amp, amp),tam,tam);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




