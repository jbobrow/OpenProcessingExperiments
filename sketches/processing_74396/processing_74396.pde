
int rect1x=20;
int rect1y=170;
int rect2x=670;
int rect2y=170;
int value=0;
int linex=10;
boolean play=true;
int xPos=36;
int yPos=200;
int score1=0;
int score2=0;
int d=20;
int directionx=4;
int directiony=4;
int a=10;
float start=0;

void setup(){
  size(700,400,P2D);
  smooth(4);
  noCursor();

}

void draw(){
  background(0);
  fill(255);
  noStroke();
  rect(rect1x, rect1y,10,60);
  rect(rect2x,rect2y,10,60);
  strokeWeight(2);
  stroke(190);
  line(width/2, 10, width/2, 40);
  line(width/2, 60, width/2, 90);
  line(width/2, 110, width/2, 140);
  line(width/2, 160, width/2, 190);
  line(width/2, 210, width/2, 240);
  line(width/2, 260, width/2, 290);
  line(width/2, 310, width/2, 340);
  line(width/2, 360, width/2, 390);



  fill(255);
  noStroke();
  ellipse(xPos,yPos,d,d);
  
  xPos = xPos + directionx;
  yPos = yPos + directiony;
  
  
   if (keyPressed==true && keyCode==UP){
    rect2y=rect2y-6;
  }
if (keyPressed==true && keyCode==DOWN){
    rect2y=rect2y+6;
  }
  
if(rect2y<0){
    rect2y=0;  
}

if(rect2y>340){
  rect2y=340;
}  

   if (keyPressed==true && key=='a'){
    rect1y=rect1y-6;
  }
if (keyPressed==true && key=='z'){
    rect1y=rect1y+6;
  }
  
if(rect1y<0){
    rect1y=0;  
}

if(rect1y>340){
  rect1y=340;
}  

if(yPos>height-d/2 || yPos<d/2){
directiony=directiony*-1;
}  

if(yPos>rect1y-(d/2) && yPos< rect1y+60+ (d/2) && xPos<rect1x+10+(d/2)){
   directionx = directionx * -1;
  }
  
if(yPos>rect2y-(d/2) && yPos< rect2y+60+ (d/2) && xPos>rect2x-(d/2)){
   directionx = directionx * -1;
  }
  fill(255);
  textAlign(CENTER);
  text("PLAYER 1 Score: " + score1, 30, 30, 70,30);
  text("PLAYER 2 Score: " + score2, 615, 30, 70, 30);
  text("Press G to Pause Press H to Resume", 30,360,110,30);
  text("Press O to Start again", 580, 360, 110, 30);

  if (xPos < d/2) {
    xPos=36;
    yPos=200;
    rect1x=20;
    rect1y=170;
    rect2x=670;
    rect2y=170;
    score2= score2 +1;
    directionx=directionx*-1;
  }
  if (xPos > width-d/2) {
    xPos=659;
    yPos=200;
    rect1x=20;
    rect1y=170;
    rect2x=670;
    rect2y=170;
    score1= score1 +1;
    directionx=directionx*-1;
  }

if (keyPressed==true && key=='o'){
    xPos=36;
    yPos=200;
    rect1x=20;
    rect1y=170;
    rect2x=670;
    rect2y=170;
    score1=0;
    score2=0;
    //directionx=directionx*-1;
  }

}

void keyPressed() {
  if (keyPressed) {
    if (key == 'g') {
     //if (keyPressed==true && key==ENTER){
    noLoop();
  }
}
 
  if (keyPressed) {
    if (key == 'h') {
     //if (keyPressed==true && key==ENTER){
    loop();
  }
} 
 
}
  
