
class Score{
  int x;
  int y;
  int score;
  
  Score(int xPos, int yPos){
    
    x = xPos;
    y = yPos;  
}

void display(){
  text("Score: "+ score, x, y);
}
}
                
                
