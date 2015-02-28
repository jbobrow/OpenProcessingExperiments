
PImage ritoque2;

void setup(){
    tint(#99DBCF);
  ritoque2 = loadImage("ritoque2.JPG");
    size(ritoque2.width, ritoque2.height);
    image (ritoque2,0,0);
    noStroke();
    noLoop(); 
    colorMode(HSB);
    smooth();
    
}


void draw(){
  int spacer = 7; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque2.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(random(6,50));
  for(int i = 10; i <= puntos; i++){
    float h = hue(c) + random(-4, 4);
    float s = saturation(c) + random(100);
    float b = brightness(c) + random(-4, 4);
    pushMatrix();
    translate(x,y);
    fill(h,s,b);
    float tam = random(2, amp/2);
    quad(random(-amp, amp),tam, tam, random(-amp, amp), tam, tam,tam,tam);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
  saveFrame("ritoque2.jpg");
  println("fotograma grabado");
}


