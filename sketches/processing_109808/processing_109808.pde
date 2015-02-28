
/* @pjs preload="scope.png"; */
/* @pjs preload="scope_trans.png"; */


// Set up extetnal objects
Background background;
Buttons button;
Scope scope;
Slider sliderx;
StartButton start;
StartButton colorButton;
StartButton speedUp;
StartButton speedDown;

// true = start button gone; false = start button visible
boolean clickStart = false;

void setup() {
  size(600, 600);
  background(219, 219, 219);
  
  // start button
  start = new StartButton(width/2,
                          height/2,
                          200,
                          100,
                          color(0, 0, 0, 100),
                          color(0, 0, 0, 50),
                          width/2,
                          height/2 -25,
                          "Click to Begin"
                          + "\n" 
                          + "\n" 
                          + "Click the Circles" 
                          + "\n"
                          + "\n"
                          + "Use slider to change circle size"
                          + "\n"
                          + "Speed and Color buttons at top.",
                          color(255));
                          
  // button to change color of ball/ circle
  colorButton = new StartButton(75,
                          10,
                          150,
                          20,
                          color(255, 255, 255, 100),
                          color(0, 0, 255, 200),
                          75,
                          15,
                          "Click to Change Color",
                          color(255));
  // button to increase speed of ball
  speedUp = new StartButton(200,
                          10,
                          100,
                          20,
                          color(88, 225, 53, 180),
                          color(88, 255, 53, 255),
                          200,
                          15,
                          "Ball Speed Up",
                          color(255));
  // button to decrease speed of ball
  speedDown = new StartButton(300,
                          10,
                          100,
                          20,
                          color(255, 0, 0, 180),
                          color(255, 0, 0, 255),
                          300,
                          15,
                          "Ball Speed Down",
                          color(255));  
  //initialize other objects                        
  background = new Background();
  scope = new Scope();  
  button = new Buttons();
  sliderx = new Slider(width/2, height-15, width, 30, "slide to change ball size");
  sliderx.setValue(.1);
}

void draw() {
  
  // if start not clicked yet, animation/ game will not start
  if (clickStart == false) {
  background.display();
  start.displayBox();
    if (mouseX <= width/2+100
        && mouseX >= width/2-100
        && mouseY <= height/2+50
        && mouseY >= height/2-50
        && mousePressed) {
      clickStart = true;
        }
     else {
       clickStart = false;
     } 
  }
  // if start is clicked, animation/ game will start
  else {
  background.display();
  button.draw();
  scope.display();
  sliderx.display();
  colorButton.displayBox();
  // whether or not ball color changer button is clickable
  if (mouseX <= 150
        && mouseX >= 0
        && mouseY <= 20
        && mouseY >= 0
        && mousePressed) {
      button.setColor(color(random(0,255), random(0,255), random(0,255)));
        }
  else {
     }
  speedUp.displayBox();
  // whether or not ball speed up button is clickable
  if (mouseX <= 250
        && mouseX >= 150
        && mouseY <= 20
        && mouseY >= 0
        && mousePressed) {
      button.setSpeedUp();
        }
  else {
     }
  speedDown.displayBox();
  // whether or not ball speed down button is clickable
  if (mouseX <= 350
        && mouseX >= 250
        && mouseY <= 20
        && mouseY >= 0
        && mousePressed) {
      button.setSpeedDown();
        }
  else {
     }
  }
}  

// if statements to control slider

void mousePressed() {
  if (sliderx.contains(mouseX, mouseY)) {
    sliderx.setUpdate(true);
    button.showSize();
  }
}

void mouseDragged() {
  if (sliderx.isUpdating()) {
    float prevValue = sliderx.interp(mouseX, mouseY);
    sliderx.setValue(prevValue);
    button.setXspeed(map(prevValue,0,1,1,100));
    button.showSize();
  }
}

void mouseReleased() {
  if (sliderx.isUpdating()) sliderx.setUpdate(false);
  button.showSize();
}


      
  
 
class Background {
  
  int windowSize = 600;
  int backgroundCount = 0;

  void display() {
    
    if (backgroundCount == windowSize) {
      backgroundCount = 0;
    }
    else {
      background(219,219,219);
      fill(255);
      noStroke();
      rect(backgroundCount-600, 0, 25, 600);
      rect(backgroundCount-525, 0, 25, 600);
      rect(backgroundCount-450, 0, 25, 600);
      rect(backgroundCount-375, 0, 25, 600);
      rect(backgroundCount-300, 0, 25, 600);
      rect(backgroundCount-225, 0, 25, 600);
      rect(backgroundCount-150, 0, 25, 600);
      rect(backgroundCount-75, 0, 25, 600);
      rect(backgroundCount, 0, 25, 600);
      rect(backgroundCount+75, 0, 25, 600);
      rect(backgroundCount+150, 0, 25, 600);
      rect(backgroundCount+225, 0, 25, 600);
      rect(backgroundCount+300, 0, 25, 600);
      rect(backgroundCount+375, 0, 25, 600);
      rect(backgroundCount+450, 0, 25, 600);
      rect(backgroundCount+525, 0, 25, 600);
      rect(backgroundCount+600, 0, 25, 600);
      backgroundCount++;
    }
  }
}

class Buttons {
  
  float wait = 2000;
  int lastTime;
  float randomX = width / 2;
  float randomY = height / 2;
  int counter;
  float radius = 10;
  color fillColor;
  String sizeCircle;
  
  // sets sized of ball
  void setXspeed(float _f) {
   radius = _f; 
  }
  
  // sets color of ball
  void setColor(color c) {
    fillColor = c;
  }
  
  // speed increases
  void setSpeedUp() {
    if (wait != 0) {
      wait -= 100;
    }
    else {
    }
  }
  
