
int limite = 200;
int ancho = 60;
int step = 8;
int strk = 14;
float sep = 3;
 
void setup(){
  size(900,450);
   
  background(#212121);
  
  noFill();
  smooth();
  strokeWeight(strk);
  strokeCap(SQUARE);
  noLoop();
}
 
void draw(){
  
  color c;
  for(int i = 0; i < limite; i=i+step){
    colorMode(HSB);
    c = color(i%255+25, 220, 220);
    stroke(c);
    float posicion = random(0, 360);
    float largo = posicion + random(65, 200);
    
    arc(width/2, height/2, ancho+(i*sep),ancho+(i*sep), radians(posicion), radians(largo));
  }
}
