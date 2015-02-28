
int xPos1;
int yPos1;
int xPos2;
int yPos2;
int dia1;
int velocityX;
int velocityY;
int velocityX1;
int velocityY1;

void setup() {
  size (500, 500);
  background (255);
  frameRate(30);
  smooth();
  xPos1 = width/2;
  yPos1 = height/2;
  xPos2 = width/2;
  yPos2 =height/2;
  dia1 = 50;
  velocityX = 6;
  velocityY = 4;
  velocityX1 = 10;
  velocityY1 = 5;
  
}

void draw () {
  
  yPos1 += velocityY;
  xPos1 += velocityX;
  xPos2 += velocityX1;
  yPos2 += velocityY1;
  
  
  background (255);  
  fill (100);

  if (yPos1 >= height-26 || yPos1 <= 25) {
   velocityY = -velocityY;
  }

  if(xPos1 >= width-26 || xPos1 <= 25){
   velocityX = -velocityX;
  }

  ellipse (xPos1, yPos1, dia1, dia1);
//println("velocityX: "+velocityX+" velocityY: "+velocityY);


  if(yPos2 >= height-26 || xPos1 <= 25){
   velocityY1 = -velocityY1;
  }
  if(xPos2 >= width-26 || xPos2 <= 25){
   velocityX1 = -velocityX1;
  }  
  //i'm not sure why my red ball doesnt go all the way to the top of the frame
  fill(255, 0, 0);
  ellipse (xPos2, yPos2, dia1, dia1);
//println("velocityX: "+velocityX+" velocityY: "+velocityY);

}


