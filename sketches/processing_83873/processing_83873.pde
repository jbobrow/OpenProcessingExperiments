
import ddf.minim.*;

Minim minim;
AudioPlayer audioPlayer;


GameController controller;  

void setup()
{
  size(300, 400);
  smooth();
  minim = new Minim(this);
  audioPlayer = minim.loadFile("beep.mp3");

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

class Fruit extends GameElement {
  PImage fruitImage;

  public Fruit(int coordinateX, int coordinateY, int size){
    elementX = coordinateX;
    elementY = coordinateY;
    elementWidth = size;
    elementHeight = size;  
    fruitImage = loadImage( "fruit.png" );
  }
  
  public void draw() {
    //fill(0,255,0);
    //rect(elementX, elementY, elementWidth, elementHeight);
    image(fruitImage, elementX, elementY); 
  }
}
class GameAction<T> {
    
    public void execute(){
    }
    
}


class GameController {
  private PImage fruitImage;
  private GameRectangle snakeRectangle;
  private GameRectangle scoreRectangle;
  private Snake snake;
  private ArrayList<Fruit> fruits; 
  private boolean gameOver;
  private String resultMessage;
  private String startMessage;
  private String restartMessage;
  private boolean gameStarted;
  private int speed;
  
 
  public GameController(){
    fruitImage = loadImage("fruit.png");
    snakeRectangle = new GameRectangle(0, 30, width, height-30, color(50));
    scoreRectangle = new GameRectangle(0, 0, width, 30, color(0));
    startMessage = "Press the mouse button to start\n\n  and use arrow keys to play";
    restartMessage = "Press the mouse button to restart";
    gameOver = true;
    gameStarted = false;
  }
  
  private void start(){
    // create the snake
    int snakeStartX = (int) random(0, width);
    int snakeStartY = (int) random(130, height - 30);
    int snakeStartLenght = 10;
    snakeStartX -= snakeStartX % 10;  //adjusts the x coordinate to a multiple of 10
    snakeStartY -= snakeStartY % 10;  //adjusts the y coordinate to a multiple of 10
    snake = new Snake(snakeStartX, snakeStartY, snakeStartLenght, snakeRectangle);

    // create the fruits list and fills it with 50 fruits 
    fruits = new ArrayList<Fruit>();
    for(int i = 0; i < 50; i++){
      Fruit fruit;
      int fruitX = (int) random(0, width);
      int fruitY = (int) random(30, height - 30);
      int fruitSize = 10;
      fruitX -= fruitX % 10; //adjusts the x coordinate to a multiple of 10 
      fruitY -= fruitY % 10; //adjusts the y coordinate to a multiple of 10 
      fruit = new Fruit(fruitX, fruitY, fruitSize);
      fruit.setAction(new GameAction<GameController>(){
            public void execute(){
              audioPlayer.play();          
            }
       });
      fruits.add(fruit);
    }
    
    gameOver = false;
    gameStarted = true;
    speed = 8;
    frameRate(speed);
  }

  private void end(){
    if(fruits.size() > 0)
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
    Fruit fruit;

    if(!gameOver) {
      scoreRectangle.draw();
      snakeRectangle.draw();
    
      // if there are still  fruit in the list
      if(fruits.size() > 0 && !snake.checkCollision(snake)){
        snake.draw();

        fruit = fruits.get(0);
        if(fruit.checkCollision(snake)) {
          snake.grow();
          fruits.remove(fruit);
          fruit = null;
          // increases speed
          if(fruits.size() % 10 == 0){
            speed = speed + 2; 
            frameRate(speed);
          }
        }

        if(fruit != null)
          fruit.draw();
        
        // shows remaining fruits in score rectangle
        image(fruitImage, 10, 10);
        fill(255);
        textSize(10);
        text(fruits.size(), 30, 20);
        text("Speed: " + speed, 240, 20);
      }
      else
        end();
    }
    else {
      if (gameStarted)
        showResult();
      else
        showStartMessage();
    } 
  }
  
  public void notify(String event){
    if(gameOver && event=="mousePressed")
      start();           
    else if(gameStarted)
      snake.update(event);
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
          elementX >= otherElement.getElementX() && elementX  < otherElement.getElementX() + otherElement.getElementWidth()
          ||
          otherElement.getElementX() >= elementX && otherElement.getElementX() < elementX  + elementWidth
        )
        &&
        (
          elementY >= otherElement.getElementY() && elementY  < otherElement.getElementY() + otherElement.getElementHeight()
          ||
          otherElement.getElementY() >= elementY && otherElement.getElementY() < elementY  + elementHeight
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
class Snake extends GameElement {
  private final int GOLEFT  = 0;
  private final int GODOWN  = 1;
  private final int GORIGHT = 2;
  private final int GOUP    = 3;
  private final int COMPONENT_SIZE = 10;
  
  private int length;
  private int direction;
  private SnakeHead snakeHead;
  private SnakeTail snakeTail;
  private ArrayList<SnakeComponent> components;
  private int shiftX, shiftY;
  private GameRectangle edges;
  
  public Snake(int coordinateX, int coordinateY, int startLength, GameRectangle gameRectangle){
    edges = gameRectangle;
    
    elementX = coordinateX;
    elementY = coordinateY;
    length = startLength;
    direction = (int) random(4); 
   
    setShift();
    
    snakeHead = new SnakeHead(elementX, elementY, direction, COMPONENT_SIZE);
    components = new ArrayList<SnakeComponent>();
    for(int i = 1; i < startLength; i++){
      components.add(new SnakeComponent(elementX - i*shiftX, elementY - i*shiftY, direction, COMPONENT_SIZE));
    }
    snakeTail = new SnakeTail(elementX - startLength*shiftX, elementY - startLength*shiftY, direction, COMPONENT_SIZE);
    
  }
  
  public void draw(){
    SnakeComponent component;
    int componentCounter = components.size();
    int i = 0;

    move();
    snakeHead.draw();
    // draws the components of the snake
    while(i < componentCounter){
      component = components.get(i);
      component.draw();
      i++;
    } 
    snakeTail.draw();
  }

  public void move(){
    SnakeComponent currentComponent, nextComponent;
    int componentCounter = components.size();
    int i = componentCounter - 1;
    // updates the position of the components

    currentComponent = components.get(i);
    snakeTail.setElementX(currentComponent.getElementX());
    snakeTail.setElementY(currentComponent.getElementY());
    snakeTail.setNextDirection(currentComponent.getNextDirection());

    while(i > 0 ){
      currentComponent = components.get(i);
      nextComponent = components.get(i-1);
      currentComponent.setElementX(nextComponent.getElementX());
      currentComponent.setElementY(nextComponent.getElementY());
      currentComponent.setNextDirection(nextComponent.getNextDirection());
      i--;
    } 
    currentComponent = components.get(0);
    currentComponent.setElementX(snakeHead.getElementX());
    currentComponent.setElementY(snakeHead.getElementY());
    currentComponent.setNextDirection(direction);
    
    setShift();
    elementX += shiftX;
    elementY += shiftY;
    if(elementX >= edges.elementX + edges.elementWidth)
      elementX = edges.elementX;
    else if(elementX < edges.elementX)
      elementX = edges.elementX + edges.elementWidth;
      
    if(elementY >= edges.elementY + edges.elementHeight)
      elementY = edges.elementY;
    else if(elementY < edges.elementY)
      elementY = edges.elementY + edges.elementHeight;
      
    snakeHead.setElementX(elementX);  
    snakeHead.setElementY(elementY);    
    snakeHead.setNextDirection(direction);    
  }
  
  public void grow(){
    components.add(new SnakeComponent(COMPONENT_SIZE));
  } 

  private void setShift(){ 
    switch(direction) {
      case 0: // GOLEFT
        shiftX = -COMPONENT_SIZE;
        shiftY = 0;
        break;
      case 1: // GODOWN
        shiftX = 0;
        shiftY = +COMPONENT_SIZE;
        break;
      case 2: // GORIGHT
        shiftX = +COMPONENT_SIZE;
        shiftY = 0;
        break;
      case 3: // GOUP
        shiftX = 0;
        shiftY = -COMPONENT_SIZE;
        break;
    }
  }
 
   /**
   * This method checks whether the element collides with another element
   * 
   * @param otherElement Element for which is checked the collision
   */
  public boolean checkCollision(GameElement otherElement){
    boolean bodyCollision = false;
    boolean tailCollision;
    SnakeComponent component;
    int componentCounter = components.size();
    int i = 1;

    while(i < componentCounter && !bodyCollision) {
      component = components.get(i);
      bodyCollision = component.checkCollision(otherElement);
      i++;
    }
    tailCollision = snakeTail.checkCollision(otherElement);
    return bodyCollision || tailCollision;
  }
    
  public void update(String event){
    super.update(event);
    if(event == "keyPressed")
      keyPressed();
  } 
  
  void keyPressed() {
    if (key == CODED) {
      switch(keyCode) {
        case LEFT:   if (direction != GORIGHT) direction = GOLEFT; break;      
        case DOWN:   if (direction != GOUP) direction = GODOWN; break;      
        case RIGHT:  if (direction != GOLEFT) direction = GORIGHT; break;      
        case UP:     if (direction != GODOWN) direction = GOUP; break;      
      }
    }
  }
}
class SnakeComponent extends GameElement {
  private PImage[][] imageList = new PImage[4][4]; 
  private int currentDirection;
  private int nextDirection;
  
  public SnakeComponent(int size){
    elementWidth = size;
    elementHeight = size;
    setImage();
  }
  
  public SnakeComponent(int coordinateX, int coordinateY, int direction, int size){
    elementX = coordinateX;
    elementY = coordinateY;
    currentDirection = direction;
    nextDirection = direction;
    elementWidth = size;
    elementHeight = size;
    setImage();
  }

  private void setImage(){
    imageList[0][0] = loadImage( "snake-body-left.png" );
    imageList[0][1] = loadImage( "snake-body-left-down.png" );
    imageList[0][2] = loadImage( "snake-body-left.png" );
    imageList[0][3] = loadImage( "snake-body-left-up.png" );
    
    imageList[1][0] = loadImage( "snake-body-down-left.png" );
    imageList[1][1] = loadImage( "snake-body-down.png" );
    imageList[1][2] = loadImage( "snake-body-down-right.png" );
    imageList[1][3] = loadImage( "snake-body-down.png" );

    imageList[2][0] = loadImage( "snake-body-right.png" );
    imageList[2][1] = loadImage( "snake-body-right-down.png" );
    imageList[2][2] = loadImage( "snake-body-right.png" );
    imageList[2][3] = loadImage( "snake-body-right-up.png" );

    imageList[3][0] = loadImage( "snake-body-up-left.png" );
    imageList[3][1] = loadImage( "snake-body-up.png" );
    imageList[3][2] = loadImage( "snake-body-up-right.png" );
    imageList[3][3] = loadImage( "snake-body-up.png" );
  }

  public void setNextDirection(int direction){
    currentDirection = nextDirection;
    nextDirection = direction;
  }
  public int getNextDirection(){
    return nextDirection;
  }
  
  public void draw(){
     image(imageList[currentDirection][nextDirection],elementX, elementY);
  } 
 
}
class SnakeHead extends GameElement {
  PImage imageUp;
  PImage imageDown;
  PImage imageLeft;
  PImage imageRight;
  int currentDirection;
  int nextDirection;
  
  public SnakeHead(int coordinateX, int coordinateY, int direction, int size){
    elementX = coordinateX;
    elementY = coordinateY;
    elementWidth = size;
    elementHeight = size;
    currentDirection = direction;
    nextDirection = direction;
    imageUp = loadImage( "snake-head-up.png" );
    imageDown = loadImage( "snake-head-down.png" );
    imageLeft = loadImage( "snake-head-left.png" );
    imageRight = loadImage( "snake-head-right.png" );
  }
  
  public void setNextDirection(int direction){
    currentDirection = nextDirection;
    nextDirection = direction;
  }

  public int getCurrentDirection(){
    return currentDirection;
  }

  public void draw(){
   switch(currentDirection) {
     case 0: image(imageLeft,elementX, elementY);break; 
     case 1: image(imageDown,elementX, elementY);break; 
     case 2: image(imageRight,elementX, elementY);break; 
     case 3: image(imageUp,elementX, elementY);break; 
   }
  }  
}
class SnakeTail extends GameElement {
  private PImage[][] imageList = new PImage[4][4]; 
  int currentDirection;
  int nextDirection;
  
  public SnakeTail(int coordinateX, int coordinateY, int direction, int size){
    elementX = coordinateX;
    elementY = coordinateY;
    elementWidth = size;
    elementHeight = size;
    currentDirection = direction;
    nextDirection = direction;
    imageList[0][0] = loadImage( "snake-tail-left.png" );
    imageList[0][1] = loadImage( "snake-tail-left-down.png" );
    imageList[0][2] = loadImage( "snake-tail-left.png" );
    imageList[0][3] = loadImage( "snake-tail-left-up.png" );
    
    imageList[1][0] = loadImage( "snake-tail-down-left.png" );
    imageList[1][1] = loadImage( "snake-tail-down.png" );
    imageList[1][2] = loadImage( "snake-tail-down-right.png" );
    imageList[1][3] = loadImage( "snake-tail-down.png" );

    imageList[2][0] = loadImage( "snake-tail-right.png" );
    imageList[2][1] = loadImage( "snake-tail-right-down.png" );
    imageList[2][2] = loadImage( "snake-tail-right.png" );
    imageList[2][3] = loadImage( "snake-tail-right-up.png" );

    imageList[3][0] = loadImage( "snake-tail-up-left.png" );
    imageList[3][1] = loadImage( "snake-tail-up.png" );
    imageList[3][2] = loadImage( "snake-tail-up-right.png" );
    imageList[3][3] = loadImage( "snake-tail-up.png" );
  }
  
  public void setNextDirection(int direction){
    currentDirection = nextDirection;
    nextDirection = direction;
  }


  public void draw(){
     image(imageList[currentDirection][nextDirection],elementX, elementY);
  }  
}

var minim;
var audioPlayer;
/**
* Minim-emulation code by Daniel Hodgin
*/
// wrap the P5 Minim sound library classes
function Minim()
{
    this.loadFile = function (str)
    {
        return new AudioPlayer(str);
    }
}
// Browser Audio API
function AudioPlayer(str)
{
    var loaded = false;
    var looping = false;
    if (!!document.createElement('audio').canPlayType)
    { 
        var audio = document.createElement('audio');
        audio.addEventListener('ended', function ()
        {
            if (looping)
            {
                this.currentTime = 0;
                this.play();
            }
        }, false);
        audio.preload = 'auto';
        audio.autobuffer = true;
        if (canPlayOgg())
        {
            audio.src = str.replace(".mp3", ".ogg");
        }
        else if (canPlayMp3())
        {
            audio.src = str;
        }
        loaded = true;
    }
    this.play = function ()
    {
        if (!loaded)
        {
            var local = this;
            setTimeout(function()
            {
                local.play();
            }, 50);
            return;
        }
        audio.play();
    };
    this.loop = function ()
    {
        if (!loaded)
        {
            var local = this;
            setTimeout(function()
            {
                local.loop();
            }, 50);
            return;
        }
//audio.loop = 'loop';
        looping = true;
        audio.play();
    };
    this.pause = function ()
    {
        if (!loaded)
        {
            return;
        }
        audio.pause();
    };
    this.rewind = function ()
    {
        if (!loaded)
        {
            return;
        }
// rewind the sound to start
        if(audio.currentTime)
        {
            audio.currentTime = 0;
        }
    };
    this.position = function()
    {
        if (!loaded)
        {
            return -1;
        }
        if(audio.currentTime)
        {
            return audio.currentTime * 1000;
        }
        return -1;
    };
    this.cue = function(position)
    {
        if (!loaded)
        {
            return;
        }
        if(audio.currentTime)
        {
            audio.currentTime = position / 1000;
        }
    };
    this.mute = function()
    {
        audio.volume = 0.0;
    };
    this.unmute = function()
    {
        audio.volume = 1.0;
    };
}
function canPlayOgg()
{
    var a = document.createElement('audio');
    return !!(a.canPlayType && a.canPlayType('audio/ogg; codecs="vorbis"').replace(/no/, ''));
}
function canPlayMp3()
{
    var a = document.createElement('audio');
    return !!(a.canPlayType && a.canPlayType('audio/mpeg;').replace(/no/, ''));
}


