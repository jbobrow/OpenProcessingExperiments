
int moveY, moveX;
int moveY1, moveX1;

void setup() {
  size(400, 400);
  moveX1 = width;
  moveY1 = 0;
  moveY = 0;
  moveX = 0;

  background(random(400), random(400), random(255), random(255));
  smooth();
}

void animaterect() {
  fill(255, 255, 255, 100);
  fill(random(255), random(255), random(255));
  noStroke();
  rect(mouseX, mouseY, 40, 20);
  ellipse(moveX, moveY, 40, 100);
  ellipse(moveX, moveY, 100, 40);
  ellipse(moveX1, moveY1, 40,100);
  ellipse(moveX1, moveY1, 100,40);
  rect(mouseY, mouseX, random(40), mouseY);



  moveY1++;
  moveX1--;
  if (moveY1+40>= height) 
  {
    moveY1=0;
  }
  if (moveX1-40<=0) 
  {
    moveX1=width;
  }
  moveY++;
  moveX++;
  if (moveY+40>= height) 
  {
    moveY=0;
  }
  if (moveX+40>=width) 
  {
    moveX=0;
  }
}


void draw() {
  fill(255, 255, 255, 40);
  rect(0, 0, width, height);
  animaterect();


 
  fill(0, 0, 0,moveY);
 textSize(36); 
  textAlign(CENTER);
  text( "you love", 200,300);
  text( "marcus",(200), random(300));
}
  
  
  
  
  
  
  


