
PImage ritoque;

void setup(){
  ritoque = loadImage("ritoque.jpg");
  size(ritoque.width, ritoque.height);
  noStroke();
  noLoop(); 
  noStroke();

  colorMode(HSB, 255);
  smooth();
  background(255);
}

void draw(){
  int spacer = 3; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(random(0,150));

   int a = floor(x);
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + noise(-10, 10);
    float s = saturation(c) + noise(20);
    float b = brightness(c) + noise(10, 40);
    pushMatrix();
    translate(x,y);
    fill(h,s,b);
    float tam = random(2, amp/3);
    rect (random(-amp, amp),random(-amp, amp), tam, tam);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




