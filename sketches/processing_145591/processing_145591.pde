

color colorback;
  int posX,posY,velX,velY;

  
void setup(){
  
  size (600,600);
  background(255);
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 8;
  colorback=0;
}

void draw(){
  background(colorback);
   
  posX=posX+velX;
  posY=posY+velY;
  
  dibuixarMickey(posX,posY);
  
  if((posX<80)||(posX>width-80)){
    velX = -velX;
  } 
 
  if((posY<70)||(posY>height-60)){
    velY = -velY;
  } 

}

void mousePressed()
{  
  colorback= color(mouseX,mouseY,0);
}

void dibuixarMickey(int _x,int _y)
{
  noStroke();
  

  fill(_x,_y,120);
  ellipse(_x,_y-2,110,110);//cap
  
  strokeWeight(2);
  fill(255,17,85);
  ellipse(_x,_y,100,100);//cap
  
  ellipse(_x+60,_y-40,44,44);//orelles
  ellipse(_x-60,_y-40,44,44);
  
  strokeWeight(1);
  fill(255);
  ellipse(_x-12,_y-10,20,40);//ulls
  ellipse(_x+12,_y-10,20,40);//ulls
  strokeWeight(2);
  fill(0);
  ellipse(_x-14,_y-2,5,8);//ulls
  ellipse(_x+10,_y-2,5,8);//ulls
  
  
  fill(0);
  ellipse(_x,_y+20,20,10);//nas
  
  
  fill(255);
  strokeWeight(2);
  arc(_x,_y+30, 30, 30,0,PI);
}
  
