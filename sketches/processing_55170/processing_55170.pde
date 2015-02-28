
void backgroundImage(){
noStroke();
  fill(255,200);
    ellipse(posX,posY,100,40);
    ellipse(posX+10,posY-10,80,40);
    ellipse(posX-10,posY+15,60,30);
    posX+=cloudX;
    if (posX>width+50){
      posX=-100;
    }
   
 fill(255,200);
    ellipse(posX1,posY1,100,40);
    ellipse(posX1-10,posY1-10,80,40);
    ellipse(posX1+30,posY1-5,100,40);
    posX1+=cloudX1;
    if (posX1>width+50){
      posX1=-100;
    }
    ellipse(posX2,posY2,100,40);
    ellipse(posX2+10,posY2-10,80,40);
    posX2+=cloudX2;
    if (posX2>width+50){
      posX2=-100;
    }
    
}

