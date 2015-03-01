
int tam =50;
float posX,posY,velX,velY;

void setup(){
size(400,300);
posX=width/2;
posY=height/2;
velX=random(1,10);
velY=random(1,10);

}

void draw(){
background(0);
posX=posX+velX;
posY=posY+velY;



if(posX-tam/2<0||posX+tam/2>width){
  velX=-velX;
}

if(posY-tam/2<0||posY+tam/2>height){
  velY=-velY;
}



if(posX>=width/2){
  rect(posX-tam/2,posY-tam/2,tam,tam);
} else 
{ellipse(posX,posY,tam,tam);
}

if(posY<=height/2){
  fill(0,255,0);
} else {
  fill(255,0,0);
}

}





