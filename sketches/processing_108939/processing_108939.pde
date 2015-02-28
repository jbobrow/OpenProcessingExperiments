
float posX,posY,posX1,posY1,posX2,posY2;
float incX,incY,incX1,incY1,incX2,incY2;
//------
void setup() {
  size(600, 400);


  posX = random(0, width);
  posY = random(0, height);
  posX1 = random(0, width);
  posY1 = random(0, height);
  posX2 = random(0, width);
  posY2 = random(0, height);
  incY = 1;
  incX = 1;
  incY1 = 1;
  incX1 = 1;
  incY2 = 1;
  incX2 = 1;
}

//----------

void draw() {

  fill(255, 5);
  noStroke();
  rect(0, 0, width, height);

  fill(posX%255, posY%200, (posY*2)%150,200);
  ellipse(posX, posY, 20, 20);

  posX=posX+incX+incX;
  posY=posY+incY+incY;

  if (posX>width) {
    posX=width;
    incX=incX*-1;
  }
  if (posX<0) {
    posX=0;
    incX=incX*-1;
  } 
  if (posY>height) {
    posY=height;
    incY=incY*-1;
  } 
  if (posY<0) {
    posY=0;
    incY=incY*-1;
  }

  fill(posX1%200, posY1%255, (posY1*2)%200,150);
  ellipse(posX1, posY1, 20, 20);

  posX1=posX1+incX1+incX1;
  posY1=posY1+incY1+incY1;

  if (posX1>width) {
    posX1=width;
    incX1=incX1*-1;
  }
  if (posX1<0) {
    posX1=0;
    incX1=incX1*-1;
  } 
  if (posY1>height) {
    posY1=height;
    incY1=incY1*-1;
  } 
  if (posY1<0) {
    posY1=0;
    incY1=incY1*-1;
    
  }
  
  
  
  
  

  fill(posX2%255, posY2%200, (posY2*2)%250,15);
  ellipse(posX2, posY2, 20, 20);

  posX2=posX2+incX2+incX2;
  posY2=posY2+incY2+incY2;

  if (posX2>width) {
    posX2=width;
    incX2=incX2*-1;
  }
  if (posX2<0) {
    posX2=0;
    incX2=incX2*-1;
  } 
  if (posY2>height) {
    posY2=height;
    incY2=incY2*-1;
  } 
  if (posY2<0) {
    posY2=0;
    incY2=incY2*-1;
    
  }
  
  
  
  beginShape();
  fill(0, posY%255, posX%255,35);
vertex(posX, posY);

vertex(posX1, posY1);

vertex(posX2, posY2);
endShape();
stroke(0, posY%255, posX%255,35);
line(posX,posY,mouseX,mouseY);
line(posX1,posY1,mouseX,mouseY);
line(posX2,posY2,mouseX,mouseY);  

}

  
  
  


