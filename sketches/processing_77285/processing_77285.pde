

float posX=random (400);
float posY=random (800); 
float sentX=4;
float sentY=8;  
int buenas=0;
int malas=0;
  
void setup(){
  size(800,400);
  smooth();
  background(0);
}
  
void draw(){
  background(0);
  
   //Barrita 
  fill(#D1CA3F);
  rect(mouseX-50,height-10,100,10);
   
   //Pelota 
  fill(#819AB4);
  ellipse(posX,posY,60,60);
    
   posX=posX+sentX; 
   posY=posY+sentY;
   
     
    if(posY>=height-30){
      sentY=-sentY;
      float distancia=abs (mouseX-posX);
      if (distancia<=100){ buenas=buenas+1;
      }
      else malas=malas+1;
          
    }
      if(posY-30<=0){
      sentY=-sentY;    
      }
      
      if(posX>=width-30){
      sentX=-sentX;
      }
      
      if(posX-30<=0){
      sentX=-sentX;
      }
      
    fill(255);
    text("Score",10,10);
    text("Buenas: "+buenas,10,20);
    text("Malas: "+malas,10,30);
    
}

