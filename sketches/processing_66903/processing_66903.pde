

void setup(){
size(500,500);
}

void draw(){
  background(255);
for(int posX=0; posX<500; posX+=10){
 for(int posY=0; posY<500; posY+=10){
  float s=random(0,5);
 myRect(posX,posY,s);
  }
 }
}


void myRect(int posX, int posY, float s){
 pushMatrix ();
 translate(posX,posY);
rect(0,0,s,s);
 popMatrix();
}


