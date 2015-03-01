
PShape buttonBackground;
PImage button;
PImage mover;
boolean programOn = false;
boolean reset = true;
boolean clickable = true;
float buttonXCenter = 284;
float  buttonYCenter = 384;
float buttonXPosition;
float buttonYPosition;
float moverXCenter = 917;
float moverXPosition;
float distanceToCenter;

boolean overButton = false;
float easing = 0.15;

void setup() {
  size(768,768);
  buttonBackground = loadShape("buttonBackground.svg");
  button = loadImage("button.png");
  mover = loadImage("mover.png");

}

void draw() {
  background(#e5e3e3);
  
  buttonXPosition = buttonXCenter - 125;
  buttonYPosition = buttonYCenter - 125;
  moverXPosition = moverXCenter - 284;
  
  //Active Overlay
  rect(0,0,buttonXCenter,height);
  fill(#bc0808);
  noStroke();
  
  shape(buttonBackground,0,0,768,768);

  image(mover,moverXPosition,209);
  image(button,buttonXPosition,buttonYPosition);

  distanceToCenter = sqrt( sq(mouseX - buttonXCenter) + sq(mouseY - buttonYCenter) );
  if (distanceToCenter <= 104) {
      overButton = true;
      cursor(HAND);
  } else {
      overButton = false;
      cursor(ARROW);
  }
  
  if (programOn == true) {
    clickable = false;
    float buttonTargetX = 484;
    float dButtonX = buttonTargetX - buttonXCenter;
    
    if(abs(dButtonX) > 1) {
      buttonXCenter += dButtonX * easing;

    } else if (moverXCenter > buttonTargetX + 1) {
          float dmoverX = buttonTargetX - moverXCenter;
          if(abs(dmoverX) > 1) {
            moverXCenter += dmoverX * easing;
          }
      
    } else {
      reset = false;
      programOn = false;
    }
    
  } else if (reset == false) {
    float dReturn = 284 - buttonXCenter;
    if(abs(dReturn) > 1) {
      buttonXCenter += dReturn * easing;
      moverXCenter += dReturn * easing;
    } else {
       float dMoverReturn = 917 - moverXCenter;
       if(abs(dMoverReturn) > 1) {
          moverXCenter += dMoverReturn * easing;
       }
      clickable = true;
    }
  } else {
    reset = true;
  }
    
} 
 
void mousePressed() {
  if(overButton == true && clickable == true) { 
    programOn = true; 
  } else {
    programOn = false;
  }
}

  




