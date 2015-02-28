
//Air hockey, a mesura que el disc es va movent canvia de colr i la seva forma de quadrat a rodo//
//variables//
float posX, posY, velX, velY;
int sz = 40;
int value = 0;
void setup(){
  size(400,600);
  posX = width/2;//posicions del disc//
  posY = height/2;
  velX = random(1,15);//velocitats del disc//
  velY = random(1,15);
  colorMode(RGB);
}
void draw(){
  smooth();
  dibuixa_fons();//carreguem el dibuix de l'air hockey//
  fill(value);
  ellipse(width/2,height/2,110,110);
  posX = posX+velX;
  posY = posY+velY;
  fill(posX,posY,50);
  ellipse(posX,posY,sz,sz);
  if((posX<40)||(posX>360)){//definim el limits de la finistra per designar fins a on reboti el disc//
    velX = -velX;
  } 
  if((posY<40)||(posY>560)){
    velY = -velY;
  } 
  if(posX>width/2){//Apliquem els condicional per tal de que vagi canvian de froma//
  fill(posX,posY,50);
  ellipse(posX,posY,sz,sz);
  }
  if(posX<width/2){
  fill(posX,posY,50);
  rect(posX,posY,60,60);
    } 
  }
void mousePressed() {//Quan cliquem el cercle central canvia de colr i augmenta la velocitat del disc fins a tornar a començar//
  if (value == 0) {
    value = 255;
  }else{
    value = 0;
  }
   posX = mouseX;
   posY = mouseY;
   velX = random (1,15);
   velY = random (1,15);
}   
void dibuixa_fons(){//Dibuix de l'air hockey//
  rectMode(CENTER);
  noStroke();
  background(10);
  fill(196,191,188);
  rect(width/2,height/2,400,600,20);
  stroke(0);
  fill(255);
  rect(width/2,height/2,380,580,20);
  noStroke();
  fill(250,93,140);
  ellipse(width/2,height/2,120,120);
  ellipse(width/2,600,120,120);
  ellipse(width/2,0,120,120);
  fill(value);
  ellipse(width/2,height/2,110,110);
  fill(255);
  ellipse(width/2,600,110,110);
  ellipse(width/2,0,110,110);
  fill(10);
  rect(width/2,600,120,20);
  rect(width/2,0,120,20);
  fill(250,93,140);
  rect(40,height/2,30,8);
  rect(110,height/2,30,8);
  rect(170,height/2,30,8);
  rect(230,height/2,30,8);
  rect(290,height/2,30,8);
  rect(350,height/2,30,8);
 }




