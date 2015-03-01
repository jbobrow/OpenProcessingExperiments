
int tam =50;
float posX,posY,velX,velY;

void setup(){
size(400,300);
posX=width/2;
posY=height/2;
velX=random(5);
velY=random(5);

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

ellipse(posX,posY,tam,tam);

}


void mousePressed(){
posX=mouseX;
posY=mouseY;

fill (random(255),random(255),random(255));

velX= random(15);
}




