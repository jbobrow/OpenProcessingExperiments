
float posX=random(400);
float posY=random(800);


float sentidoX=4;
float sentidoY=8;

int buenas=0;
int malas=0; 

void setup(){
  size (800,400);
  background(255);
}

void draw(){
  noStroke();
  background (133,232,218);
  fill(211,30,209);
  rect(mouseX-50,height-10,125,10);
  fill(52,116,178);
  ellipse(posX,posY,80,80);
  posY=posY+sentidoY;
  posX=posX+sentidoX;
  
  if(posY>=height-30){
    sentidoY=-sentidoY;
    float distancia=abs(mouseX-posX);
    if (distancia<=100) buenas=buenas+1;
    else malas=malas+1;
    
  }
  
  if (posY-30<=0){
    sentidoY=-sentidoY;
  }
  
  if (posX>= width-30){
    sentidoX=-sentidoX;
  }
  
  if(posX-30<=0){
    sentidoX=-sentidoX;
  }
  
  text ("Score", 20,20);
  text ("Buenas: "+buenas, 20, 30);
  text ("Malas: "+malas, 20, 40);
  
    
}
