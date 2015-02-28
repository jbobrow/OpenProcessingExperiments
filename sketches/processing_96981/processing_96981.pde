

int posX, posY, velX, velY;
int sz = 20;
boolean dibuixaCercle = true;
boolean dibuixaFons = true;


void setup(){
  size(600,400);
  posX = width/2;
  posY = height/2;
  velX = 2;
  velY = 2;
}

void draw(){
  background(0);
  
  if(dibuixaFons){
     background(0);
    }else{
     background(255,45,64);
    } 
    
  
  
  
  
  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
  
  //dibuixem
  fill(255);
  if(posX>width/2){
    
  ellipse(posX,posY,150,150);
  } else {
   ellipse(posX,posY,250,250);
  } 

    if(dibuixaCercle){
  fill(mouseY,mouseX,85);
  ellipse(posX,posY,sz,sz);
    } else {
        fill(mouseY,mouseX,85);
  ellipse(posX,posY,100,100);
    }
    
    
   

  //comprovem la posiciÃ³ X
  if((posX - (sz/2)<0)||(posX + (sz/2)>width)){
    velX = -velX;
  } 
    //comprovem la posiciÃ³ Y
  if((posY - (sz/2)<0)||(posY + (sz/2)>height)){
    velY = -velY;
  } 
}

void mousePressed()  {
//    posX = width/2;
//  posY = height/2;
//  velX = 2;
//  velY = 2;


  
  dibuixaCercle = !dibuixaCercle;
dibuixaFons = !dibuixaFons;
}


