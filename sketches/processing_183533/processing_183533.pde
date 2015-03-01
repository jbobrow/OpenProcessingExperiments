
class chaser {
  // define variables
  int w, h, s, cR, cG, cB, pX, pY, transp, limXp, limXn, limYp, limYn;
  int colorPicker;

  // constructor
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

    
    stroke(0);
    fill( cR, cG, cB, transp );

    if ( limXp > mouseX && limXn < mouseX && limYp > mouseY && limYn < mouseY ) {
      stroke( 0, 0 );
      fill( cR, cG, cB, 0 );
      stroke( 0, 255);
      strokeWeight( .5 );
      for ( int i = 0; i < 256; i++ ) {
        if ( colorPicker == 0) {
          stroke( random(15, 60), random(60, 120), random(100, 600), 150 );
        }
        if ( colorPicker == 1) {
          stroke( random(15, 60), random(100, 600), random(120, 165), 150 );
        }
        if ( colorPicker == 2) {
          stroke( random(60, 600), random(60, 120), random(15, 60), 150 );
        }
        line( pX, pY, random(width), random(height));
      }
    } else {
      colorPicker = (int) random(3);
      ellipse( pX, pY, w, h );
    }

    if ( pX < mouseX ) pX = pX + s;
    if ( pX > mouseX ) pX = pX - s;
    if ( pY < mouseY ) pY = pY + s;
    if ( pY > mouseY ) pY = pY - s;
  }
}

chaser c1;

void setup() {
  size(400, 400);
  background( 229, 229, 229);
  c1 = new chaser( 25, 25, 3, 133, 90, 191, 200 );
}

void draw() {
  c1.update();
} 

void mousePressed() {
  background( 229, 229, 229);
  c1.pX = (int) random(width);
  c1.pY = (int) random(height);
  delay(500);
}



