
//Gandhi random walker
 
int sz= 20;
int numGandhi= 10;
int colorbigote2;
int i;

//ceamos matriz de posiciones x,y y velocidades x,y 
float [] posx = new float [numGandhi];
float [] posy = new float [numGandhi];
float [] velx = new float [numGandhi];
float [] vely = new float [numGandhi];
//matriz de color
color[] colorbigote = new color [numGandhi];

void setup(){
  size (600,600);
  noCursor();
// posiciones y velocidades de los Gandhi
for(int i=0; i<numGandhi; i++){
  posx[i]=random(width/2-120,width/2+120);
  posy[i]=random(height/2-120,height/2+120);
  velx[i]=random(1,2);
  vely[i]=random(1,2);
  colorbigote[i] = color (random(255),random(255),random(255));
  }
}
  

void draw(){
background(169,240,posy[i]); 

//BUCLE para que haga las mismas acciones en valores de matriz
 
  for(int i = 0; i<numGandhi; i++){
    //actualitzem posicions
    posx[i] += random(-6,6);
    posy[i] += random(-6,6);

//límites eje x - eje y para que los Gandhis no salgan de los límites de la pantalla
 
if (posx[i]  > width-5*width/48){
  posx[i]= width-5*width/48;
}

if (posx[i]  < 5*width/48){
 posx[i]=5*width/48;
}
 
if (posy[i]  > height-height/12){
 posy[i]= height-height/12;

}
if (posy[i]<height/12){
 posy[i]=height/12;

  }

//EMPEZAMOS A DIBUJAR
  
//cara, orejas
fill(242,194,149);
stroke(0);
strokeWeight(2);
 
ellipse(posx[i]+width/12,posy[i]+height/500,width/24,height/24);
ellipse(posx[i]-width/12,posy[i]+height/500,width/24,height/24);
 
fill(242,194,149);
ellipse(posx[i],posy[i],width/6,height/6);
 
 
 
//rayas frente
noFill();
stroke(0);
strokeWeight(2);
line(posx[i]-width/40,posy[i]-height/16,posx[i]+width/40,posy[i]-height/16);
line(posx[i]-width/30,posy[i]-height/19,posx[i]+width/30,posy[i]-height/19);
line(posx[i]-width/23.6,posy[i]-height/22,posx[i]+width/23.6,posy[i]-height/22);
 
 
//gafas
 
noFill();
stroke(0);
strokeWeight(2);
line(posx[i]+width/12,posy[i]-height/50,posx[i]-width/12,posy[i]-height/50);
fill(219,255,248);
stroke(0);
strokeWeight(2);
ellipse(posx[i]+width/30,posy[i]-height/64,width/24,width/24);
ellipse(posx[i]-width/30,posy[i]-height/64,width/24,width/24);
 
//ojos
fill(255);
ellipse(posx[i]+width/30,posy[i]-height/64,width/44,width/44);
ellipse(posx[i]-width/30,posy[i]-height/64,width/44,width/44);
fill(0);
ellipse(posx[i]+width/30,posy[i]-height/64,width/240,width/240);
ellipse(posx[i]-width/30,posy[i]-height/64,width/240,width/240);
 
//boca
fill(226,16,20);
ellipse(posx[i],posy[i]+height/24,width/24,height/32);
 
//bigote
fill(colorbigote2);
ellipse(posx[i],posy[i]+height/30,width/16,height/37);
 
 
//nariz
fill(242,194,149);
stroke(0);
strokeWeight(2);
ellipse(posx[i],posy[i]+height/90,width/44,height/44);
 
  
  }

}
//si se clica con mouse cambia el color del bigote
void mousePressed(){
colorbigote2 = color (mouseX,mouseY,0);

//cambio de posicion
  for(int i = 0; i<numGandhi; i++){
    posx[i]=mouseX;
    posy[i]=mouseY;
  }
}




