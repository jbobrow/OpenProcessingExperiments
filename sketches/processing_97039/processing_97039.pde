
int posX,posY, velX, velY;
float mida =6;
float mida1 =10;

void setup (){
  size (300,150);


  posX = width /2;
  posY = height/2;
  velX = 2;
  velY =2;
}
void draw (){
  background (#0D930C);
  
  
  line (0,0,300,0);
  line (300,0,300,150); 
  line (300,150,0,150);
  line (0,150,0,0);
  line (150,0,150,150);
  
   noFill();    
  ellipse (150 , 75 , 6,6 );
  ellipse (150 , 75 , 35,35 );
  
 
  
  ellipse (0 , 75 , 100 , 100 );
  ellipse (300 , 75 , 100 , 100 );
       
  
   stroke (#FFFFFF);
   strokeWeight ( 5);
  
    posX = posX+velX;
  posY = posY+velY;
  
  
 
  ellipse(posX,posY,mida,mida);
  

 
  if((posX<6)||(posX>width)){
    velX = -velX;
  } 
    
  if((posY<6)||(posY>height-6)){
    velY = -velY;
  
}

 
if(mousePressed==true){
  rect (0,mouseY,mida1,20);
  rect (290,mouseY,mida1,20);
  
  
}
}


