
PImage gaboenritoque; 
 
void setup(){ 
  gaboenritoque = loadImage("gaboenritoque.JPG");// cargar el jpg 
  size(gaboenritoque.width, gaboenritoque.height); //el tamaño del jpg 
  noStroke(); 
  colorMode(HSB, 350); 
  smooth(); 
  noLoop(); 
} 
void draw(){ 
  int ciador = 3;  
  for(int y = 0; y < height; y += ciador){ 
    for(int x = 0; x < width; x += ciador){ 
      color c = gaboenritoque.get(x,y); 
      tec(x, y, c, ciador); 
    }}} 
 
void tec(float x, float y, color c, float gabo){// la técnica del trazo 
  int puntos = round(random(10));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + random(10);
    float s = saturation(c) + random(55);
    float b = brightness(c) + random(55);
    pushMatrix();
    line(x,y,x+random(10),y+random(-5,10));
    stroke(h,s,b);
    popMatrix();
  } 
} 
void keyPressed(){ 
  redraw();  
} 
 

