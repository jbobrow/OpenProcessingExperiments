
// Processing with Seb_L03
// Simon's 'Bouncy Buttons'
// Ver. 002

Button[] myBtns;

int   bNum = 4;          // Number of buttons
float bRad = 30,         // Button radius
      xPos,              // X-axis position (See line 25)
      yPos,              // Y-axis position (See line 26)
      xSpd,              // X-axis speed    (See line 28)
      ySpd;              // Y-axis speed    (See line 29)
color bCol = #FFFFFF,    // Button colour
      aCol = #FFE400;    // Active button colour

void setup() {
  
  size(500, 500);
  frameRate(60);
  
  smooth();
  noStroke();
  
  myBtns = new Button[bNum];
  
  for(int i = 0; i < myBtns.length; i++) {
    xPos = random(0 + bRad, width - bRad);
    yPos = random(0 + bRad, height - bRad);
    
    xSpd = random(1, 3);
    ySpd = random(1, 3);
    
    myBtns[i] = new Button(bRad, xPos, yPos, xSpd, ySpd, bCol, aCol, i, myBtns);
  }
  
}

void draw() {
  
  background(#00A8ff);
  
  for(int i = 0; i < myBtns.length; i++) {
    myBtns[i].handleObjectCollision();
    myBtns[i].Render();
  }
  
}

void mousePressed() {
  
  for(int i = 0; i < myBtns.length; i++) {
    myBtns[i].handleMousePressed();
  }
  
}

class Button {
  
  float    r, 
           x, 
           y, 
           xS, 
           yS;
  color    bC, 
           aC;
  int      _id;
  Button[] _myBtns;
  
  float   mouseFromXY;
  boolean active;
  
  // CONSTRUCTOR
  Button(float tBRad, float tXPos, float tYPos, float tXSpd, float tYSpd, color tBCol, color tACol, int id, Button[] myBtns) {
    
    r  = tBRad;
    x  = tXPos; 
    y  = tYPos;
    xS = tXSpd; 
    yS = tYSpd;
    bC = tBCol; 
    aC = tACol;
    _id = id;
    _myBtns = myBtns;
    
    active = false;
    
  }
  
  // METHOD(S)
  void Render() {

    if((x <= r) || (x >= width - r)) {
      xS = -xS;
    }
    if((y <= r) || (y >= height - r)) {
      yS = -yS;
    }

    x += xS;
    y += yS;
  
    if(active) {
      fill(aC);
    } else {
      fill(bC);
    }

    ellipse(x, y, r * 2, r * 2);
    
  }
  
  void handleObjectCollision() {
    
    for(int i = 0; i < _myBtns.length; i++) {
      
     if(i != _id) {
        
        float dx = _myBtns[i].x - x;
        float dy = _myBtns[i].y - y;
        float distance = sqrt(dx*dx + dy*dy);
        
        if(distance < r * 2) {
          xS = -xS;
          yS = -yS;
          
          // Debug
          // println("Collision!");
        }
        
      }
      
    }
    
  }
  
  void handleMousePressed() {
    
    mouseFromXY = dist(mouseX, mouseY, x, y);
    
    if(mouseFromXY <= r) {
      active = !active;
    }
    
  }
  
}


