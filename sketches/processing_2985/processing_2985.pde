


PImage foto;



void setup(){
 foto = loadImage("foto.jpg");
  size(600,500); 
  noStroke();
  noLoop(); 
  background(255);

 
  
}



void draw(){
  float spacer =1;
  
  for(int y = 0; y < foto.height; y += spacer){
    for(int x = 0; x < foto.width; x += spacer){
      float plotX = map(x, 0, foto.width, 0,600);
      float plotY = map(y, 0, foto.height, 0,500);
      color c = foto.get(x,y);
      fill(c);
      pincelada(plotX, plotY, c, 5);
    }
  }
  
}

void pincelada(float x, float y, color c, float amp){
  int puntos = round(random(5,50));
  for(int i = 0; i <= puntos; i++){
   float h = hue(c)-100;
   float s = saturation(c)-1000;
   float b = brightness(c)-50; 
   fill(h,s,b);
    pushMatrix();
    translate(x,y);

    float tam = random(2, 5);
    ellipse(random(-5, 5),random(-5, 5), tam, tam);
    popMatrix();
  }}
  
   void keyPressed(){   
  saveFrame("ritoque at night.jpg");   
  println("fotograma grabado");   
}   
 

