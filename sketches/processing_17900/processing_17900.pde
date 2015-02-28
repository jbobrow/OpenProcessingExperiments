
float limitY = 0;
float posX = 0;
float posY = 0;
float ellipseSize = 10;
 
void setup(){
  size(250,250);
  frameRate(20);
  smooth();
}
 
void draw(){
  noStroke();
  fill(80,150,80,100);
  ellipse(random(250),random(250),15,15);
  
 //outer eillipse
  ellipseMode(CORNER);
 stroke(30,90,140,20);
  fill(180,40,80,30);
  ellipse(0,0,250,250);
 //middle ellipse
  fill(100,20,40,30);
  ellipse(25,25,200,200);
  //middle ellipse
  fill(20,0,20,30);
  ellipse(50,50,150,150);
  
 //middle ellipse
 fill(-60,0,0,30);
  ellipse(75,75,100,100);
 
  stroke(180,155,0);
  strokeWeight(2);
  for(int i=0;i<10;i++){
 
  
    ellipse(posX,posY,ellipseSize,ellipseSize);
    posX+=ellipseSize;
    if(posX>width){
      posY+=ellipseSize;
      posX=0;
    }
  }
    for(int i=50;i<random(1);i++){
    ellipseMode(CENTER);
    ellipse(posX,posY,ellipseSize,ellipseSize);
    posX+=ellipseSize;
    if(posX>20){
      posY+=ellipseSize;
      posX=0;
   
    }
  } if(limitY<70){
    limitY++;
  } else {
  posX = 0;
  posY = 0;
  limitY = 0;
  }
 
}

