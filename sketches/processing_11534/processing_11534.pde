
int diametro = 50;
int bolaX = 10;
float bolaY = 2;
boolean desce = true;
boolean direita = true;
int topo = 2;


void setup(){
  size(400,400);
  background(0);
  noStroke();
  smooth();
}


void draw(){
  //aqui desenha o fundo
  fill(0,0,0,5);
  rect(0,0,width,height);
  
  //aqui desenha a elipse
  fill(random(128)+128,random(255),random(255));
  ellipse(bolaX,bolaY,diametro,diametro);
  
  if (direita==true){
    // bola anda para a direita
    bolaX++;
  }
  if (direita==false){
    // bola anda para a esquerda
    bolaX--;
  }
  
  if( desce==true){
    bolaY=bolaY*1.05;
  }
  if(desce==false){
    bolaY=bolaY/1.05;
  }
  
  if(bolaY > height){
    desce = false;
    topo = topo+10;
  }
  if(bolaY < topo){
    desce = true;
  }
  
  if(bolaX > width){
    direita = false;
  }
  if(bolaX < 0){
    direita = true;
  }
    
}

