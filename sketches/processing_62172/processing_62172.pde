

// VARIABLES.........................
int cirNUM;
int  sizeX;
int  sizeY;
int  i;
MyCircle[] circles;



// SETUP.............................
void setup(){
    cirNUM = 50;
    sizeX = 600;
    sizeY = 600;
    i = 0;
    size(600, 600);
    background(255);
    stroke(0);
    frameRate(120); /* 60 is default */
  
  
  // Create circle array
  circles = new MyCircle[cirNUM];
  for(i=0; i< cirNUM; i=i+1){
    circles[i] = new MyCircle(int(random(600)), int(random(600)), int(random(255)));
    circles[i].paint();
  }
  
}




// DRAW..............................
void draw(){
  
  for(i = 0; i< cirNUM; i=i+1){
  circles[i].update();
  }
  
  fill(255,random(50));
  rect(0, 0, sizeX, sizeY);
}




// FUNCTIONS .......................
void mouseClicked(){
  for(i = 0; i< cirNUM; i=i+1){
  if ( ishovering(circles[i].getX(), circles[i].getY(), mouseX, mouseY) )
    circles[i].active=0;
  }
}

boolean ishovering(int cx, int cy, int mx, int my){
  // just checking near, square around the circle
  //int sz = 50/2; // too difficult to click on
  int sz = 50; // big square around ;)
  if ( cx > (mx-sz) && cx < (mx+sz) && cy > (my-sz) && cy < (my+sz))
    return true;
  return false;
  
}


// CLASS ...........................
class MyCircle{
  
  // Variables
  int x, y;
  int thecolor;
  int active = 0;
  
  // Constructor
  MyCircle(int posx, int posy, int clr){
    x = posx;
    y = posy;
    thecolor = clr;
    active = 1;
  }  
  
  // Methods
  void paint(){
    fill(thecolor);
    ellipse(x, y, 50, 50);
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  void update(){
    int factor = 10;
    // "remove old one (repainting over it)"
    // it does not work exactly because we use int, not floats!!
    if ( active == 1 ){
      fill(255,50);
      ellipse(x, y, 50, 50);
      fill(0);
      // get new position
      x += int(random(-factor, factor));
      y += int(random(-factor, factor));
      // check limits
      if ( x < 0)
        x = 0;
      if ( x > sizeX )
        x = sizeX;
      if ( y < 0)
        y = 0;
      if ( y > sizeY )
        y = sizeY;      
      // paint again
      paint();
    }
  }
  
    /* NOT NEEDED NOW
  void changestate(){
    // flip value, 0 or 1, it could be boolean but...
    active = ( active + 1 ) % 2;
  }*/
}

