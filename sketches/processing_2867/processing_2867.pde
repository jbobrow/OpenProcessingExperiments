

float margen, sp;

void setup(){
  margen = 20;
  sp = 50;
  size(500, 500);
  smooth();
}

void draw(){
 background(231,123,23);
   for(float y =margen; y <= height-margen; y += sp){
    for(float x = margen; x <= width-margen; x += sp){
      float d; //esta es la distancia
      d = dist(mouseX, mouseY, x, y);
     float diam;
    diam = map(d,0, 5*width, 10, 110); 
      fill(204,153,0);

    rect(x,y,diam,diam);
    }
  }
}

void keyPressed(){
  saveFrame("camiladonoso1_2009.jpg");
  println("fotograma grabado");
}

