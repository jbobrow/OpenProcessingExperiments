
//Informatica 2013/2014 - S2B_Dibuix Personatge Kerobero - Laura Freixas Conde//


//definicio variables enteres (no decimals)
int a;
int b;
int c;
int d;
int e;
int f;


void setup(){ // elements fixos

  noCursor(); //fa desapareixer el cursor de la pantalla
  size(1000,1000); //width es 1000 i height es 1000
  
  a=width/2; //a es el valor de la meitat de l'ample de la pantalla
  b=height/2; //b es el valor de la meitat de l'altura de la pantalla
  c=width/3; //c es el valor d'un ters de l'ample de la pantalla
  d=height/3; //d es el valor d'un ters de l'altura de la pantalla 
  e=width/4; //e es el valor d'un quart de l'ample de la pantalla
  f=height/4; //f es el valor d'un quart de l'altura de la pantalla
}


void draw(){
  
float x = mouseX-a; // asigno la coordenada x al cursor
float y = mouseY-b; // asigno la coordenada y al cursor
background(220); //definició valor fons


//formes calideoscopiques
  stroke(0); //color linia negre
  strokeWeight(width/1000); //gruix de la linia en funcio de l'amplada de la pantalla dividit entre 1000
  fill(mouseY,mouseY,mouseX,mouseX); //canvi de color segons la posicio del mouse en x i y
  
  ellipse(a,f,mouseX+5,mouseX+5); //x1=coordenada x de posicio respecte l'ample de pantalla, y1=coordenada y de posicio respecte l'altura de pantalla, x2=dimensio ellipse en la direccio x, y2=dimensio ellipse en la direccio y
  ellipse(e,height/4*2,mouseX+5,mouseX+5);
  ellipse(width/4*3,height/4*2,mouseX+5,mouseX+5);
  ellipse(a,height/4*3,mouseX+5,mouseX+5);
  
  ellipse(a,b,mouseX-50,mouseX-50);
  ellipse(c,d,mouseX+10,mouseX+10);
  ellipse(width/3*2,d,mouseX+10,mouseX+10);
  ellipse(c,height/3*2,mouseX+10,mouseX+10);
  ellipse(width/3*2,height/3*2,mouseX+10,mouseX+10);
  
  fill(mouseX,mouseX,mouseY,mouseY);
  ellipse(a,b,a,b);
  noFill(); //entitat sense color de fons
  ellipse(a,b,mouseX+100,mouseX+100);
  

//orella esquerra
strokeWeight(width/500);//gruix de la linia en funcio de l'amplada de la pantalla dividit entre 500
fill(251,199,1); //valors paleta de colors separats per r+g+b
ellipse(mouseX-140,mouseY,width/4.4,f);

//orella interior esquerra
fill(251,253,128);
ellipse(mouseX-150,mouseY,width/6.1,height/5.3);

//orella dreta
fill(251,199,1);
ellipse(mouseX+140,mouseY,width/4.4,f);

//orella interior dreta
fill(251,253,128);
ellipse(mouseX+150,mouseY,width/6.1,height/5.3);

//cara
fill(251,199,1);
ellipse(mouseX,mouseY,width/2.8,d);

//boca 
fill(255,113,128);
ellipse(mouseX,mouseY+10,width/66.6,height/17.7);
noStroke(); //sense linia de contorn
fill(251,199,1);
rect(mouseX,mouseY+17,width/66.6,-height/17.7);
rect(mouseX,mouseY+17,-width/66.6,-height/17.7);

//ull esquerre
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(mouseX-120,mouseY,width/57.1,height/114.2);
noStroke();
rect(mouseX-130,mouseY,width/40,height/114.2);

//ull dret
stroke(0);
strokeWeight(width/500);
fill(251,199,1);
ellipse(mouseX+120,mouseY,width/57.1,height/114.2);
noStroke();
rect(mouseX+110,mouseY,width/40,height/114.2);

//nas
stroke(0);
strokeWeight(width/500);
fill(0);
triangle(mouseX-3,mouseY+5,mouseX+3,mouseY+5,mouseX,mouseY+7); //parametres de posicio x1,y1,x2,y2,x3,y3 dels vertexs del triangle

//llavi esquerre
noFill();
ellipse(mouseX+4,mouseY+15,width/100,height/160);
fill(251,199,1);
noStroke();
rect(mouseX,mouseY+15,width/40,-height/177.7);

//llavi dret
stroke(0);
strokeWeight(width/500);
noFill();
ellipse(mouseX-4,mouseY+15,width/100,height/160);
fill(251,199,1);
noStroke();
rect(mouseX,mouseY+15,-width/40,-height/177.7);

//galta esquerra
stroke(0);
strokeWeight(width/500);
fill(194+mouseY,28+mouseX/2,42);
ellipse(mouseX-120,mouseY+25,width/32,height/80);

//galta dreta
ellipse(mouseX+120,mouseY+25,width/32,height/80);

}




