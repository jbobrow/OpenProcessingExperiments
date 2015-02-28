
int directionX;
int x;
int directionY;
int y;

void setup(){
  size(600,600);  
    directionX=2;
    directionY=2;
    x=20;
    y=100;
}

void draw(){
  //background(0,0,0,10);
  x= x + directionX;
  
  y= y + directionY;
  
 ellipse(x,y,50,50);
 
  if (y> 600) {
    directionY=-1;
    background(random(100), random(75), random(255));
  }
  
  if(x>600){
   directionX=-3;
   background(random(100),random(67), random(200));
 }
if(y<0){
  directionY=1;
  background(random(50),random(78),random(98));

}
if(x<0){
  directionX=1;
  background(random(45), random(200),random(200));
}


}



