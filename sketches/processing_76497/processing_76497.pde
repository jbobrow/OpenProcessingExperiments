
float posX=random (400);
float posY=random (800);

float sentidoX=4;
float sentidoY=8;

int buenas=0;
int malas=0;

void setup(){
  size(800,400);
  background(255,100,100); 

}

void draw(){
  background(255,100,100);
  
  fill(255,200,0);
  rect(mouseX-50,height-10,100,10);
  
  fill(0,200,255);
  ellipse(posX,posY,70,70);
  
   posY=posY+sentidoY;
   posX=posX+sentidoX;
   
    if(posY>=height-45){
      sentidoY=-sentidoY;
    float distancia=abs (mouseX-posX);
    if (distancia<=100) buenas=buenas+1;
    else malas=malas+1;
  
    }
    
    if(posY-45<=0){
      sentidoY=-sentidoY;
      
    }
    

    if(posX>=width-45){
      sentidoX=-sentidoX;
    }
    
    if(posX-50<=0){
      sentidoX=-sentidoX;
      
    }
    
    fill(255,200,200);
    text("Score",10,15);
    text("Buenas: "+buenas,10,35);
    text("Malas: "+malas,10,55);
    text("tu puedes!", 370,15);
    text("hechale ganas", 365,30);
    text("juego 1", 750,390);
  
}
