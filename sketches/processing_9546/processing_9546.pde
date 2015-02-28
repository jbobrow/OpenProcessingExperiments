
class spaceShip{
float d;
int xPos;
int yPos;
int speed=5;

spaceShip(){
  xPos=0;
  yPos=10;
}

void display(){
  
  ellipseMode(CENTER);
  //background(0);
  fill(255);
  ellipse(xPos-5, yPos-2 , 5,10);//ears 
  ellipse(xPos+5, yPos-2, 5,10);
 
  fill(255);
  ellipse(xPos, yPos, 20,10);
  
   fill(0);
  ellipse(xPos-3, yPos-2, 4,2);
  ellipse(xPos+3, yPos-2, 4,2);
  ellipse(xPos, yPos+1,5 ,3);
}

void move(){
  xPos+=speed;
  if(xPos>width){
    stop();
  }
}
//xPos+=speed;
    //if ((xPos> width) || (xPos<0)){
      //xPos = xPos + random(-1,1)*speed;
      //yPos = yPos + random(-1,1)*speed;
     //
     // xPos = constrain(xPos,0,width);
     // yPos = constrain(yPos,0,height);

      //speed=speed*-1;   
    //}
  //}
void stop(){
  newMillis=millis();
  xPos=-10;
  background(0);
  ellipse(xPos, yPos, 20,10);
}
void hit(){
  d=dist(xPos,yPos,myBullet.xPos,myBullet.yPos);

  if(d<25){
    myBullet.tripped=false;
    stop();
  }
}


}


