
float inc = 0;
int lados = 4;

int origenx;
int origeny;

PFont f;

void setup(){
  size(800,500);
  frameRate(100);
  origenx = width/2;
  origeny = height/2;
  f = createFont("Arial",16,true); 
}

void draw(){
 
  if (mousePressed) {
    origenx = mouseX;
    origeny = mouseY;
  }

  background(250,255,205);
  
  textFont(f);  
  fill(0); 
  textAlign(CENTER);
  text("Click para arrastrar y cambiar de forma",width/2,60); 

  fill(0);
  poligon(origenx+5, origeny+5);
  fill(200,50,0);
  poligon(origenx, origeny);
}

void mouseReleased() {
  int rand;
  do{
  rand = int(random(3,7));
  }while(rand==lados);
  
  lados = rand;
}

void poligon(int x, int y){
  beginShape();
  for(int i = 1; i<=lados; i++){

      inc++;
    
    vertex(x+100*sin(TWO_PI/lados*i+TWO_PI/lados/1000*inc), y+100*cos(TWO_PI/lados*i+TWO_PI/lados/1000*inc));
  }
  endShape(CLOSE);  
}               
