
PImage ritoque;

void setup(){
  ritoque = loadImage("ritoque.JPG");
  size(ritoque.width, ritoque.height);
  noStroke();
  //noLoop(); 
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
  int puntos = round(random(1,5));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + random(-10, 10);
    float s = saturation(c) + random(40);
    float b = brightness(c) + random(-5, 10);
    pushMatrix();
    translate(x,y);
    rotate(1.5*PI);

    fill(h,s,b);
    float tam = random(2, amp/2);
    rect(2*random(-amp, amp),4*random(-amp, amp), 5*tam, 2*tam);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




