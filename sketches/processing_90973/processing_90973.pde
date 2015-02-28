
float [] posX =  {random(30,70) , random(90,120), random(150, 190), random(200,250), random(260,350)};

float R,G,B;


void setup()
{
  size(400, 400);
  background(255);
  R = random(255); G = random(255); B = random(255);
  createBorder();
  createShapes();
   
}

void createBorder()
{
  fill(0);
  rect(0,380,width,height);
  rect(0,0,20,height);
  rect(380,0,20,height);
  
}

void createShapes()
{
  fill(0,255,255);
  rect(posX[0], height/4, 100, 100);
  fill(0,255,0);
  rect(posX[1], height/2, 40, 40);
  fill(255,255,0);
  rect(posX[2], height/3, 20, 20);
  fill(0,0,255);
  rect(posX[3], height/3, 70, 70);
  fill(255,0,255);
  ellipse(posX[4],height/2,40,40);
  if (( mouseX > 20 && mouseX < width - 20) && ( mouseY > 20 && mouseY < height - 20))
  {
    fill(R,G,B);
    ellipse(posX[0], height/4, 50, 50);
    rect(posX[1], height/2, 40, 40);
    ellipse(posX[2], height/3, 20, 20);
    rect(posX[3], height/3, 30, 30);
    ellipse(posX[4],height/2,40,40);
  }
 }
