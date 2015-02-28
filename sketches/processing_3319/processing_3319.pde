
PImage escaleras;

void setup(){
  escaleras = loadImage("escaleras.jpg");
  size(escaleras.width, escaleras.height);
  noStroke();
  noLoop(); 
  colorMode(HSB, 255);
  smooth();
  background(0);
}

void draw(){
  int sp = 10; 
  for(int y = 0; y < height; y += sp){
    for(int x = 0; x < width; x += sp){
      color c = escaleras.get(x,y);
      pincelada(x, y, c, sp);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(random(5,30));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + random(-10, 10);
    float s = saturation(c) + random(100);
    float b = brightness(c) + random(-10, 30);
    pushMatrix();
    translate(x,y);
    fill(h,s,b,70);
    float tam = random(3, amp*2);

    rect(random(-amp, amp),random(-amp, amp), tam, tam);
    
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




