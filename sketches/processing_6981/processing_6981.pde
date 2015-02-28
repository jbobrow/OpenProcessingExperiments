
public class Ball extends Body {
  // PROPERTIES
  float diameter;
  float bounce = 0.9;
  color colour;
  color highlight;
  
  boolean mouseOver;
  boolean pressed;

  int polarity;
  int storedRadius;
  
  float lastX;
  float lastY;

  // CONSTRUCTORS
  // a motionless ball
  Ball(float x, float y, int radius) {
    super(x,y);
    this.radius = radius;
    init();
    registerDraw(this);
    registerMouseEvent(this);
  }
  
  // a moving ball
  Ball(float x, float y, int radius, float vx, float vy) {
    super(x,y,vx,vy);
    this.radius = radius;
    init();
    registerDraw(this);
    registerMouseEvent(this);
  }
  
  void init() {
    this.diameter = radius * 2;
    this.storedRadius = radius;
    gravityAffected = true;
    frictionAffected = true;
    colour = color(255, 155, 0);
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
    else if(mouseOver) {
      displayOver();
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
    noStroke();
    fill(colour, 200);
    drawBall();
  }
  
  void displayPressed() {
    stroke(255);
    strokeWeight(2);
    fill(255,200,0,200);
    drawBall();
  }

  void displayOver() {
    noStroke();
    fill(255,200,0,200);
    drawBall();
  }
  
  void drawBall() {
    if(!hideBallsOn){
      ellipseMode(CENTER);
      ellipse(x, y, diameter, diameter);
      if(polarity == POSITIVE && polarityOn) {
        noStroke();
        fill(255,100);
        ellipse(x,y,radius,radius);
      }
    }
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
          if (mouseButton == LEFT) {
            selected = this;
            pressed = true;
            mouseIsPressed();
            layers.bringToFront(this);
          } 
          else if (mouseButton == RIGHT) {
            if(polarityOn) {
              polarity *= -1;
            }
          }
        break;
          
        case MouseEvent.MOUSE_DRAGGED:   
          if (mouseButton == LEFT) {
            mouseIsDragged();
          }
        break;
          
        case MouseEvent.MOUSE_RELEASED:
          if (mouseButton == LEFT) {
            selected = null;
            pressed = false;
            mouseIsReleased();
          }
        break;

      }
    }
    else {
      mouseOver = false;
    }
  }
  
  void mouseIsPressed() {
      x = mouseX;
      y = mouseY;
  }
  
  void mouseIsDragged() {
      x = mouseX;
      y = mouseY;
  }
  
  void mouseIsReleased() {
    vx = mouseX - pmouseX;
    vy = mouseY - pmouseY;
  }
  
}

