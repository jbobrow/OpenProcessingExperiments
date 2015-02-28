
GameController controller;  

void setup()
{
  size(300, 400);
  smooth();

  controller = new GameController();
}
  
void draw()
{
  background(0);
  controller.play();
}
  
void mousePressed()
{
  controller.notify("mousePressed");
}

void mouseMoved()
{
  controller.notify("mouseMoved");
}

void keyPressed()
{
  controller.notify("keyPressed");
}

class Ball extends GameElement {
  private float dX;
  private float dY;
  
  public Ball(int coordinateX, int coordinateY) {
    elementX = coordinateX;
    elementY = coordinateY;
    elementWidth = 20;
    elementHeight = 20;
    dX = 2;
    dY = -4;
  }
  
  public void draw(){
    ellipseMode(CORNERS);
    fill(255, 0, 0);       // colore della pallina
    ellipse(elementX, elementY, elementX+elementWidth, elementY+elementHeight); // disegna la pallina  
    
    // Bounces on margin top collision
    if (elementX + elementWidth + dX  > width || elementX + dX < 0)
      dX = -dX;
     
    // Bounces on margin top collision
    if (elementY + dY < 0)
      dY = -dY;
      
    // moves the ball
    elementX += dX;
    elementY += dY;
  }
  
  public void bounceY(){
   dY = -dY;
  }
  public void bounceX(){
   dX = -dX;
  } 
  
}
class Brick extends GameElement {
  private int strength;
  
  public Brick(int strength) {
    this.strength = strength;
  }
  
  public void draw(){
    // brick color
    switch(strength) {
      case 2: fill(220); break; 
      case 3: fill(150); break; 
      default: fill(0, 255, 0); 
    }
           
    rect(elementX, elementY , elementWidth, elementHeight);
  }
  
  public int getStrength(){
    return strength;
  }
  
  public void setStrength(int strength){
    this.strength = strength;
  }

  public boolean isBroken(){
    return strength == 0;
  }

  public void executeAction(){
    strength--;
    if(isBroken())
      super.executeAction();
  }
  
}
class GameAction<T> {
    
    public void execute(){
    }
    
}
class GameController {
  private Racket racket;
  private Wall wall;
  private Ball ball;
  private boolean gameOver;
  private String resultMessage;
  private String restartMessage;


  public GameController(){
    restartMessage = "Press the mouse button to restart";
    start();
  }
  
  public void start(){
    int bricksRows = 10;
    int bricksColumns = 10;
    racket = new Racket();
    wall = new Wall(); // create the wall with 10 rows and 10 columns
    for (int i=0; i < bricksRows; i++) 
      for (int j=0; j < bricksColumns; j++){
        int brickStrength = (int) random(1,4);
        Brick brick = new Brick(brickStrength);
        brick.setElementX(j * (width / bricksColumns));
        brick.setElementY(i * 20);
        brick.setElementWidth(width / bricksColumns);
        brick.setElementHeight(20);
        // TODO: set action when brick is broken
        //brick.setAction(new GameAction<GameController>(){
        //    public void execute(){
        //      
        //    }
        //});
        wall.addBrick(brick);
    }

    
    ball = new Ball((int)random(20, width - 30), height - racket.getElementWidth());
    gameOver = false;
  }

  public void end(){
    if(!wall.hasBricks())
      resultMessage = "You win";
    else
      resultMessage = "You lose";
             
    gameOver = true;
  }  

  public void play(){
    if(!gameOver) {
      ball.draw();
      racket.draw();
      wall.draw();

      if (racket.checkFrontalCollision(ball) || wall.checkFrontalCollision(ball))
        ball.bounceY();
      else if (racket.checkLateralCollision(ball) || wall.checkLateralCollision(ball))
        ball.bounceX();

      if (!wall.hasBricks() || ball.getElementY() > height)
        end();
    }
    else {
      fill(255);
      textSize(26);
      text(resultMessage, (width - textWidth(resultMessage))/2, (height - 26)/2);
      textSize(14);
      text(restartMessage, (width - textWidth(restartMessage))/2, (height + 40)/2);
    }
    
  }

  public void notify(String event){
    if(gameOver) {
      if(event=="mousePressed")
         start();           
    }  
    else {
      ball.update(event);
      racket.update(event);
      wall.update(event);
    }
  }  
}

abstract class GameElement {
  protected int elementX, elementY;           // element coordinates
  protected int elementWidth, elementHeight; // element size
  protected String event = "";
  private GameAction action; 
  

  public void setAction(GameAction action){
    this.action = action;
  }  
  
  public void executeAction(){
    if(action != null)
      action.execute();
  }

 
 /**
  * Getter method. Returns the x coordinate of the element. 
  * 
  * @return elementX 
  */  
  public int getElementX(){
    return elementX;
  }
 /**
  * Getter method. Returns the y coordinate of the element. 
  * 
  * @return elementY 
  */  
  public int getElementY(){
    return elementY;
  }
 /**
  * Getter method. Returns the width of the element. 
  * 
  * @return elementWidth 
  */  
  public int getElementWidth(){
    return elementWidth;
  }
 /**
  * Getter method. Returns the height of the element. 
  * 
  * @return elementHeight 
  */  
  public int getElementHeight(){
    return elementHeight;
  }
 /**
  * Getter method. Returns the lefmost x. 
  * 
  * @return leftmost x 
  */  
  public int getLeftmostX(){
    return elementX;
  }
 /**
 1 * Getter method. Returns the rightmost x. 
  * 
  * @return rightmost x 
  */  
  public int getRightmostX(){
    return elementX + elementWidth;
  }
  /**
  * Getter method. Returns higher y. 
  * 
  * @return higher y 
  */  
  public int getHigherY(){
    return elementY;
  }
  /**
  * Getter method. Returns higher y. 
  * 
  * @return higher y 
  */  
  public int getLowerY(){
    return elementY + elementHeight;
  }

