
class SnakePart{
   
  int x,y;
   
  SnakePart(int newX, int newY){
    x = newX;
    y = newY;
  }
   
  void display(){
    fill(255);
    ellipseMode(CORNER);
    ellipse(x,y,GRIDSIZE,GRIDSIZE);  
  }
}

