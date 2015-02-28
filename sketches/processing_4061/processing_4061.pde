
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

  int spacer = 9; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, int c, int p){
  
  
  int puntos = round(random(8,16));
  for(int i = 0; i <= puntos; i++){

    float h = hue(c) + 20;
    float s = saturation(c)+ 200;
    float b = brightness(c)+ 10;
    pushMatrix();
    translate(x,y);
    
      fill( h,s,b,100);
   

  rotate(0.5);
  
  float pa = random(2,p*3);

   ellipse(random(-p,p),random(-p,p),2-pa,pa);
   
   
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




