
//Carlos Borràs
//Pràctica3
//moviment constant d'una figura dintre de la pantalla

int _x;
int _y;
int velX;
int velY;

void setup(){
  size(500,500);
  _x = width/2;
  _y = height/2;
  velX = 2;
  velY = 2;
}

void draw(){
  background(0);
  fill(179,216,68);
  //posicions
  _x = _x+velX;
  _y = _y+velY;
  
  //dibuix
  
//PEU DRET
rect(_x+10,_y+20,30,80,100);
//PEU ESQUERRA
rect(_x-40,_y+20,30,80,100);

//COS
rect(_x-50,_y-50,100,100,1,1,20,20);

//BRAÇ ESQUERRA
rect(_x+55,_y-50,30,80,100);
//BRAÇ DRETA
rect(_x-85,_y-50,30,80,100);

//CARA
arc(_x,_y-55,100,100,PI,2*PI);

//ULL1
fill(0);
arc(_x+20,_y-80,10,10,PI,4*PI);
//ULL2
arc(_x-20,_y-80,10,10,PI,4*PI);



  //posicio X
  if((_x-85<0)||(_x+85>width)){
    velX = -velX;
  } 
    //posicio Y
  if((_y-105<0)||(_y+100>height)){
    velY = -velY;
  } 
}


