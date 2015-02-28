
float posX=random (400);
float posY=random (800);
 
float sentidoX=4;
float sentidoY=8;
 
int buenas=0;
int malas=0;
 
void setup(){
  size(800,400);
  background(250,200,150);
 
}
 
void draw(){
  background(250,200,150);
   
  fill(0,0,250);
  rect(mouseX-50,height-10,100,10);
   
  fill(0,250,0);
  ellipse(posX,posY,60,60);
   
   posY=posY+sentidoY;
   posX=posX+sentidoX;
    
    if(posY>=height-30){
      sentidoY=-sentidoY;
    float distancia=abs (mouseX-posX);
    if (distancia<=100) buenas=buenas+1;
    else malas=malas+1;
   
    }
     
    if(posY-30<=0){
      sentidoY=-sentidoY;
       
    }
     
 
    if(posX>=width-30){
      sentidoX=-sentidoX;
    }
     
    if(posX-30<=0){
      sentidoX=-sentidoX;
       
    }
     
    fill(0);
    text("Score",10,15);
    text("Buenas: "+buenas,10,35);
    text("Malas: "+malas,10,55);
    text("Game 1", 750,390);
   
}
