

  int tamano1=20;
int contador= 0;

void setup(){
  
size(800,800);
background (0);
}

void draw(){
}

void mouseMoved(){
  
  contador=contador+1;
  stroke(188);
  noFill();
  line(mouseX,mouseY,contador,contador);
  print
}
