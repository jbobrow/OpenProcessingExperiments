

float posX=random(400);
float posY=random(800);
float sentidoX=4;
float sentidoY=8;
int buenas=0;
int malas=0;

void setup(){
  size(800,400);
  background(0);
  noStroke();
  smooth();
}


void draw(){
  background(0);
  noFill();
  stroke(255);
  strokeWeight(5);
  ellipse(400,200,200,400);
line(400,0,400,400);
rect(-10,0,100,400);
rect(-30,100,70,200);
  rect(700,0,100,400);
  rect(760,100,70,200);
  
  //raqueta 
  noStroke();
  fill(255,0,0);
  rect(width-10,mouseY-100,10,200);
  rect(0,mouseY-100,10,200);
  //pelota
  fill(180,0,252);
  ellipse(posX,posY,60,60);
  
  posX=posX+sentidoX;
  posY=posY+sentidoY;
  
  if(posY>=height-30){
    sentidoY=-sentidoY;
    
  }
 if(posY-30<=0){
   sentidoY=-sentidoY;
     
 }
 if(posX>=width-30){
   sentidoX=-sentidoX;
     float distancia=abs(posY-mouseY);
 if(distancia<=100) buenas=buenas+1;
 else malas=malas+1;
 }
 if(posX-30<=0){
   sentidoX=-sentidoX;
       float distancia2=abs(mouseY-posY);
 if (distancia2>=100) malas=malas+1;
 else buenas=buenas+1;

 }
 
 text("Buenas:" +buenas,10,20);
 text("Malas:"+malas,10,50);
}




