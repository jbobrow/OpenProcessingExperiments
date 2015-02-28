

PImage foto;//foto pixeles



void setup(){//cargar foto,propiedades de sketch.
  foto = loadImage("foto.jpg");
  size(800,600); 
  noStroke();
  noLoop(); 
  background(255);
  colorMode( HSB);


}


//valores de "imagen en el lienzo" valores a ocupar para Brushing
void draw(){
  float spacer =6;

  for(int y = 0; y < foto.height; y += spacer){
    for(int x = 0; x < foto.width; x += spacer){
      float p = map(x, 0, foto.width, 0,800);
      float pl = map(y, 0, foto.height, 0,700);
      color c = foto.get(x,y);
      fill(c);
      Brushing(p, pl, c, 5);
    }
  }

}
//Brushing con las propiedades designadas
void Brushing(float x, float y, color c, float am){
  int macchia =  round(random(5,20));
  for(int i = 0; i <= macchia; i++){
    //propiedades de color
    float M = hue(c)+random(40,140);//matiz
    float S = saturation(c)+random(0,15);//saturacion de color
    float B = brightness(c)+random(10,20); //brillo
    fill(M/2,S-25,B);//valores de los colores designados
    //otra propiedad de brushing
    pushMatrix();
    translate(x,y);
    
   ellipse(random(-5, 5),random(-5,5), random(-5, 10),random(-5,10));
    popMatrix();
  }}
void keyPressed(){   
  saveFrame("ritoque inverno.jpg");   
  println("fotograma grabado");   
}   




