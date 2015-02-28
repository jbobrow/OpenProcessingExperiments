
int baja;
float giro;
float girar;
int ceta;
float cuadro;
void setup(){
size(500,500);
 
noStroke();
smooth();
baja=0;
giro=0.0;
 
cuadro=0;
 cuadro=(random(50,500));
}
 
void draw(){
  background(255);
 
   
  if(baja>=500){
 
  translate(cuadro,baja);
  rotate(giro);

  rect(0,0,50,50);
   
 
   
  }
   
else{
translate(cuadro,baja);
rotate(giro);
fill(0,25,255,150);

  rect(0,0,50,50);
  giro=giro+0.1;
  
  baja=baja+1;
 
   
}
}


