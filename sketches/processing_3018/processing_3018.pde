


PImage foto;



void setup(){
 foto = loadImage("foto.jpg");
  size(600,500); 
  noStroke();
  noLoop(); 
  background(255);
colorMode(HSB);
 
  
}



void draw(){
  float spacer =1;
  
  for(int y = 0; y < foto.height; y += spacer){
    for(int x = 0; x < foto.width; x += spacer){
         float p = map(x, 0, foto.width, 0,600);
      float pl = map(y, 0, foto.height, 0,500);
      color c = foto.get(x,y);
      fill(c);
      Brushing(p, pl, c, 5);
    }
  }
  
}

void Brushing(float x, float y, color c, float am){
  int puntos = round(random(5,50));
  for(int i = 0; i <= puntos; i++){
   float M = hue(c)+random(180,240);
   float S = saturation(c)+random(10);
   float B = brightness(c)+random(40); 
   fill(M,S,B);
    pushMatrix();
    translate(x,y);

    float t = random(-am, am);
    triangle(random(-t/am, am/t),random(-am,am*t), t, t,random(-t/am, am/t),random(-am,am*t));
    popMatrix();
  }}
  
   void keyPressed(){   
  saveFrame("ritoque at night.jpg");   
  println("fotograma grabado");   
}   
 

