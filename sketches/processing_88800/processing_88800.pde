
float myX;
float myY;
float mushMove;
color mouseFlower;
color randomFlower;
float positionX;
float positionY;
int value=0;
int bulletNumber=10;
String s="Game Over";

void setup()
{
  size(800,600);
  myX=width/2;
  myY=height/2;
  mushMove=0.0;
  mouseFlower=color(255, 204, 0);
  randomFlower=color(255,20,70);
}
void draw()
{
  smooth();
  background(205,225,255);
  //flowers
   for (int x=50;x<width;x=x+100)
  { 
    for(int y=480;y<height;y=y+70)
    {
    drawFlower(x,y,randomFlower);
  }
  }
  //mushroom
  mushMove=mushMove+0.001;
  myX=200+(width-400)*noise(mushMove);
  myY=200+(height-400)*noise(mushMove);
  drawMushroom(myX, myY);
  //flower gun stays in the bottom of the canvas
  if(mouseY>=400){ 
    drawFlower(mouseX,mouseY,mouseFlower);
  }
  else{
    drawFlower(mouseX, 400,mouseFlower);
  }
  //shoot a flower bullet when mouse is clicked
  if (value==1&&bulletNumber>=0){
  positionY=positionY-20;
  drawFlower(positionX, positionY, mouseFlower);
  }
  if (positionY<0){
    value=0;
  }
//count bullet numbers
for(int x=10;x<=bulletNumber*10;x=x+10){
  noStroke();
  fill(87);
  rect(x,40,6,30,3);
}
//when bullet is used up, game over
if (bulletNumber<=0){
  textSize(80);
  textAlign(CENTER);
  fill(87);
  text(s,width/2,height/2);
}
}

void drawMushroom(float centerX, float centerY)
{
 pushMatrix();
 translate(centerX,centerY);
   //feet
  noStroke();
  fill(255,126,98);
  ellipse(20,40,12,12);
  ellipse(-20,40,12,12);   
  //bottom//
  fill(255,193,159);
  ellipse(0,0,100,80);
  //mouth//
  stroke(0);
  fill(255);
  rectMode(CENTER);
  rect(0,30,10,8,3);
  //top//
  noStroke();
  fill(255,71,46);
  ellipse(0,-65,170,110);
  //hands
  fill(255,126,98);
  ellipse(48,20,15,15);
  ellipse(-48,20,15,15); 
  //spots
  fill(255);
  ellipse(0,-45,25,20);
  ellipse(50,-55,25,20);
  ellipse(-50,-55,25,20);
  ellipse(30,-90,25,20);
  ellipse(-30,-90,25,20);
  //eyes//
  drawLeftEye();
  drawRightEye();
  popMatrix();
}

void drawLeftEye()
{
 fill(255);//left eye
  stroke(0);
  strokeWeight(2);
  ellipse(-25,-5,30,30);
  pushMatrix();//left eyeball
  translate(-25,-5);
  rotate(radians(frameCount*2+200));
  fill(0);
  ellipse(8,0,6,6);
  popMatrix();
}

void drawRightEye()
{
  fill(255);//right eye
  ellipse(25,-5,30,30);
  pushMatrix();//right eyeball
  translate(25,-5);
  rotate(radians(frameCount*2));
  fill(0);
  ellipse(8,0,6,6);
  popMatrix();
}

void drawFlower(float x, float y, color c)
{
  pushMatrix();
  translate(x,y);
  rotate(radians(frameCount));
  stroke(0);
  fill(c);
  ellipse(10,0,20,20);
  ellipse(-10,0,20,20);
  ellipse(0,10,20,20);
  ellipse(0,-10,20,20);
  ellipse(0,0,20,20);
  popMatrix(); 
}
void mouseClicked()
{
  //record the position when mouse is clicked
  positionX=mouseX;
  positionY=mouseY;
  value=1;
  bulletNumber=bulletNumber-1;
}



