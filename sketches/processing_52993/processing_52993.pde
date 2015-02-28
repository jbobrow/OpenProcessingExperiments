
int baja;
float giro;
float giroli;
int ceta;
float equis;
void setup(){
size(800,600);

noStroke();
smooth();
baja=0;
giro=0.0;

equis=0;
 equis=(random(50,750));
}

void draw(){
  background(255);

  
  if(baja>=570){

  translate(equis,baja);
  rotate(giro);
  rectMode(CENTER);
  rect(0,0,50,50);
  

  
  }
  
else{
translate(equis,baja);
rotate(giro);
fill(0,25,255,150);
  rectMode(CENTER);
  rect(0,0,50,50);
  giro=giro+0.1;
 
  baja=baja+4;

  
}
}

