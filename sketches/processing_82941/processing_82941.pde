
abstract class GameElement {
  protected int elementX, elementY;           // element coordinates
  protected int elementWidth, elementHeight; // element size
  protected String event = "";
  
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
   * This method checks whether the element collides with another element
   * 
   * @param otherElement Element for which is checked the collision
   */
  public boolean checkCollision(GameElement otherElement){
    if(
        (
          elementX + elementWidth/2 > otherElement.getElementX() - otherElement.getElementWidth() / 2 && elementX + elementWidth / 2 < otherElement.getElementX() + otherElement.getElementWidth() / 2
          ||
          elementX - elementWidth/2 < otherElement.getElementX() + otherElement.getElementWidth() / 2 && elementX - elementWidth / 2 > otherElement.getElementX() - otherElement.getElementWidth() / 2
        )
        &&
        (
          elementY + elementHeight/2 > otherElement.getElementY() - otherElement.getElementHeight() / 2 && elementY + elementHeight / 2 < otherElement.getElementY() + otherElement.getElementHeight() / 2
          ||
          elementY - elementHeight/2 < otherElement.getElementY() + otherElement.getElementHeight() / 2 && elementY - elementHeight / 2 > otherElement.getElementY() - otherElement.getElementHeight() / 2
        )
    )
      return true;
    else
      return false;
  }
  
  public void update(String event){
    this.event = event;    
  }
  
  abstract public void draw();

}

class Asteroid extends GameElement {
  /** 
   * Class constructor
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
  
  public void draw() {
    stroke(255);
    fill(150, 75, 0);
    ellipse(elementX, elementY++, elementWidth, elementHeight);
  }
}

class Bullet extends GameElement {
  /** 
   * Class constructor
   */  
  public Bullet(int coordinateX, int coordinateY) {
    elementX = coordinateX;
    elementY = coordinateY;
    elementWidth = 4;
    elementHeight = 4;
  }
  /** 
   * This method draws the bullet
   */  
  public void draw() {
    stroke(255,0,0);
    fill(255, 255, 0);
    elementY = elementY - 5; // moves the bullet upwards
    ellipse(elementX, elementY, elementWidth, elementHeight);
  }
}
class Cannon extends GameElement {
  
  private ArrayList<Bullet> bullets; // stored fired bullets 
  
  /** 
   * Class constructor
   */
  public Cannon() {
    bullets = new ArrayList<Bullet>();
    elementX = 6;
    elementY = 10;
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
   * This method draws the cannon
   */
  public void draw() {
    fill(0,0,255);
    rect(elementX - elementWidth / 2, elementY, elementWidth, elementHeight);
    
    // if mouse pressed fires a new bullet
    if(event.equals("mousePressed")) {
      bullets.add(new Bullet(elementX, elementY));
      event = "";
    }
  }
}
class GameController {
  // background image
  private PImage backg;
  
  // size of the game window
  private int windowWidth, windowHeight;

  // Game elements
  private SpaceShip ship;
  private Cannon shipLeftCannon;
  private Cannon shipRightCannon;
  private ArrayList<Asteroid> asteroids;  
  
  private int rand(int min, int max){
    return int(random(max)) + min;
  }
  
  /** 
   * Class constructor
   */
  public GameController(){
    windowWidth = 300;
    windowHeight = 400;
    size(windowWidth,windowHeight);
    smooth();
    //backg = loadImage("background.png");

    // Creates the spaceship and engages the cannons
    ship = new SpaceShip();
    shipLeftCannon = new Cannon();
    shipRightCannon = new Cannon();
    ship.addLeftCannon(shipLeftCannon);
    ship.addRightCannon(shipRightCannon);
    
    // Create the asteroids
    asteroids = new ArrayList<Asteroid>();
    asteroids.add(new Asteroid(rand(20, windowWidth - 20), -10));
    asteroids.add(new Asteroid(rand(20, windowWidth - 20), -60));
    asteroids.add(new Asteroid(rand(20, windowWidth - 20), -110));
    asteroids.add(new Asteroid(rand(20, windowWidth - 20), -160));
    asteroids.add(new Asteroid(rand(20, windowWidth - 20), -210));
  }
  
  public void play(){

    List<Bullet> bullets;

    background(0 /*backg*/);
    
    ship.draw();

    bullets = shipLeftCannon.getBullets();
    checkBullets(bullets);
    
    bullets = shipRightCannon.getBullets();
    checkBullets(bullets);

    for(int i = 0; i < 5; i++)
      asteroids.get(i).draw();
    
    if(end()) {
        background(0);
        noLoop();
    }
  }
  
  private void checkBullets(List<Bullet> bullets){
    int countBullets = bullets.size(); 

    for(int i = countBullets - 1; i >= 0 ; i--) {
      Bullet bullet = bullets.get(i); 
      bullet.draw();
      for(int j = 0; j < 5; j++){
        Asteroid asteroid = asteroids.get(j);
        if(bullet.getElementY() < 0) 
            bullets.remove(bullet);
        else if(bullet.checkCollision(asteroid)) {
            asteroid.setElementX(rand(20, windowWidth - 20));
            asteroid.setElementY(-40);
            bullets.remove(bullets);
        }
      }
    }
  }
  
  public void notify(String event) {
    ship.update(event);
    shipLeftCannon.update(event);
    shipRightCannon.update(event);
    for(int i = 0; i < 5; i++)
      asteroids.get(i).update(event);
  }
  
  private boolean end()
  {
    for (int i=0; i< asteroids.size(); i++)
      if(asteroids.get(i).getElementY()>windowHeight)
        return true;

    return false;
  }

}


class SpaceShip extends GameElement {
  private Cannon leftCannon;  
  private Cannon rightCannon;  

  /** 
   * Class constructor
   */
  public SpaceShip () {
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
   * This method draws the ship and the cannons
   */
  public void draw() {
    // draws the ship
    fill(color(224));
    stroke(120);
    triangle(elementX-elementWidth/2, height - 20, elementX+elementWidth/2, height - 20, elementX, height - 20 - elementHeight);
    
    // draws the left cannon if there
    if(leftCannon != null){
      
      leftCannon.setElementX(elementX-elementWidth/2);
      leftCannon.setElementY(height - 20 - elementHeight/2);
      
      leftCannon.draw();
    }

    // draws the right cannon if there
    if(rightCannon != null){
      
      rightCannon.setElementX(elementX+elementWidth/2);
      rightCannon.setElementY(height - 20 - elementHeight/2);
      
      rightCannon.draw();
    }

  }
  
  public void update(String event){
    super.update(event);
    
    // moves the ship
    if(mouseX < elementWidth / 2)
      elementX = elementWidth / 2;
    else if(mouseX > width - elementWidth / 2)
      elementX = width - elementWidth / 2; 
    else
      elementX = mouseX;
  }
}

GameController controller;  
 
 
  void setup()
  {
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
