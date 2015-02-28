
void setup(){
  size(640,480);
  frameRate(24);
  background(0);
  smooth();
  
}

void draw(){
  background (0);
  /*width es la anchura, podemos ponerlo cuando no estemos seguros
  de la anchura del lienzo*/
  
  for(int i = 0; i <width; i++){
    float a = random (200);
    ellipse(i, i + 10,a,a+20);
    for (int c = 0 ; c <= 255; c = c+20){
      fill(c, a, c, a);
    }
  }
  
}
