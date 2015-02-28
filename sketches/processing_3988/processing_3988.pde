
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

  int spacer = 5; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = ritoque.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, int c, int p){
  
  
  int puntos = round(random(5,15));
  for(int i = 0; i <= puntos; i++){

    float h = hue(c) + 20;
    float s = saturation(c)- 200;
    float b = brightness(c)+10 ;
    pushMatrix();
    translate(x,y);
    
    
   
    fill( h,s,b,100);
   

  rotate(0.5);
  
  float pa = random(2,p*3);
   bezier(random(-p,p),random(-p,p),2*pa,2*pa,pa,pa,pa,pa);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}




