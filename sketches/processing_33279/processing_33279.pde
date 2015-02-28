
float circleY;
float velX= 5;
float velY= 5;
float circleX;

float BenY;
float BenvelX= 7;
float BenvelY= 7;
float BenX;

float AaronY;
float AaronvelX= 10;
float AaronvelY= 10;
float AaronX;

void setup(){
  
  size(900,450);
  smooth();
  
}

void draw(){
  
  stroke(255,255,0);
    for(int i= 0; i<width; i+=1){
      stroke(255, map(i,0,900,0,255), 0);
      line(i,0,i,height);
  }
  
  PImage myImage = loadImage("jam1.png");
  PImage Ben = loadImage("Ben.png");
  PImage Aaron = loadImage("Aaron.png");
  
  circleY+=velY;
  circleX+=velX;  //same as circleY+=vel
  image(myImage, circleX, circleY);
  
  BenY+=BenvelY;
  BenX+=BenvelX;
  image(Ben, BenX, BenY); //0,0 are x,y positions
  
  AaronY+=AaronvelY;
  AaronX+=AaronvelX;
  image(Aaron, AaronX, AaronY);
  
  if((circleX<0)||(circleX>width-75)){
    velX=velX*-1;
  }
  
  if((circleY<0)||(circleY>height-75)){
    velY=velY*-1;  //same as vel*+-1
  }
  
  if((BenX<0)||(BenX>width-75)){
    BenvelX=BenvelX*-1;
  }
  
  if((BenY<0)||(BenY>height-75)){
    BenvelY=BenvelY*-1;  //same as vel*+-1
  }
 
 if((AaronX<0)||(AaronX>width-75)){
    AaronvelX=AaronvelX*-1;
  }
  
  if((AaronY<0)||(AaronY>height-75)){
    AaronvelY=AaronvelY*-1;  //same as vel*+-1
  }
 
}


