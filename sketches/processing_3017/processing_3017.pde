


PImage foto;//foto pixeles



void setup(){//cargar foto,propiedades de sketch.
 foto = loadImage("foto.jpg");
  size(600,500); 
  noStroke();
  noLoop(); 
  background(255);
colorMode(HSB);
 
  
}


      //valores de "imagen en el lienzo" valores a ocupar para Brushing
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
     //Brushing con las propiedades designadas
void Brushing(float x, float y, color c, float am){
  int puntos = round(random(5,50));
  for(int i = 0; i <= puntos; i++){
    //propiedades de color
   float M = hue(c)+random(180,240);//matiz
   float S = saturation(c)+random(10);//saturacion de color
   float B = brightness(c)+random(40); //brillo
   fill(M,S,B);//valores de los colores designados
           //otra propiedad de brushing
    pushMatrix();
    translate(x,y);

    float t = random(-am, am);
    ellipse(random(-am, am),random(-am,am), t, t);
    popMatrix();
  }}
  
   void keyPressed(){   
  saveFrame("ritoque at night.jpg");   
  println("fotograma grabado");   
}   
 

