
int big = 8;
int numSquare;
Squizuare[ ] s;

void setup(){  
  
  size(512, 512);
  
  /** initialize array **/
  numSquare = (int) sq(width/big);
  s = new Squizuare[numSquare];
  
  int i = 0;
  for(int x = 0; x < width; x+=big){
    for(int y = 0; y < height; y+=big){
      
       s[i] = new Squizuare(x,y,big);
       i++;
    } 
  } 
  
  background(0);
}


Squizuare square;
void draw(){

  for(int i = 0; i < numSquare; i++){
    
    square = s[i];
    if(contains(square.getX(), square.getY(), big)){
      
       square.wakeUp(); 
    }
      square.drawSq();
  }
}

/** Check if mouse is inside a square **/
boolean contains(int x, int y, int diff){
  
  if(mouseX >= x && mouseX <= x+diff)
   if(mouseY >= y && mouseY <= y+diff)
      return true;
      
  return false;
}

