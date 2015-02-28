
PImage ritoque;

void setup(){
  ritoque = loadImage("ritoque.JPG");
  size(ritoque.width, ritoque.height);
  noStroke();
  noLoop(); 
  colorMode(HSB, 255);
  smooth();
  background(255);
}

void draw(){
  int spacer = 10; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(noise(2,30));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + noise(-10, 10);
    float s = saturation(c) + noise(10,50);
    float b = brightness(c) + noise(20, 100);
    pushMatrix();
    translate(x,y);
    fill(h,s,b);
    float tam = random(2, amp/2);
    ellipse(random(-amp, amp),random(-amp, amp), tam, tam);
    triangle(random(-amp, amp),random(-amp, amp),random(-amp, amp),random(-amp, amp), tam, tam);
    
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




