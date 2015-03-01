
void setup(){
  size (600,600);
  background(255);
  frameRate(20);
}

float a;
float l;
float f;
float r;

void draw(){
  f= 20;

for( float a=20; a<550; a=a +50){
  for(l=20;l<550; l=l+ 50){
    fill( random (255),random(56),random(30));
    rect (random (a), random(l), random(f), f/2);
    
    
  }
}
}
