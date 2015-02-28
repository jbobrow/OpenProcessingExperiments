
PImage[] images;
PImage masterImage;

Maxim maxim;
AudioPlayer errorSound;
AudioPlayer correctSound;
AudioPlayer winSound;

int dotCount = 0; 
int dotCurrent = 0;
Dot[] dots = new Dot[100]; //maximum of dots alloted

int level = 10; /* level of accurecy - higher number means
                   dots are easier to click. */

void setup(){
  size(850,850);
  background(255,255,255);
   
  maxim = new Maxim(this);

  errorSound = maxim.loadFile("sound_error.wav");
  errorSound.setLooping(false);

  correctSound = maxim.loadFile("sound_correct.wav");
  correctSound.setLooping(false);

  winSound = maxim.loadFile("sound_win.wav");
  winSound.setLooping(false);

  masterImage = loadImage("leopard_pic.png");
  String dotCoords[] = loadStrings("leopard_dots.txt");

  //fill dots array while displaying on screen
  for (int i=0; i < dotCoords.length; i++) {
    int[] coords = int (split(dotCoords[i], ", "));
    dots[i] = new Dot(coords[0], coords[1], i);
    dotCount = i;
  }
  
}

void draw(){
}
void mousePressed()
{
  // code that happens when the mouse button
  // is pressed
  
  /* check if there are more dots to connect and if the current mouse
    coordinates are close to the dots from the dots array. 
  */
  if ( (dotCurrent <= dotCount) &&
    ((dots[dotCurrent].X() < mouseX+level) && (dots[dotCurrent].X() > mouseX-level)) &&
    ((dots[dotCurrent].Y() < mouseY+level) && (dots[dotCurrent].Y() > mouseY-level)) ) {
    dots[dotCurrent].clickDot();
    strokeWeight(12);
    stroke(255, 255, 0);
    point(dots[dotCurrent].X(), dots[dotCurrent].Y());
    correctSound.stop(); //needed in Javascript version 
    correctSound.play(); // plays a beep to indicate correct dot 
    
    if ((dotCurrent > 0) && (dotCurrent < dotCount)) { 
      //draw connecting lines if not the first dot
      strokeWeight(3);
      line(dots[dotCurrent-1].X(), dots[dotCurrent-1].Y(), dots[dotCurrent].X(), dots[dotCurrent].Y());
    } 
    else if (dotCurrent == dotCount) { 
      //actions on final dot
      background(255, 255, 255);
      imageMode(CENTER);
      image(masterImage, width/2, height/2, 800, 800);
      winSound.play(); //plays a cheer when you clicked final dot
    }
    
    dotCurrent++;
  } else {
      errorSound.stop(); //needed in Javascript version 
      errorSound.play(); } //play error sound if not correct mouse click
  
}
class Dot {
  /*
    Dot: is constructed with (x,y) coordinates and an order
    number, and creates a spot in the display area.
    
    A dot can tell you it's cordinates, as well as, it's
    order number, and whether it's activated or not (currently
    not used.)
  */
  
  int x, y, c;
  boolean activated;
  
  Dot(int pointX, int pointY, int count) {
    x = pointX;
    y = pointY;
    c = count;
    activated = false;
    strokeWeight(6);
    point(x, y);
    fill(0, 0, 0);
    text(c+1, x+6, y+6);
  }
  
  boolean clickDot() {
    return !activated;
    
  }
  int X() {return x;}
  int Y() {return y;}
  int count() {return c;}
  boolean activated() {return activated;}
}



