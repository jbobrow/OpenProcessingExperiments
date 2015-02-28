
int counter;

int radius = 40;
float x = -radius;
float speed =10;
float inicio1=0.0;
float fin1=TWO_PI;
float inicio2=0.52;
float fin2=5.76;
float esp=0;
 
void setup(){
  size(240,120);
  ellipseMode(RADIUS);
  fill(0);
  frameRate(10);
}
 
void draw(){
  background(255,200,200);
  x += speed;
  if(x > width + radius){
    x = -radius;
  }
  arc(x, 60, radius, radius, inicio1, fin1);
 
esp=inicio1;
inicio1=inicio2;
inicio2=esp; 
esp=fin1;
fin1=fin2;
fin2=esp;
 
}
