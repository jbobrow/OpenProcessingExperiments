
int tamanioX = 150;
int tamanioY = 150;

void setup(){
  size(300,300);
}

void draw(){
  background(255);
  stroke(0);

line(tamanioX,0,tamanioX,tamanioY);
line(tamanioX,tamanioY,0,300);
line(tamanioX,tamanioY,300,300);
}

