
PImage flores;

void setup(){
  flores = loadImage("flores.JPG");
  size(flores.width, flores.height);
  noStroke();
  noLoop(); 
  colorMode(HSB, 209,61,61);
  smooth();
  background(34,207,204);
}

void draw(){
  int spacer = 20; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = flores.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(noise(2,30));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + random(50,0);
    float s = saturation(c) + random(1);
    float b = brightness(c) + random(90);
    pushMatrix();
    translate(x,y);
    fill(h,s,b);
    float tam = noise(-10, amp/-8);
    /*ellipse(random(-amp, amp),random(-amp, amp), tam, tam);*/
    triangle(random(-amp, amp),noise(-amp, amp),noise(-amp, amp),random(-amp, amp), tam, tam);
        
         popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




