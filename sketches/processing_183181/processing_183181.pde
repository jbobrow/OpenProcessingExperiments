
//variables
float posX, posY; 
float velX, velY;
float color1 = 255;
float color2 = 255;
float color3 = 255;

void setup() {
  size(800, 500);
    background(250,240,220);
    posX = 100;
    posY = height/2;
    velX = 10;
    velY = 10;
}

void draw() {
  
  //actualització de posicions
  posX = posX+velX;
  posY = posY+velY;
  noStroke();
  fill(0,2); //fons rectangle
  
  //rectangle
  rect(50,50,700,400);
  noStroke();
 //anunciació de colors perquè es vegi la rodona
  fill(color1, color2, color3);
  ellipse(posX, posY, random(100),random(100));
 
  //rebot
  if((posX-40<60||posX+60>width-50)){velX = -velX;
  }
  if((posY-40<60||posY+60>height-50)){velY = -velY;
  }
}
void mousePressed(){
  posX = mouseX;
  posY = mouseY;
  velX = random(-12,12);
  velY = random(-12,12);
  color1 = random(0,255);
  color2 = random (0, 255);
  color3 = random (0, 255);
}
