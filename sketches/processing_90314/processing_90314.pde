
int posX;
int posY;
int posX2;
int posY2;
int incX;
int incX2;
int incY2;
int b = 0;
int incb = 1;


//-------------
void setup(){
  size(500, 500);
  background(229, 250, 200);
  
  posX = 100;
  posY = 200;
  posX2 = 450;
  posY2 = 390;
  incX = 1;
  incX2 = 1;
  incY2 = 2;
  incb = 1;
  
}


//------------
void draw(){
  
  //background(229, 250, 200);
  noStroke();
  fill(229, 250, 200, 10);
  rect(0,0, width, height);
  
  fill(80, 124, 80);
  ellipse(posX, posY, 50, 50);
  
  stroke(127);
  line(posX, posY, mouseX, mouseY);
  
  fill(200,100,b);
  ellipse(posX2, posY2, 100,150);
  
  stroke(200,150,b);
  line(posX2, posY2, mouseX, mouseY);
  
    // =>  posX++;
  //posX = posX + 1;
  //posX = posX % width;
  
  posX = posX + incX;
  
  if(posX < 0){
    incX = incX * -1;
  }
  
  if(posX > width){
    incX = incX * -1;
  }
  
  posX2 = posX2 + incX2;
  
  if(posX2 < 0){
    incX2 = incX2 * -1;
  }
  
  if(posX2 > width){
    incX2 = incX2 * -1;
  }
  
  posY2 = posY2 + incY2;
  
  if(posY2 < 0){
    incY2 = incY2 * -1;
  }
  
  if(posY2 > height){
    incY2 = incY2 * -1;
  }
 
  b = b + incb;
  
  if(b < 0){
    incb = incb * -1;
  }
  
  if(b > 255){
    incb = incb * -1;
  }
  
  println(posX);

}
