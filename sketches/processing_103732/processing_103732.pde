
float posX, posY, velX, velY;
int sz = 20;
//creem un objecte per poder escriure text
PFont lletra;
int totalRebots = 0;

void setup() {
  size(500,500);
  posX = width/2;
  posY = height/2;
  velX = random(8,15);
  velY = random(8,15);
/*
Carreguem un tipus de lletra que prèviament haurem creat
utilitzant el menú tools-->create font

*/
  lletra = loadFont("ArialMT-48.vlw");
//i preparem (com amb fill i stroke) la lletra amb què 
//escriurem el proper text
  textFont(lletra);
}

void draw(){
  background(50);
  actualitzaPosicions();
  dibuixa(posX,posY);
  dibuixa(posX-20,posY);
  comprovaLimits(posX,posY);
  excriuText();
}
void actualitzaPosicions(){
  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
}

void dibuixa(float px,float py){
  //dibuixem
  fill(110,150,50);
  ellipse(px,py,totalRebots,totalRebots);
}

void comprovaLimits(float px,float py){
  //comprovem la posició X
  if((posX<0)||(posX>width)) {
    velX = -velX;
    totalRebots ++;
  } 
  //comprovem la posició Y
  if((posY<0)||(posY>height)) {
    velY = -velY;
    totalRebots ++;
  }
}

void excriuText(){
  fill(127);
  //aquí escribim:
  text (totalRebots, 15, height-15);
}

 
 


