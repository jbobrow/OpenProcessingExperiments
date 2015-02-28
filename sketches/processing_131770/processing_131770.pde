
int spacing = 4;

int speed=1;
int xPos=10;                    //Inital x position
int xDir=2;                     //Initial x direction and speed
int yPos=10;                    //Initial y position
int yDir=2;    


void setup(){
  size(400,400);
  frameRate(20);
  smooth();
}




void draw(){
   
  background(255);
  stroke(0);
  fill(200,0,400);
   rect(mouseX,mouseY,50,50);

  line(200,0,200,400);
  line(0,200,400,200);
  
  background(255);
  ellipse(xPos, 200, 40, 40);
  xPos=xPos+1;
  if (xPos>width+20)
  {
    xPos=-20;
  }
  
  
    ellipse(xPos, yPos, 20, 20);   
  xPos=xPos+xDir;                //Updates the x position
  if (xPos>width-10 || xPos<10)  //Checks to see if we hit a side
  {
    xDir=xDir*-1;                //Reverses the x direction
  }
  yPos=yPos+yDir;                //Updates the y position
  if (yPos>height-10 || yPos<10) //Checks to see if we hit top or bottom
  {
    yDir=yDir*-1;                
  }
 
  
  line(pmouseX,pmouseY,mouseX,mouseY);
  
  noStroke();
  fill(0,200,300,40);
  if (mouseX < 200 && mouseY < 200){
    fill(300,0,0,40);
    rect(0,0,200,200);
  } else if (mouseX > 200 && mouseY < 200){
    fill(0,300,30,40);
    rect(200,0,200,200);
  } else if (mouseX < 200 && mouseY > 200){
    rect(0,200,200,200);
  } else if (mouseX > 200 && mouseY > 200){
    fill(400,200,0,40);
    rect(200,200,200,200);
  }
  if (mousePressed) {
    
  }
   
   if (mousePressed) {
    stroke(255);
  } else {
    stroke(0);
  }
  rect(mouseX-66, mouseY, mouseX+66, mouseY);
  rect(mouseX, mouseY-66, mouseX, mouseY+66); 

  
}

void mousePressed(){
  background(random(400));
}
