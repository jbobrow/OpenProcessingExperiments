
PImage ritoque;

void setup(){
  ritoque = loadImage("ritoque.jpg");
  size(900,758);
  noStroke();
  noLoop(); 
  colorMode(HSB, 255);
  smooth();
  background(255);
}

void draw(){

  int spacer = 6; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, int c, int p){
  
  
  int puntos = round(random(8,10));
  for(int i = 0; i <= puntos; i++){

    float h = hue(c) + 20;
    float s = saturation(c)+ 50;
    float b = brightness(c)+ 10;
    pushMatrix();
    translate(x,y);
    
    
   
    fill( h,s,b,100);
   


  
  float pa = random(2,p*3);
   triangle(random(20), random(30), pa,20, 10,10);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




