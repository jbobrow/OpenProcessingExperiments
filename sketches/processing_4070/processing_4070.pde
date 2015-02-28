
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

  int spacer = 7; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, int c, int p){
  
  
  int puntos = round(random(5,10));
  for(int i = 0; i <= puntos; i++){

    float h = hue(c) + 40;
    float s = saturation(c)+ 160;
    float b = brightness(c)+ 20;
    pushMatrix();
    translate(x,y);
    
      fill( h,s,b,100*5);
  
  float n = random(2,p*3);
rotate(0.5);
   ellipse(random(-p,p),random(-p,p),10,50);
   rotate(2.5);
   ellipse(random(-p,p),random(-p,p),10,50);
   
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




