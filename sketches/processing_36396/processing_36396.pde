
public class Ball{
  //Feilds
  public float x;
  public float y;
  public float dirX;
  public float dirY;
  public float bSize;
  
  //Constructor
  Ball(float xPos, float yPos, float xDir, float yDir, float ballSize){ 
    x = xPos;
    y = yPos;
    dirX = xDir;
    dirY = yDir;
    bSize = ballSize;
    display();
  }
  
  //Moves Ball to new Position
  public void move(Ball current, float xPos, float yPos){
    x = xPos;
    y = yPos;
    if((y + (bSize/2) >= height || y - (bSize/2) <= 0) && (dirY > 10 || dirY < -10) && bSize >= 40) split(current);
    if((x + (bSize/2) >= width || x - (bSize/2) <= 0) && (dirX > 10 || dirX < -10) && bSize >= 40) split(current);
    if(y + (bSize/2) >= height || y - (bSize/2) <= 0) dirY *= -1.1;
    if(x + (bSize/2) >= width || x - (bSize/2) <= 0) dirX *= -1;
    if(y > height - bSize/2) y = height - bSize/2;
    display();
  }
  
  //Changes the Direction and Speed the Ball travels at 
  public void direction(float xDir, float yDir){
    dirX = xDir;
    dirY = yDir;
    display();
  }
  
  //Splits Ball into two smaller Balls
  public void split(Ball current){
    x = current.getX();
    y = current.getY();
    dirX = current.getDirX();
    dirY = current.getDirY();
    bSize = current.getWidth();
    pile.remove(current);
    for(int i = 0; i < 15; i++){
      float ran = random(-20, 20);
      pile.add(new Ball(x, y, dirX + ran, dirY - ran, bSize/2));
    }
  }
  
  //Combines two small Balls together
  public Ball combine(Ball current, Ball other){
    float newX = (current.getX() + other.getX()) / 2;
    float newY = (current.getY() + other.getY()) / 2;
    float newDirX = (current.getDirX() + other.getDirX()) / 2;
    float newDirY = (current.getDirY() + other.getDirY()) / 2;
    float newSize = current.getWidth() + other.getWidth()/14;
    pile.remove(current);
    pile.remove(other);
    Ball n = new Ball(newX, newY, newDirX, newDirY, newSize);
    pile.add(n);
    return n;
  }
  
  //Returns true if contact is made between two Balls
  public boolean contact(Ball other){
    return dist(other.getX(), other.getY(), x, y) < (other.getWidth()/2 + bSize/2);
  }
  
  //Returns distance between to two Balls
  public float distance(Ball other){
    return ((other.getWidth()/2 + bSize/2) - dist(other.getX(), other.getY(), x, y));
  }
  
  //Draws a Ball
  public void display(){
    stroke(0);
    fill(((bSize - 25) * 3) + 108);
    if(bSize > 50) bSize = 50;
    ellipse(x, y, bSize, bSize);
  }
  
  //Returns X
  public float getX(){
    return x;
  }
  
  //Returns Y
  public float getY(){
    return y;
  }
  
  //Returns Direction and Speed along X
  public float getDirX(){
    return dirX;
  }
  
  //Returns Direction and Speed along Y
  public float getDirY(){
    return dirY;
  }
  
  //Returns Ball Size
  public float getWidth(){
    return bSize;
  }
}

