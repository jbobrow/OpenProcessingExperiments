
PImage ritoque;

void setup(){
  ritoque = loadImage("ritoqueprocessing chica.jpg");
  size(ritoque.width, ritoque.height);
  noStroke();
  noLoop(); 
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
  int puntos = round(floor(22));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + floor(-2);
    float s = saturation(c) + floor(25);
    float b = brightness(c) + floor(5);
    pushMatrix();
    translate(x,y);
    fill(h,s,b);
    float tam = random(8, amp/4);
    ellipse(random(-amp, amp),random(-amp, amp), tam,tam);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




