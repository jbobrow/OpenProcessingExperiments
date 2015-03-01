
  int circle=50;
  int x=250;
  int y=250;
  int xSpeed=3;
  int numBalls=2;
  
void setup(){
  size(500,500); 
 
}

void draw(){
  background(0);
  fill(random(255),random(255),random(255));
  ellipse(x,y,circle,circle);
  x+=xSpeed;
  y+=xSpeed;
  if (x>=500-circle/2 || x<=circle/2){
    xSpeed*=-1;
  }
  if(mousePressed== true){
     circle=90;
  }else{
    circle=50;
  }
 
 // make a ball
 fill(random(255),random(255),random(255));
 noStroke();
 ellipse(mouseX,mouseY,50,50);
 if(mousePressed==true){
   ellipse(mouseX,mouseY,90,90);
 }

 
}



