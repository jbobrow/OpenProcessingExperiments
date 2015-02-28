
 
  GameController controller;  
 
 
  void setup()
  {
    size(300, 400);
    smooth();

    controller = new GameController();
  }
  
  void draw()
  {
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

 
  
  


class Asteroid extends GameElement {
  /** 
   * Constructor
   *
   * @param coordinateX initial x coordinate
   * @param coordinateY initial y coordinate
   */  
  public Asteroid(int coordinateX, int coordinateY) {
    elementX = coordinateX;
    elementY = coordinateY;
    elementWidth = 20;
    elementHeight = 20;
  }
  
  /** 
   * Implements the abstract method draw()
   */   
   public void draw() {
    // draws the asteorid
    ellipseMode(CORNERS);
    stroke(255,0,0);
    fill(150, 75, 0);
    ellipse(elementX, elementY, elementX + elementWidth, elementY + elementHeight);
    
    // moves the asteroid
    elementY++;
  }
}

class Bullet extends GameElement {
  /** 
   * Constructor
   */  
  public Bullet(int coordinateX, int coordinateY) {
    elementX = coordinateX;
    elementY = coordinateY;
    elementWidth = 4;
    elementHeight = 4;
  }
  /** 
   * This method draws the bullet.
   * Implements the abstract method draw();
   */  
  public void draw() {
    // draws the bullet
    ellipseMode(CORNERS);
    stroke(255,0,0);
    fill(255, 255, 0);
    ellipse(elementX, elementY, elementX + elementWidth, elementY + elementHeight);
    
    // moves the bullet upwards
    elementY = elementY - 5; 
  }
}
class Cannon extends GameElement {
  
  private ArrayList<Bullet> bullets; // stored fired bullets 
  
  /** 
   * Constructor
   */
  public Cannon() {
    bullets = new ArrayList<Bullet>();
    elementWidth = 4;
    elementHeight = 4;
  }

  /**
   * Getter method. Returns fired bullets list 
   * 
   * @return bullets 
   */  
  public ArrayList<Bullet> getBullets() {
    return bullets;
  }
  
  /** 
   * This method draws the cannon.
   * Implements the abstract method draw()
   */
  public void draw() {
    int bulletsCounter = bullets.size(); 

    fill(224);
    stroke(120);
    rect(elementX - elementWidth / 2, elementY, elementWidth, elementHeight);
    
    for(int i = bulletsCounter - 1; i >= 0 ; i--) {
      Bullet bullet = bullets.get(i); 
      if(bullet.getElementY() < 0) 
        bullets.remove(bullet);
      bullet.draw();
    }
  }
  
  public boolean hitTheTarget(GameElement target) {
    boolean hit = false;
    int bulletsCounter = bullets.size(); 

    for(int i = bulletsCounter - 1; i >= 0 && !hit ; i--) {
      Bullet bullet = bullets.get(i); 
        
      if(bullet.checkCollision(target)) {
        bullets.remove(bullet);
        hit = true;
      }
    }
    return hit;
  }
  
  public ArrayList targetHit(ArrayList targets) {
    ArrayList hit = new ArrayList();
    int targetsCounter = targets.size(); 
    for(int i = 0; i < targetsCounter; i++) {
      GameElement target = (GameElement) targets.get(i); 
      if(hitTheTarget(target))
        hit.add(target);
    }
    return hit;
  }
  
  public void update(String event){
    super.update(event);    
    // if mouse pressed fires a new bullet
    if(event.equals("mousePressed")) {
      bullets.add(new Bullet(elementX, elementY-5));
    }
  }

}
class GameAction<T> {
    
    public void execute(){
    }
    
}
class GameController {
  // Game elements
  private GameRectangle scoreRectangle;  
  private SpaceShip ship;
  private Cannon shipLeftCannon;
  private Cannon shipRightCannon;
  private ArrayList<Asteroid> asteroids;  
  private int asteroidsCounter; 
  private boolean gameOver;
  private boolean gameStarted;  
  private String resultMessage;
  private String startMessage;
  private String restartMessage;  
 
  /** 
   * Constructor
   */
  public GameController(){
    scoreRectangle = new GameRectangle(0, 0, width, 30, color(224));
    startMessage = "Press the mouse button to start\n\nuse the mouse to move the ship\n\n click the mouse button to fire";
    restartMessage = "Press the mouse button to restart";
    gameOver = true;
    gameStarted = false;
  }
  
  public void start() {  
    asteroidsCounter = 100; // number of asteroids to destroy
    
    // Creates the spaceship and engages the cannons
    ship = new SpaceShip(width/2, height - 20);
    shipLeftCannon = new Cannon();
    shipRightCannon = new Cannon();
    ship.addLeftCannon(shipLeftCannon);
    ship.addRightCannon(shipRightCannon);
    
    // Initially creates five asteroids
    asteroids = new ArrayList<Asteroid>();
    for(int i = 0; i < 5; i ++) {
      int coordinateX = (int) random(20, width - 20);
      int coordinateY = -50*i;
      asteroids.add(new Asteroid(coordinateX, coordinateY));
    }
    gameOver = false;
    gameStarted = true;
  }
  
  private void end(){
    if(asteroids.size() > 0)
      resultMessage = "You lose";
    else
      resultMessage = "You win";
             
    gameOver = true;
  } 
  
  private void showStartMessage(){
      fill(255);
      textSize(14);
      text(startMessage, (width - textWidth(startMessage))/2, (height - 28)/2);
  } 

  private void showResult(){
      fill(255);
      textSize(26);
      text(resultMessage, (width - textWidth(resultMessage))/2, (height - 26)/2);
      textSize(14);
      text(restartMessage, (width - textWidth(restartMessage))/2, (height + 40)/2);
  } 
  
  public void play(){
    background(0);

    if(!gameOver) {

      ArrayList asteroidHit;

      ship.draw();
     
      asteroidHit = shipLeftCannon.targetHit(asteroids);
      replaceAsteroidHit(asteroidHit);
      asteroidHit = shipRightCannon.targetHit(asteroids);
      replaceAsteroidHit(asteroidHit);
      
      if (asteroids.size() == 0)
        end();
      else {
        for(int i = 0; i < asteroids.size(); i++) {
          Asteroid asteroid = asteroids.get(i);   
      
          if(asteroid.getElementY()>height || asteroid.checkCollision(ship))
            end();
          else 
            asteroid.draw();
        }
      }
      // shows remaining asteroids
      scoreRectangle.draw();
      stroke(255,0,0);
      fill(150, 75, 0);
      ellipse(10, 10, 20, 20);
      fill(0);
      textSize(10);
      text(asteroidsCounter, 30, 20);
    }
    else {
      if (gameStarted)
        showResult();
      else
        showStartMessage();
    } 
  }
  
  private void replaceAsteroidHit(ArrayList hit) {
    if(hit != null) {
      for(int i = 0; i < hit.size(); i++) {
        Asteroid asteroid = (Asteroid) hit.get(i);
        asteroids.remove(asteroid);
        asteroidsCounter--;
        if(asteroidsCounter > 0) {
          int coordinateX = (int) random(20, width - 20);
          int coordinateY = -50*i - 100;
          asteroids.add(new Asteroid(coordinateX, coordinateY));        
        }
      }  
    }  
  }
  
  public void notify(String event) {
    if(gameOver && event=="mousePressed")
      start();           
    else if(gameStarted)
      ship.update(event);
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
  public boolean checkCollision(GameElement otherElement){
    if(
        (
          ( getLeftmostX() >= otherElement.getLeftmostX() && getLeftmostX()  <= otherElement.getRightmostX() )
          ||
          ( otherElement.getLeftmostX() >= getLeftmostX()  &&  otherElement.getLeftmostX() <= getRightmostX() )
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
class GameRectangle extends GameElement {
  private color elementColor;
  
  public GameRectangle (int leftTopX, int leftTopY, int gameWidth, int gameHeight, color fill){
    elementX = leftTopX;
    elementY = leftTopY;
    elementWidth = gameWidth;
    elementHeight = gameHeight;
    elementColor = fill;
  }
  
  public void draw(){
    fill(elementColor);
    rect(elementX, elementY, elementWidth, elementHeight);
  }

}
class SpaceShip extends GameElement {
  private Cannon leftCannon;  
  private Cannon rightCannon;  

  /** 
   * Constructor
   */
  public SpaceShip (int startX, int startY) {
    elementX = startX;
    elementY = startY;
    elementWidth = 20;
    elementHeight = 35;
  }
  
  /**
   * This method anchors the left cannon to the ship
   * @param cannon The cannon to be anchored
   */
  public void addLeftCannon(Cannon cannon){
    leftCannon = cannon;
  }
  
  /**
   * This method anchors the right cannon to the ship
   * @param cannon The cannon to be anchored
   */
  public void addRightCannon(Cannon cannon){
    rightCannon = cannon;
  }

  /**
   * This method draws the ship and its cannons
   */
  public void draw() {
    // draws the ship
    fill(224);
    stroke(120);
    triangle(elementX-elementWidth/2, elementY, elementX+elementWidth/2, elementY, elementX, elementY - elementHeight);
    
    // draws the left cannon if there
    if(leftCannon != null){
      
      leftCannon.setElementX(elementX-elementWidth/2);
      leftCannon.setElementY(elementY - elementHeight/2);
      
      leftCannon.draw();
    }

    // draws the right cannon if there
    if(rightCannon != null){
      
      rightCannon.setElementX(elementX+elementWidth/2);
      rightCannon.setElementY(elementY - elementHeight/2);
      
      rightCannon.draw();
    }

  }
  /*
   * This method is overridden to move the ship and update the cannons
   *
   */  
  public void update(String event){
    super.update(event);
    
    if(leftCannon != null)
      leftCannon.update(event);
    if(rightCannon != null)
      rightCannon.update(event);
    
    // moves the ship
    if(mouseX < elementWidth / 2)
      elementX = elementWidth / 2;
    else if(mouseX > width - elementWidth / 2)
      elementX = width - elementWidth / 2; 
    else
      elementX = mouseX;
  }
  
 /**
  * This method is overridden. 
  * 
  * @return leftmost x 
  */  
  public int getLeftmostX(){
    return elementX - elementWidth / 2;
  }
 /**
  * This method is overridden. 
  * 
  * @return rightmost x 
  */  
  public int getRightmostX(){
    return elementX + elementWidth/2;
  }
  /**
  * This method is overridden 
  * 
  * @return higher y 
  */  
  public int getHigherY(){
    return elementY - (int) (elementHeight/1.5);
  }
  /**
  * This method is overridden 
  * 
  * @return higher y 
  */  
  public int getLowerY(){
    return elementY;
  }

  
}


