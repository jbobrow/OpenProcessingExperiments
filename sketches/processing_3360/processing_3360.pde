
  PImage ritoque;

void setup(){
  ritoque = loadImage("ritoque.jpg");
  size(ritoque.width, ritoque.height);
  noStroke();
  //noLoop(); 
  colorMode(HSB, 255);
  smooth();
  background(255);
}

void draw(){
  int spacer = 10; 
  for(int y = 0; y < ritoque.height; y += spacer){
    for(int x = 0; x <ritoque.width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
      
  }
}
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(random(1,3));//cantidad de pinceladas
  for(int i = 3; i <= puntos; i=i*i+1){
    float h = hue(c) + random(-10, 10);
    float s = saturation(c) + random(5);
    float b = brightness(c) + random(-10, 30);
    pushMatrix();
    translate(x-15,y-15);
    rotate(PI/i*0.8);

    fill(h,s,b);
    float tam = random(2, amp/2);
    rect(2*random(-amp, amp),4*random(-amp, amp), 3*tam, 2*tam);
    popMatrix();
  }
}




void keyPressed(){
  redraw(); 
}




