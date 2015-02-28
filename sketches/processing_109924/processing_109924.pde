
SpaceShip spaceship;
PImage img;
final static String BG = "../spacebg.jpg";

Slider sliderSpeed;

Button button;
Button upButton;
Button downButton;
Button leftButton;
Button rightButton;

final static String STOP = "Stop";
final static String START = "Start";


void setup() {
	size (400, 325);
	img = loadImage(BG);
        spaceship = new SpaceShip();
        
        sliderSpeed = new Slider( (width/2), 300, 150, 30, "Speed");
        
        button = new Button( (width/2), 270, 70, 30, START);
        upButton = new Button(100, 100, 50, 30, "Up");
        downButton = new Button (100, 130, 50, 30, "Down");
        leftButton = new Button (50,115, 50, 30, "Left");
        rightButton = new Button (150,115, 50, 30, "Right");

}

void draw() {
	image(img, 0, 0); // this is where we draw the bg
        spaceship.display();
        
        sliderSpeed.display();
        button.display();
        upButton.display();
        downButton.display();
        leftButton.display();
        rightButton.display();
        
        fill(150);
        rect(180, 15, 300, 30);
        fill(255);
        text("X position: " + spaceship.getXpos(), 100, 10);
        text("Y position: " + spaceship.getYpos(), 270, 10);
        if (button.says(STOP)) {
        text("Speed: " + spaceship.getSpeed() +  " (locked)", 180, 20);
        }else{
        text("Speed: " + spaceship.getSpeed() +  " (unlocked)", 180, 20);
        }
        
        fill(0);
 


        
        if (button.says(STOP)) // Move and display image when we are "running"
          {
            spaceship.move();
          }
        }

void mousePressed() {
	if (sliderSpeed.contains(mouseX, mouseY)) {
		sliderSpeed.setUpdate(true);
	}
        if (!button.says(STOP))
        {
        if (leftButton.contains(mouseX, mouseY)) {
                 spaceship.setXpos(spaceship.getXpos()-10.0);
        }
        if (rightButton.contains(mouseX, mouseY)) {
                spaceship.setXpos(spaceship.getXpos()+10.0);
        }
        if (downButton.contains(mouseX, mouseY)) {
                 spaceship.setYpos(spaceship.getYpos()+10.0);
        }
        if (upButton.contains(mouseX, mouseY)) {
                spaceship.setYpos(spaceship.getYpos()-10.0);
        }
        }
}

void mouseDragged() {
	if ( sliderSpeed.isUpdating() && button.says(START)) {
          float preValue = sliderSpeed.interp(mouseX, mouseY);
		sliderSpeed.setValue(preValue);
		spaceship.setSpeed(map(preValue, 0, 1, -5, 5));		
	}
}

void mouseReleased() {
    if ( button.contains(mouseX, mouseY) ) //stop/start accordingly 
    if (button.says(STOP)) 
      button.setText(START);
    else 
      button.setText(STOP);
    if (sliderSpeed.isUpdating()) sliderSpeed.setUpdate(false);
}
//Button Class.
class Button {
  
  private int x,y,w,h;
  private String label;
  
  Button(int _x, int _y, int _w, int _h, String _label) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    label = _label; 
  }
  
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
    stroke(0);
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }
  
  boolean contains(int _x, int _y) {
   if( (_x >= x-w/2) && (_x <= x+w/2) && (_y >= y-h/2) && (_y <= y+h/2) )
      return true;
    else
      return false;
  }
  
  boolean says(String s) {
    return label.equals(s) ? true : false;
  }
  
  void setText(String _t) {
    label = _t;  
  }
  
}

//Slider class.

class Slider {
  private int x,y;      //location
  private int w,h;      // size
  private String label; // test to show
  
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
    

    
    // draw the underlaying box
    fill(248, 248, 255);
    rectMode(CENTER);
    rect(x,y,w,h);
    
    // draw the box with the current value
    fill(0, 127);
    rectMode(CORNER);
    rect(x-w/2, y-h/2, w*value, h); 
    
    fill(255, 0, 0);
    textAlign(CENTER,CENTER);
    text(label, x ,y);
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
// Spaceship by Neha Rao ITEC Comp Graphics and Multimedia Section 01 Fall 2013
class SpaceShip {
	private PImage img;
	private final static String SHIP = "spaceship128.png";

	private float xpos, ypos;
        private float xspeed,yspeed;
	SpaceShip() {
	 img = loadImage(SHIP);
	 xpos = random(width / 2);
	 ypos = random(height / 2);
         xspeed = 1;
         yspeed = 1;
	}

        void move() {
          xpos += xspeed;
          ypos += yspeed;
          
          if( xpos > (width-img.width) || xpos < 0 ) {
            xspeed *= -1;
          }
          if( ypos > (height-img.height) || ypos < 0 ) {
            yspeed *= -1;
          }
        }
        
        void setSpeed(float _f) {
        xspeed = _f;
        yspeed = _f;
        }
        
        float getSpeed() {
          return xspeed;
        }

	void setXpos(float _pos) {
	xpos = _pos;
	}

	void setYpos(float _pos) {
	ypos = _pos;
	}

        float getXpos() {
          return xpos;
        }
        
        float getYpos() {
          return ypos;
        }

	void display() {
	image(img, xpos, ypos);
	}

	}


