
int d=10;
int xPos=10;
int yPos=100;
int directionx=4;
int directiony=4;
int rectw=60;
int recth=20;
int rectx=170;
int recty=340;
int score = 0;

void setup(){
  size(400,400, P2D);
  smooth(4);
  noCursor();
}

void draw(){
  background(120);
  strokeWeight(8);
  stroke(0);
  line(170,0,170,5);
  line(230,0,230,5);
  noStroke();
  fill(255);
  ellipse(xPos, yPos, d, d);
  xPos = xPos + directionx;
  yPos = yPos + directiony;
  if (xPos > width - d/2 || xPos< d/2) {
    directionx = directionx * -1;
  }
  
  if (yPos< d/2){
    directiony = directiony * -1;
  }
  
 
  
  
  if (yPos > height - d/2) {
    xPos=10;
    yPos=10;
    score=0;
  }
  fill(0);
  rect(rectx, recty,rectw,recth);
  
   if (keyPressed==true && keyCode==RIGHT){
    rectx=rectx+6;
  }
if (keyPressed==true && keyCode==LEFT){
    rectx=rectx-6;
  }
  
  if(xPos>rectx-(d/2) && xPos< rectx+60- (d/2) && yPos>340-(d/2)){
    //score = score + 1;
    directiony = directiony * -1;
  }
  
  if (rectx<0){
    rectx=0;
  }
  
  if (rectx>340){
    rectx=340;
  }
  
 
  
  text("Score: " + score, 330, 30);
   
   if (yPos < d/2 && xPos>172 && xPos<228) {
    xPos=10;
    yPos=10;
    score= score +1;
  }
}

