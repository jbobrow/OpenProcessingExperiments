
PFont font;

int posX, posY, velX, velY;
 
void setup(){
  size(400,400);
 
  posX = width/2;
  posY = height/2;
  velX = 5;
  velY = 5;
  posY = height/3;
  
  
  font = loadFont ("arial.vlw");
textFont (font);
 
}
 
void draw (){
  //cel
  background (270-mouseX,100,50+mouseX);
  
  //sol
  strokeWeight(2);
  fill(255,189,5);
  ellipse(mouseX, -(mouseX/2)+250,50,50);
  
  //barco
  strokeWeight (5);
  fill(255);
  triangle (width/2,height/2,200,00,300,height/2);
  triangle(width/2,height/2,200,50,130,height/2);
  quad(130,200,140,250,300,250,300,200);
  
  //mar
  fill(14,32,126);
  strokeWeight (2);
  quad(0,250,0,400,400,400,400,250);
   
  //text barco
fill(0, 0,0);
text("ESP-14", 210, 130,300,130);
 
  //ocell
  //posicio
  posX = posX + velX;
  posY = posY + velY;
  
  //ocell
  fill(129,127,127);
  ellipse(posX,posY,20,10);
  triangle(posX-2,posY-10,posX+5,posY+5,posX-5,posY+5);
  
  //comproba posicio
  if((posX<0)||(posX>width)){
  velX = -velX;
  }
  if((posY<0)||(posY>(height/2))){
  velY = -velY;
  }
}



