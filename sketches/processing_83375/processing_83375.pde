
char hack[]={'H','A','C','K','P','A','C','T'};
int X=0;
int Y=0;
PFont fuente1;
PFont fuente2;
PFont fuente3;
int fuente=0;
int tamano=0;

void setup(){
size(500,500);
background(0);
fuente1= loadFont("DilleniaUPC-48.vlw");
fuente2= loadFont("MiriamFixed-48.vlw");
fuente3= loadFont("OCRAExtended-48.vlw");

}

void draw(){
fill(0,0,0,12);
rect(0,0,500,500);
letra();
}

void letra(){
fuente= int(random(0,4));
switch(fuente){
case 0:
tamano=int(random(12,50));
textFont(fuente1,tamano);
break;
case 1:
tamano=int(random(12,50));
textFont(fuente2,tamano);
break;
case 2:
tamano=int(random(12,50));
textFont(fuente3,tamano);
break;
case 3:
tamano=int(random(12,50));
textFont(fuente1,tamano);
break;
case 4:
tamano=int(random(12,50));
textFont(fuente2,tamano);
break;

}
  
for(int i=0;i<hack.length;i++){
  
  X=int(random(0,500));
  Y=int(random(0,500));

fill(X/2,Y/2,200); 
text(hack[i],X,Y);
}
}

