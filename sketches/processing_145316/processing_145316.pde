
int posX, posY, velX, velY;
int a;
int b;
int medx, medy1, medy2;
float _x;
float _y;

void setup(){
  size(800,800);
  background(242,171,233);
  
  posX=width/2;
  posY=height/2;
  medx = 52; //Punt més exterior en coordenades x de la figura que hi ha, prenent com a referència el centre.
  medy1 = 38; //Punt més alt en coordenades y de la figura que hi ha, prenent com a referència el centre.
  medy2 = 72; //Punt més baix en coordenades y de la figura que hi ha, prenent com a referència el centre.
}
 
void draw(){
   
  background(242,171,233);
  
  //Defineixo una velocitat constant
  //Per tal que la pucca no em faci tot el rato el mateix recorregut, defineixo la velX i la velY diferents.
  velX=2;
  velY=4;
  //Actualització a cada moment perquè la pucca es mogui.
  posX = posX+velX;
  posY = posY+velY;
  //Determino la posició inicial.
  dibuixarpucca(posX,posY);
  //determinarem que el dibuix reboti en x quan el dibuix toqui el limit de la pantalla
  if((posX>width-medx) || (posX<medx)){velX = -velX;}

  //determinarem que el dibuix reboti en Y quan el dibuix toqui el limit de la pantalla
  if((posY<medy1)||(posY>height+medy2)){velY=-velY;}
  
}   
void dibuixarpucca(int _x,int _y){
  //Dibuix de la pucca 
  //Elipses que representen els monyetes
  stroke(0);
  fill(0);
  ellipse(_x-36,_y-22,32,32);
  ellipse(_x+36,_y-22,32,32);
   
  //Elipses que fan de gomes
  stroke(0);
  fill(255,0,0);
  ellipse(_x-24,_y-13,27,27);
  ellipse(_x+24,_y-13,27,27);
   
  //Piernas
  fill(0);
  rect(_x-14,_y+50,12,16);
  rect(_x+2,_y+50,12,16);
  ellipse(_x-8,_y+66,12,12);
  ellipse(_x+8,_y+66,12,12);
   
  //Manos
  strokeWeight(3);
  fill(252,244,222);
  ellipse(_x-25,_y+46,11,11);
  ellipse(_x+25,_y+46,11,11);
   
  //Vestido
  stroke(0);
  strokeWeight(3);
  fill(255,0,0);
  triangle(_x,_y+10,_x-20,_y+50,_x-30,_y+42);
  triangle(_x,_y+10,_x+20,_y+50,_x+30,_y+42);
  triangle(_x,_y-20,_x+20,_y+50,_x-20,_y+50);
  
  //Elipse que representa el cabell.
  stroke(0);
  fill(0);
  ellipse(_x,_y-3,70,55);
   
  //Elipse que representa la cara blanca.
  stroke(0);
  strokeWeight(3);
  fill(252,244,222);
  ellipse(_x,_y,65,50);
   
  //Arcos que representan las cejas
  strokeWeight(2);
  stroke(0);
  fill(252,244,222);
  arc(_x-20,_y-8, 20, 20,PI+8*PI/18, 2*PI-PI/4);
  arc(_x+20,_y-8, 20, 20,PI+PI/4,PI+9*PI/18);
   
  //Lineas que representan los ojos
  line(_x-25,_y-5,_x-10,_y);
  line(_x+25,_y-5,_x+10,_y);
   
  //Arco que hace de boca
  fill(252,244,222);
  arc(_x,_y+12,7,7,0,PI);
   
  //Elipses mejillas sonrojadas
  stroke(240,155,155);
  strokeWeight(1);
  fill(240,155,155);
  ellipse(_x-17,_y+11,7,7);
  ellipse(_x+17,_y+11,7,7); 
   
}

void mousePressed(){
  _x=mouseX;
  _y=mouseY;
  
}
