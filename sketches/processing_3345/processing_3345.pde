
PImage ritoque2;

void setup(){
  ritoque2 = loadImage("ritoque2.JPG");
    size(ritoque2.width, ritoque2.height);
    image (ritoque2,0,0);
    noStroke();
    noLoop(); 
    colorMode(HSB);
    smooth();
    background(255);
    
}


void draw(){
  int spacer = 8; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque2.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(random(6,50));
  for(int i = 15; i <= puntos; i++){
    float h = hue(c) + random(-10,15);
    float s = saturation(c) ;
    float b = brightness(c) + random(90,100);
    pushMatrix();
    translate(x,y);
    rotate(random(PI/4,2*PI/3));
    fill(h,s,b);
    float tam = random(2, amp/2);
    ellipse(random(0,10),tam, random(30,40), tam);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
  saveFrame("ritoque2.jpg");
  println("fotograma grabado");
}


