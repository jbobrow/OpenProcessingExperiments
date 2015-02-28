
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
  int spacer = 4; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(floor(22));
  for(int i = 7; i <= puntos; i++){
    float h = hue(c) + floor(2);
    float s = saturation(c) + floor(20);
    float b = brightness(c) + floor(10);
    pushMatrix();
    translate(x,y);
    fill(h,s,b);
    float tam = random(64, amp/24);
    rect(noise(amp, -amp),noise(-amp, amp), tam,tam);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




