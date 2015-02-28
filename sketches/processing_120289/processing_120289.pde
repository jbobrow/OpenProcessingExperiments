
  /* 
  Trabalho 1 -> Halloween 
  Nome: Igor Maier Fang  
  Data: 07/11/2013
  */
  
PImage background = loadImage("back.png"); 
PImage zumbi_e = loadImage("zumbi.png"); 
PImage zumbi_d = loadImage("zumbi2.png");
PImage z_balao = loadImage("balao.png");
int zb = 500; // eixo x,inicio do zumbi 
int bl = 630; // eixo x,inicio do balão
int diag = 300;  //eixo y, p/ diagonal do balão 
float x = random(450);
float z = random(450);

void setup(){
  size(600,450);
  smooth();
  frameRate(200);  
}

void draw(){
  image(background,0,0);
  
  zumbi();
  
  //base do cemitério
  fill(0);
  rect(0,395,600,60);
    
}

void zumbi(){
  zb--; 
  image(zumbi_d,350,zb);
  image(zumbi_e,100,zb);
  
  //parar os zumbis  
  if(zb <= 265){
    zb = 265;
  }
         
  //zombi balao
  bl--;
  diag--;
  image(z_balao,bl,diag);    
   
  //zumbis randômicos 
  image(zumbi_e,x,zb);
  image(zumbi_d,z,zb);  
}
  
  

    




