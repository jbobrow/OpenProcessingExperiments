
/*JÚLIA DUCAT HINOJOSA
P2_b INFORMÀTICA
2n GEDI
ANNA MARIA DEL CORRA*/
 

//DECLARACIÓ DE VERIABLE

int x;
int x1;
int x2;
int x3;
int x4;
color colorX;

//CONFIGURACIÓ DE LA PÀGINA
void setup()
{
  size(600,600);//mides generals
}

//CONFIGURACIÓ DIBUIX
void draw(){
  
  //COLOR DE FONS
  colorX=color(5,200-mouseX,103);
  background(colorX);
  
  fill(255,255,mouseX/2);//Triangle blanc
  stroke(255,26,5);//color vermell
  strokeWeight(15);
  triangle(mouseX,mouseY-100,mouseX-100,mouseY+100,mouseX+100,mouseY+100);//Triangle que segueixi el mouse
  
  //signe exclamatiu del triangle
  fill(0);
  stroke(0);
  strokeWeight(10);
  rect(mouseX-2.5,mouseY-30,5,70); //pal exclamació
  ellipse(mouseX,mouseY-35,5,5);//pal exclamació
  ellipse(mouseX,mouseY+45,5,5);//pal exclamació
  ellipse(mouseX,mouseY+70,10,10);//circumferència exclamació
  

//CONFIGURACIÓ TEXTOS
//velocitats textos  
x=x+1;
x1=x1+2; 
x2=x2+3;
x3=x3+4;
x4=x4+5;

fill(255,255,255); 

 text("DANGEROUS",x,400,200,500);
 text("DANGEREUX",x1-70,100,200,500);
 text("PERILLÓS",x2-10,200,200,500);
 text("PERICOLOSO",x3-10,500,200,500);
 text("GEFÄHRLICH",x4-10,300,200,500);


//CONFIGURACIÓ DEL MOVIMENT TEXTOS
if(x>width){
  x=0;
}

if(x1>width){
  x1=0;  
}

if(x2>width){
  x2=0;  

}

if(x3>width){
  x3=0;  
}

if(x4>width){
  x4=0;  
}

//OCULTAR EL CURSOR
noCursor();
}




