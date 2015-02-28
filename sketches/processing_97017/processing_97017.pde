
int posX,posY,velX,velY;
float sz,sz2,sz3;

void setup(){
  size(750,500); //definim el tamany de la pantalla
  sz=5;
  velX=2;
  velY=1;
  posY=height;
  sz2=80;
  sz3=900;
  //diem que no volem veure el ratolí
  noCursor();
}

void draw(){
  //actualitzar posicions
  posX=posX+velX;
  posY=posY-velY;
  background(0,0,posY/2);
  fill(0,200,0);
  ellipse(width/2,height+350,1000,sz3); //Terra
  //lluna
  fill(200);
  ellipse(width-80,80,sz2,sz2);
  //dibuixem el ninot
  fill(255,0,0);
  ellipse(posX-5,posY+15,7,7); //Foc
  //jetpack
  fill(100);
  triangle(posX-5,posY,posX-10,posY+15,posX,posY+15); //propulsor
  rect(posX-10,posY-10,10,15); //caixa
  //persona
  fill(0,150,0);
  rect(posX,posY-10,5,20); //cos
  fill(255,160,160);
  ellipse(posX+2.5,posY-12,sz,sz); //cap
  rect(posX,posY+10,3,8); //cames
  if((posX<0)||(posX>width-10)){ //definim que la persona reboti en les parets de dreta, però a l'esquerra no em deixa posar límit, que és 10, el ninot es mou verticalment a la línia 0
    velX=-velX;
  }
  if((posY<20)||(posY>height)){ //definim que la persona reboti en les parets de dalt, però a baix no em deixa posar límit, que és 18, el ninot es mou horitzontalment a la línia 
    velY=-velY;
  }
  if((posY<height/2)||(posY>height)&&(velY>0)){ //definim que li creixi el cap quan supera la meitat de la pantalla
    sz=sz+0.04;
  }
  if(velY<0){ //definim que disminueixi el tamany del cap quan torna a la superfície terrestre
    sz=sz-0.038;
  }
}

void mousePressed() {
  if(sz2==80){
    sz2=150;
  } 
  else{
    sz2=80;
  }
  if(sz3==900){
    sz3=800;
  }
  else{
    sz3=900;
  }
}



