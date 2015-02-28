
int xd = 1;  
int yd = 1;  
int shapewidth = 40;  

float posX, posY;       
float speedX = 2.8;  
float speedY = 2.2;  

void setup() 
{
  size(400, 400);
  posX = width/2;
  posY = height/2;
}

void draw() 
{
  background(0);

  
  ellipse(posX, posY, shapewidth, shapewidth);
  posX = posX + ( speedX * xd );
  posY = posY + ( speedY * yd );
  
  if (mousePressed == true) {
    fill(255);
    ellipse(mouseX, mouseY, shapewidth, shapewidth);
  } 
  else {
    fill(255);
  }
  if (posX > width-shapewidth || posX < shapewidth) {
    xd *= -1;
  }
  if (posY > height-shapewidth || posY < shapewidth) {
    yd *= -1;
  }
}
