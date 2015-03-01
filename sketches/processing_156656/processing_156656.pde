
PImage a, b, c, q, e, f, g, k, i, t;
Draggable d, r, z;
ImageButtons button;

boolean keyboardButton = false; 
boolean keyboardButton2 = false; 



void setup() {
  size(1000, 500);
  background(#110f25);
  smooth();

  a = loadImage("celestica.png");
  b = loadImage("ledge.png");
  i = loadImage("monster.png");
  c = loadImage("play.png");
  q = loadImage("play_rollover.png");
  e = loadImage("play_down.png");
  t = loadImage("text.png");

  int x = width/2 - b.width/2;
  int y = height/2 - b.height/2; 
  int w = b.width;
  int h = b.height;
  button = new ImageButtons(x + 260, y + 230, w, h, c, q, e);

  d = new Draggable(545, 100, 30, 7);
  z = new Draggable(700, 160, 30, 7);
  r = new Draggable(847, 110, 30, 7);
}

void draw() {

  background(#110f25);
  button.update();
  button.display();
  image(a, 10, 10);
  image(b, width/8, height/2); 
  fill(#59843b);
  noStroke();
  ellipse(289, 313, 61, 10);
  image(i, width/3.99, height/2);
  fill(#232346);
  rect(555, 50, 10, 180);
  rect(710, 50, 10, 180);

  rect(857,50,10,180);
  image(t, 520, 200);
  
  d.rollover(mouseX, mouseY);
  d.drag(mouseX, mouseY); 
  d.display();

  z.rollover(mouseX, mouseY);
  z.drag(mouseX, mouseY);
  z.display();

  r.rollover(mouseX, mouseY);
  r.drag(mouseX, mouseY);
  r.display();


  //  fill(#232346);
  noStroke();
  
  if (keyboardButton == true) {
    fill(255); 
    rect(654, 315, 20, 20, 7);
  } else {
    if (mouseX > 654 && mouseX < 684) {
      if (mouseY > 315 && mouseY < 335) { 
        fill(255);
        rect(654, 315, 20, 20, 7);
        if (mousePressed) {
          keyboardButton = true;
        }
      }
    } else {
      fill(#232346);
      rect(654, 315, 20, 20, 7);
    }
  }
  
    if (keyboardButton2 == true) {
    fill(255);
    rect(810, 315, 20, 20, 7); 
  } else {
  if (mouseX > 810 && mouseX < 830) {
    if (mouseY > 315 && mouseY < 335) { 
      fill(255);
      rect(810, 315, 20, 20, 7);
      if (mousePressed) {
        keyboardButton2 = true;
      }
    }
  } else { 
    fill(#232346);
    rect(810, 315, 20, 20, 7);
  };




  //rect(654, 315, 20, 20, 7);

  //keyboard button

}

}
void mousePressed() {
  d.clicked(mouseX, mouseY);
  z.clicked(mouseX, mouseY);
  r.clicked(mouseX, mouseY);
}

void mouseReleased() {
  d.stopDragging();
  z.stopDragging();
  r.stopDragging();
}

class Button
{
  int x, y;
  int w, h;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   
  
  void pressed() {
    if(over && mousePressed) {
      pressed = true;
    } else {
      pressed = false;
    }    
  }
  
  boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
}
class Draggable {
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  
  float x,y,w,h;          // Location and size
  float offsetX, offsetY; // Mouseclick offset

  Draggable(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    offsetX = 0;
    offsetY = 0;
  }

  // Method to display
  void display() {
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(#c1a014);
    else fill(#f3d122);
    rect(x,y,w,h);
  }

  // Is a point inside the rectangle (for click)?
  void clicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
    }
  }
  
  // Is a point inside the rectangle (for rollover)
  void rollover(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  // Stop dragging
  void stopDragging() {
    dragging = false;
  }
  
  // Drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
//      x = mx + offsetX;
      y = my + offsetY;
    
 if (y < 50 ) { y=50; }; 
 if (y > 200 ) { y=200; };
}
    
    
  }

}



class ImageButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }
  
  void update() 
  {
    over();
    pressed();
    if(pressed) {
      currentimage = down;
    } else if (over){
      currentimage = roll;
    } else {
      currentimage = base;
    }
  }
  
  void over() 
  {
    if( overRect(x, y, w, h) ) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void display() 
  {
    image(currentimage, x, y);
  }
}


