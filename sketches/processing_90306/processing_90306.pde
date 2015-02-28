
int incX;
int incposX;
int incY;
int incposY;
int X;
int Y;
int posX;
int posY;

//-----------
void setup(){
  size(640, 480);
  background(255, 0, 255);
  posX = 0+75;
  posY = 0+75;
  X = 640-75;
  Y = 480-75;
  noCursor();
  incX = 1;
  incposX = 1;
  incY = 1;
  incposY = 1;
  
}


//-------------
void draw(){
  noStroke();
  fill(255, 0, 255, 75);
  rect(0, 0, width, height);
  ellipseMode(CORNER);
  fill(255, 0, 255);
  stroke(127);
  ellipse((X-50), (Y)-50, 100, 100);
  stroke(12);
  line(X, Y, mouseX, mouseY);
  stroke(127);
  ellipse((posX-50), (posY)-50,  100, 100);
  stroke(227, 62, 62);
  line(posX, posY, mouseX, mouseY);
  //posY++;
  //Y++;
  //posX++;
  //X++;
  X = X + incX;
  posX = posX + incposX;
  posY = posY + incposY;
  Y = Y + incY;
  //posX = posX % width;
  //X = X % width;
  println(posX);
  if(posX < 0){
    incposX = incposX * -1;
    
    
  }
  if(posX > width){
    incposX = incposX * -1;
    
    }
  if(X < 0){
    incX = incX * -1;
    
    
    
    }
  if(X > width){
    incX = incX * -1;
    
    
    }
  //if(posY > width){
    if(posY < 0){
    incposY = incposY * -1;
    
    
  }
  if(posY > height){
    incposY = incposY * -1;
    
    }
  if(Y < 0){
    incY = incY * -1;
    
    
    
    }
  if(Y > height){
    incY = incY * -1;
    
    
    }  
    
    
    //}
}


