
int moveX;// x variable set up
int  moveY;// y variable set up
 void setup(){
moveY=0;
moveX=0;
  size(300,300);
background(250,250,40);
 }

void draw() {
  fill(50,100,200);
  stroke(100,250,10);// bottom circle
  ellipse(moveX, moveY, 50, 50);//stream
  moveY++;
  moveX++;
 stroke(4);
 fill(230,230,10);
ellipse(35,35,moveX,moveY); //top circle
fill(150,250,50);
 ellipse(40,40,moveX,moveY);
 
}
