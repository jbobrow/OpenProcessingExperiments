
int x = 0;
int direccion = 10;

void setup(){
  size(1000, 700);
}

void draw(){
  background(0);
  fill(255);
  smooth();
  ellipse(x, height/2, 100, 100);
  x = x+direccion;
 
 if (x >= width || x <= 0 ){
    direccion = direccion*-1;
} 
  
}


