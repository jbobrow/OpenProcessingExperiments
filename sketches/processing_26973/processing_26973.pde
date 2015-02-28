
float x;
float y;
float speed=+1;
PImage myImage;

void setup(){
  size(600,600);
  background(0);
  x=0;
  y=0;
  myImage= loadImage("face.gif");

}

void draw(){
  
   
  
  if(y>=100){
    speed=-1;
  }
  if(y<=0){
    speed=+1;
  }
  if(x>=30){
    speed=-1;
  }
  if(x<=0){
    speed=+1;
  }
  
  
  
  x=x+speed;
  y=y+speed;
  fill(255,0,0);
  
  
    for(int i=10; i<600; i=i+90){  
    for(int j=0; j<600; j=j+30){
   rect(i+x+50,j+10,20,255);
   
   fill(random(255),20);
   ellipse(i,+x+j+20,15,15);
   
   fill(i,0,random(255),10);
   textSize(50);
   text("X",i+x+20,j+40);
   
   
   image(myImage,y+i+5,y+j);
  }
  }
  
  
  
  
  
}