  // speed decreases
  void setSpeedDown() {
    if (wait != 100000) {
      wait += 100;
    }
    else {
    }
  }
  
  void showSize() {
    sizeCircle = "Circle size is: ";
    int size = Math.round(radius);
    text(sizeCircle + size, 430, 15, 0);
  }
  
  void draw() {
    lastTime += 20;
    noStroke();
    fill(fillColor);
    
    // controls speed of ball
    // wait is controlled by user
        
    if ((lastTime % wait) == 0) {
      if (mouseClicked()) {
        randomX = random(25, width-25);
        randomY = random(45, height-65);
        ellipseMode(CENTER);
        ellipse(randomX, randomY, radius, radius);    
        counter++;
        lastTime = 0;
      }
      else {
        randomX = random(25, width-25);
        randomY = random(45, height-65);   
        ellipseMode(CENTER);
        ellipse(randomX, randomY, radius, radius);
      }
    }
    else if (mouseClicked()) {
      randomX = random(25, width-25);
      randomY = random(45, height-65); 
      ellipseMode(CENTER);  
      ellipse(randomX, randomY, radius, radius);
      counter++;
      lastTime = 0;
    }
    else {
      ellipseMode(CENTER);      
      ellipse(randomX, randomY, radius, radius);
    }
    counter();
  }
  
  // whether or not ball is clicked
  boolean mouseClicked() {
    if (mouseX >= randomX - radius/2 
        && mouseX <= randomX + radius/2 
        && mouseY >= randomY - radius/2 
        && mouseY <= randomY + radius/2
        && mousePressed) {
      return true;
    }
    else {
      return false;
    }
  }
  
  // counter for points
  void counter() {
    fill(0, 0, 0, 200);
    rect(0, 0, width, 20);   
    fill(200);
    text("Your score is:", width-65, 14);
    fill(255, 0, 0, 200);
    rect(width-25, 0, 20, 20);
    fill(255);
    text(counter, width-15, 14);
  }
}

class Scope {

  PImage img;
  PImage img2;
  
  Scope() {
    img = loadImage("scope.png");
    img2 = loadImage("scope_trans.png");
  }
  
  void display() {
    
    // if mouse not in top or bottom button areas, mouse is seen as scope
    if (mouseY < height-40 && mouseY > 20) {
      fill(0, 0, 0, 25);
      imageMode(CENTER);
      image(img2, mouseX+5, mouseY+5);

      imageMode(CENTER);
      image(img, mouseX, mouseY);
      noCursor();
    }
    else {
      cursor();
    }
  }
}
// slider created by Dr. Bob Lutz


class Slider {
  private int x,y;      //location
  private int w,h;      // size
  private String label; // tesxt to show
  
  private float value;  // current value for the slider, range is 0 to 1
  private boolean update = false; // flag to signal when slider is being dragged
  
  Slider (int _x, int _y, int _w, int _h, String _label) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    label = _label;
  }
  
  void setValue(float _f) {
      value = _f;
  }
  
 boolean contains(int _x, int _y) {
   return ( (_x>=x-w/2) && (_x<=x+w/2) && (_y>=y-h/2) && (_y<=y+h/2) ) ? true : false;
 }
  
  void display() {
    
    fill(255,0,0);
    textAlign(CENTER,CENTER);
    text(label, x ,y);
    
    // draw the underlaying box
    fill(255,64);
    rectMode(CENTER);
    rect(x,y,w,h);
    
    // draw the box with the current value
    fill(0, 127);
    rectMode(CORNER);
    rect(x-w/2, y-h/2, w*value, h); 
  }
  
  float interp(int _x, int _y) {
   float d = _x - (x-w/2);
   //float new = map (d, x-w/2, x+w/2, 0, 1); // norm is a little easier, conceptually
   float nw = norm (d, x-w/2, x+w/2); 
   //clamp at 0.0, 1.0
   nw = min(1.0, nw);
   nw = max(0.0, nw);
   return nw;
  }
  
  boolean isUpdating() {
    return update;
  }
  
  void setUpdate(boolean _b) {
    update = _b;
  }
   
}

class StartButton {
  
  int boxX, boxY;
  int boxW, boxH;
  color rectColor, hoverColor;
  
  int textX, textY;
  String textString;
  color textColor;
  
  StartButton (int bx, int by, int bw, int bh, color bc, color hc, int tx, int ty, String str, color tc ) {
    boxX = bx; //x coordinate
    boxY = by; //y corrdinate
    boxW = bw; //width
    boxH = bh; // height
    rectColor = bc;  // color of button
    hoverColor = hc; // color of button when hovered over
    
    textX = tx;
    textY = ty;
    textString = str;
    textColor = tc;
  }
  
  // displays box, controls hover color
  void displayBox() {  
    if (mouseOver()) {
      fill(hoverColor);
      rectMode(CENTER);
      rect(boxX, boxY, boxW, boxH);
      rectMode(CORNER);
      fill(textColor);
      textAlign(CENTER);
      text(textString, textX, textY);
    }
    else {  
      fill(rectColor);
      rectMode(CENTER);
      rect(boxX, boxY, boxW, boxH);
      rectMode(CORNER);
      fill(textColor);
      textAlign(CENTER);
      text(textString, textX, textY);
    }
  }
  
  // controls if it is covered hovered/ mouse over or not
  boolean mouseOver() {
    if (mouseX <= boxX + (boxW/2)
        && mouseX >= boxX - (boxW/2)
        && mouseY <= boxY + (boxH/2)
        && mouseY >= boxY - (boxH/2)) {
     return true;
     }
     else {
       return false;
     }
  }
}

  
