
public class Ball extends Body {
  // PROPERTIES
  float diameter;
  float bounce = 0.9;
  color colour;
  color highlight;
  int counter =0;
  
  boolean mouseOver;
  boolean pressed;
  
  float offsetX;
  float offsetY;
  
  int layerNum;

  // CONSTRUCTORS
  // a motionless ball
  Ball(float x, float y, int radius) {
    super(x,y);
    this.radius = radius;
    registerDraw(this);
    registerMouseEvent(this);
    init();
  }
  
  // a moving ball
  Ball(float x, float y, int radius, float vx, float vy) {
    super(x,y,vx,vy);
    this.radius = radius;
    registerDraw(this);
    registerMouseEvent(this);    
    init();
  }
  
  void init() {
    this.diameter = radius * 2;
    gravityAffected = true;
    frictionAffected = true;
    colour = color(255, 155, 0);
    mass=1;
  }
  
  // METHODS
  // DRAW
  void draw() {
    if(!mouseOver && !pressed) {
      displayDefault();
    }
    else if (pressed) {
      displayPressed();
    }
    else if(mouseOver){
        displayOver();
    }
    else{
      displayDefault();
    }
    if(!pressed){
      move();
    }
    
    additionalDrawMethods();
  }
  
  // To allow additional code to be inserted in draw without having to duplicate the above:
  void additionalDrawMethods(){
    
  }
  
  // MISC
  void setColour(color colour) {
    this.colour = colour;
  }
  
  void remove() {
    unregisterDraw(this);
  }
  
  // RENDER
  void displayDefault() {
    drawShadow();
    noStroke();
    fill(colour);
    drawBall();
  }
  
  void displayPressed() {
    drawShadow();
    stroke(255);
    strokeWeight(2);
    fill(colour,225);
    drawBall();
  }

  void displayOver() {
    drawShadow();    
    stroke(255);
    strokeWeight(2);
    fill(colour);
    drawBall();
  }
  
  
  void drawShadow(){
    noStroke();
    fill(0,30);
    ellipseMode(CENTER);
    ellipse(x-2, y+2, diameter+8, diameter+8);
  }
  
  void drawBall() {
      ellipseMode(CENTER);
      ellipse(x, y, diameter, diameter);
      noStroke();
      fill(255);
      textAlign(CENTER,CENTER);
      text(layerNum,x,y);
  }
  
  // DEFINE BOUNDS
  void checkBounds() {
    boundsBounce();
  }

  // MOUSE HANDLING  
  boolean isMouseover(float mx, float my) {
    mouseOver = (mx-x)*(mx-x) + (my-y)*(my-y) < radius * radius;
    return mouseOver;
  } 
  
  void mouseEvent(MouseEvent event){
    if((selected == null && isMouseover(mouseX, mouseY)) || selected == this){
      switch(event.getID()){
        case MouseEvent.MOUSE_PRESSED:
            layerManager.layerShifted = true;
            selected = this;
            pressed = true;
            if(mouseButton == LEFT){
             // need to confirm whether getModifiers is platform independent
              if(event.getModifiers() != 17){
                 layers.bringToFront(this);
                 mouseIsPressed();
              }
              else{
                layers.shiftUp(this);
              }
            }
            
            if(mouseButton == RIGHT){
                if(event.getModifiers() != 5){
                  layers.sendToBack(this);
                }
                else {
                  layers.shiftDown(this);
                }
            }
        break;
          
        case MouseEvent.MOUSE_DRAGGED:
          if (mouseButton == LEFT) {
            selected = this;
            pressed = true;
            mouseIsDragged();
          }
        break;
          
        case MouseEvent.MOUSE_RELEASED:
          if(pressed){
            mouseIsReleased();
          }
          selected = null;
          pressed = false;
        break;
        
        default:
          selected = null;
          pressed = false;
        break;
      }
    }
    else {
      mouseOver = false;
      pressed = false;
    }
  }
  
  void mouseIsPressed() {
      offsetX = x-mouseX;
      offsetY = y-mouseY;
  }
  
  void mouseIsDragged() {
      x = mouseX+offsetX;
      y = mouseY+offsetY;
  }
  
  void mouseIsReleased() {
    vx = mouseX - pmouseX;
    vy = mouseY - pmouseY;
  }
  
}

