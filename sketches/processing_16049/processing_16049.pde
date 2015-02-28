
PImage foto;

int a=0;
int direccion = 10;
void setup() {
  size(800, 600);  
  background(0);  
  foto = loadImage ("boca.jpg"); 
}

void draw() {
  // background(0); 
  rectMode(CENTER);
  image (foto, a,300,100,70);  
  a=a+direccion;
  if(a>=800|| a<=0){
    direccion = direccion *-1;
  }
} 
void mousePressed(){
  noLoop();
}
void keyPressed(){
  loop();
}

