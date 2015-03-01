
class chaser {
  // define variables
  int w, h, s, cBW, cR, cG, cB, pX, pY, transp, limXp, limXn, limYp, limYn;
  int colorPicker;

  // constructors
  // arguments: width, height, speed, R, G, B, alpha
  chaser( int cWidth, int cHeight, int cSpeed, int cGray, int cAlpha ) {
    pX = (int) random(width);    // random pX and pY chaser starting point
    pY = (int) random(height);
    w = cWidth;
    h = cHeight;
    s = cSpeed;
    cBW = cGray;
    transp = cAlpha;
    colorPicker = (int) random(3);  // random color picker
  }

  // arguments: width, height, speed, R, G, B, alpha
  chaser( int cWidth, int cHeight, int cSpeed, int cRed, int cGreen, int cBlue, int cAlpha ) {
    pX = (int) random(width);
    pY = (int) random(height);
    w = cWidth;
    h = cHeight;
    s = cSpeed;
    cR = cRed;
    cG = cGreen;
    cB = cBlue;
    transp = cAlpha;
    colorPicker = (int) random(3);  // random color picker
  }

  // update function
  void update() {

    // mouse cursor recognition limits
    limXp = pX + w/4;
    limXn = pX - w/4;
    limYp = pY + h/4;
    limYn = pY - h/4;
    
    // set colorMode to standard RGB
    colorMode(RGB, 255, 255, 255);
    stroke(0);
    strokeWeight(.5);

    // grayscale or RGB according to declaration arguments
    if (cBW == 0) fill( cR, cG, cB, transp );
    else fill( cBW, transp );

    // "lightblast"
    if ( limXp > mouseX && limXn < mouseX && limYp > mouseY && limYn < mouseY ) {
      stroke( 0, 0 );
      fill( 0, 0 );
      stroke( 0, 255);
      strokeWeight( .5 );

      // lightblast random color
      for ( int i = 0; i < 256; i++ ) {
        if ( colorPicker == 0) {
          stroke( random(15, 60), random(60, 120), random(100, 600), 150 );
        }
        if ( colorPicker == 1) {
          stroke( random(0, 15), random(180, 205), random(200, 255), 150 );
        }
        if ( colorPicker == 2) {
          stroke( random(200, 255), random(200, 255), random(200, 255), 150 );
        }
        // draw random lines to create blast
        line( pX, pY, random(width), random(height));
      }
    } else {
      // randomly change "colorPicker" and draw ellipse
      colorPicker = (int) random(3);      
      ellipse( pX, pY, w, h );
    }
    
    // program ellipse to follow mouse cursor
    if ( pX < mouseX ) pX = pX + s;
    if ( pX > mouseX ) pX = pX - s;
    if ( pY < mouseY ) pY = pY + s;
    if ( pY > mouseY ) pY = pY - s;
  }
}

class snow {

  int dotCap, dotColor, dotWeight, dotAmt;
  int[] dotX; 
  int[] dotY;

  snow( int flakePos, int flakeColor, int flakeWeight, int flakeDensity ) {
    dotCap = flakePos;
    dotColor = flakeColor;
    dotWeight = flakeWeight;
    dotAmt = flakeDensity;
    
    dotX = new int[dotCap];
    dotY = new int[dotCap];
    
    for ( int i = 0; i < dotCap; i++ ) {
      dotX[i] = i*width/dotCap;
      dotY[i] = i*height/dotCap;
    }
  }

  void update() {
    stroke(dotColor);
    strokeWeight(dotWeight);
    for ( int i = 0; i < dotAmt; i++) {
      point( dotX[(int) random(dotCap)], dotY[(int) random(dotCap)]);
    }
  }
}
class wallpaper {
  // define variables
  int mode;
  
  // constructor
  wallpaper() {
    mode = 0;
  }

  // update function
  void update() {
    
    // change background color on mouse click
    for ( int i = 0; i < width; i++ ) {
      colorMode(RGB, width, width, width);  // custom color mode for sketch width
      if(mode == 0) stroke(0, 0, i, 100);
      if(mode == 1) stroke(i/2, 0, i, 100);
      if(mode == 2) stroke(0, 0, 0, 100);
      line( i, 0, i, height );
    }
  }
}

// initialize classes
wallpaper w1;
snow s1;
chaser c1;

// sketch setup
void setup() {
  size(400, 400);
  w1 = new wallpaper();
  s1 = new snow( 100, 255, 5, 3 );
  c1 = new chaser( 25, 25, 3, 255, 200 );
  
  
}

// update functions for each class
void draw() {
  w1.update();
  s1.update();
  c1.update();
} 

// mousePressed function to change wallpaper mode and background color
void mousePressed() {
  if(w1.mode < 2) w1.mode = w1.mode + 1;
  else w1.mode = 0;
}




