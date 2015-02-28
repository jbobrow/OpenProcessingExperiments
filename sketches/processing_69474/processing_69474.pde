
int pos=0;
int letra=0;
int j=0;
int i=0;
int acomodo=0;
char nombre[]={'A','R','M','A','N','D','O'};
int a=1;
void setup(){
  size(800,400);
  background(0);
  frameRate(3);
  
}

void draw(){
  background(0);
  PFont tipo_letra;
  tipo_letra= loadFont("SansSerif.bolditalic-48.vlw");
  textFont(tipo_letra, a=38);
  
   for( j=0; j<acomodo ; j++)
  text(nombre[j], pos+=35, 400);
  
  for(i=acomodo; i<7 ; i++) 
  
  text(nombre[i], random(0,800),random(0,400));

  
 acomodo+=1;
  if(acomodo==8)
  acomodo=0;
  
  pos = 0;
}
  

