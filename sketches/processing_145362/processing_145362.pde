
//Júlia Molins Saura
//Pràctica 3: tortuga ninja en moviment dins la finestra

//posició, velocitat
float posx,posy,velx,vely;
int value=0;

void setup(){
  size(800,800);
  
//posició inicial al centre de la pantalla
posx=width/2;
posy=height/2;
velx=random(1,3);
vely=random(1,3);

}

void draw(){

background(255);
noStroke();

//actualitzem posicions
posx=posx+velx;
posy=posy+vely;

//DIBUIX
//Closca
fill(20,100,4,200);
ellipse(posx,posy,width/2,height*2/3);
//Panxa
fill(100,200,4,120);
ellipse(posx,posy,width*3/7,height*4/7);
//Pit
fill(235,255,113);
rect(posx-width/8,posy-height/10,width/4,height/5);
ellipse(posx,posy+height/10,width/4,height/4);
//Cap
fill(100,200,4);
ellipse(posx,posy-height/3,width/4,height/4);
ellipse(posx,posy-height/4,width/3,height/5);
//Mans
fill(100,200,4);
ellipse(posx-width*3/11,posy+height/10,width/10,height/10);
ellipse(posx+width*3/11,posy+height/10,width/10,height/10);
//Cinta-cap: 
fill(value);
rect(posx-width*7/48,posy-height/3,width*7/24,height/15);

  

//LIMITS
//posiciO X
  if((posx>height-270)||(posx<270)){
  velx = -velx;
  }
//posicio Y
  if((posy>height-270)||(posy<370)){
  vely = -vely;
  }

}

//AL CLICAR AMB EL MOUSE
void mousePressed(){

  //Retorna al centre
  posx=width/2;
  posy=height/2;
  velx=random(1,10);
  vely=random(1,10);
  
  //Cinta del cap--> canvia el color 
  if(value==0){value=255;
  }
  else{
  value=0;
  }
   
 
}