  /**
   * Setter method. Sets the x coordinate of the element.
   * 
   * @param coordinateX x coordinate to set
   */
  public void setElementX(int coordinateX){
    elementX = coordinateX;
  }
  /**
   * Setter method. Sets the y coordinate of the element.
   * 
   * @param coordinateY y coordinate to set
   */
  public void setElementY(int coordinateY){
    elementY = coordinateY;
  }

  /**
   * Setter method. Sets the width of the element.
   * 
   * @param width Width to set
   */
  public void setElementWidth(int width){
    elementWidth = width;
  }
  /**
   * Setter method. Sets the y coordinate of the element.
   * 
   * @param coordinateY y coordinate to set
   */
  public void setElementHeight(int height){
    elementHeight = height;
  }

  /**
   * This method checks whether the element collides with another element
   * 
   * @param otherElement Element for which is checked the collision
   */
  public boolean checkFrontalCollision(GameElement otherElement){
    if(
        (
          ( getLeftmostX() >= otherElement.getLeftmostX() && getLeftmostX()  <= otherElement.getRightmostX() )
          ||
          ( otherElement.getLeftmostX() >= getLeftmostX()  &&  otherElement.getLeftmostX() <= getRightmostX() )
        )
        &&
        (
          (getHigherY() - 1 <= otherElement.getLowerY() && getHigherY() + 2  > otherElement.getLowerY())
          ||
          (getLowerY() + 1 >= otherElement.getHigherY() && getLowerY() - 2 < otherElement.getHigherY() )
        )
    ){
      executeAction();
      return true;
    }
    else
      return false;
  }
  
  public boolean checkLateralCollision(GameElement otherElement){
    if(
        (
          ( getLeftmostX() - 1 <= otherElement.getRightmostX() && getLeftmostX() + 2 > otherElement.getRightmostX())
          ||
          ( getRightmostX() + 1 >= otherElement.getLeftmostX() &&  getRightmostX() - 2 < otherElement.getLeftmostX() )
        )
        &&
        (
          (getHigherY() >= otherElement.getHigherY() && getHigherY()  <= otherElement.getLowerY())
          ||
          (otherElement.getHigherY() >= getHigherY() && otherElement.getHigherY() <= getLowerY())
        )
    ){
      executeAction();
      return true;
    }
    else
      return false;
  }

  public void update(String event){
    this.event = event;    
  }
  
  abstract public void draw();

}
class Racket extends GameElement {
  private int elementDx = 5;
  
  public Racket(){
    elementWidth = width / 4;
    elementHeight = 20;
    elementX = width / 2 - elementWidth / 2;
    elementY = height - elementHeight;
  }
  
  /** 
   * This method draws the racket
   */
  public void draw() {
    fill(0, 0, 255);       
    rect(elementX, elementY, elementWidth, elementHeight);
  }
 
  public void update(String event){
    super.update(event);
    
    if(event == "keyPressed")
      keyPressed();
    else if(event == "mouseMoved")
      mouseMoved();
  }
  
  /** 
   * This method moves the racket left/right on left/right key pressesd
   */
  void keyPressed(){
    if (key == CODED) {
      if (keyCode == RIGHT && elementX + elementWidth < width)  {
        elementX += elementDx;
      } else if (keyCode == LEFT && elementX > 0) {
        elementX -= elementDx;
      } 
    }
  }

  /** 
   * This method moves the racket on mouse moved
   */
  void mouseMoved(){
   // if(mouseY > height - 2 * elementHeight )
      elementX = mouseX - elementWidth / 2;
    
    if (elementX <0) 
      elementX = 0;
    else if(elementX + elementWidth > width)
      elementX = width - elementWidth;
  }
}
class Wall extends GameElement {
  private ArrayList<Brick> bricks;
  
  public Wall(){
    bricks = new ArrayList<Brick>();
  }
  
  public void addBrick(Brick brick) {
    bricks.add(brick);
  }
  
  public void draw(){
    Brick brick;
    int bricksCounter = bricks.size();
    int i = 0;
    while(i < bricksCounter) {
      brick = bricks.get(i);
      brick.draw();
      i++;
    }
  }

  /**
   * This method checks whether the element collides with another element
   * 
   * @param otherElement Element for which is checked the collision
   */
  public boolean checkFrontalCollision(GameElement otherElement){
    boolean hit = false;
    Brick brick;
    int bricksCounter = bricks.size();
    int i = 0;

    while(i < bricksCounter && !hit) {
      brick = bricks.get(i);
      if(brick.checkFrontalCollision(otherElement)){
        if (brick.isBroken()){
          bricks.remove(brick);
        }
        hit = true;
      };
      i++;
    }
        
     return hit;
  }
  
  public boolean checkLateralCollision(GameElement otherElement){
    boolean hit = false;
    Brick brick;
    int bricksCounter = bricks.size();
    int i = 0;

    while(i < bricksCounter && !hit) {
      brick = bricks.get(i);
      if(brick.checkLateralCollision(otherElement)){
        if (brick.isBroken())
          bricks.remove(brick);
        
        hit = true;
      };
      i++;
    }
        
     return hit;
  }

  public boolean hasBricks(){
    return bricks.size() > 0;
  }
  
}


