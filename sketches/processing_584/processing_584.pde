
void setup (){
  size(400,400);
  background(248);
}

void draw(){
  // for(declaracion;comparacion;operacion);
  for (int x=0; x<400; x+=25){    // h= horizontal= x , v= vertical =y
    for ( int y=0; y<400; y+=25){
 //fill (255); // normal
 stroke((x+y)*0.80, (x+y) *0.0, (x+y)* 0.50); // degradado * multiplicacion, del rgb
strokeWeight (15);
 //rect (x,y,20,20);
 point (x,y);
  }
  }}

