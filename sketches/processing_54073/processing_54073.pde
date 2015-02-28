
// SET GLOBAL VARIABLES
int x = 2;
float rgbRed = random(255);
int rgbGreen = 205;
int rgbBlue = 0;
float ellipseSize = 50;
float ellipseSize2 = 75;
float opacity = 50;
int m,y,siz;
Tunnel myTunnel;
Flashlight myFlashlight;

// CREATE PDF
import processing.pdf.*;
PGraphicsPDF pdf;

void setup () {
  size (501,501);
  pdf = (PGraphicsPDF)beginRecord(PDF, "Tunnel.pdf");
  beginRecord (pdf);
  smooth ();
}

void draw () {
  Tunnel myTunnel = new Tunnel (rgbRed, rgbBlue, rgbGreen);
  myTunnel.drawTunnel ();
  Flashlight myFlashlight = new Flashlight ();
  myFlashlight.drawFlashlight ();
}

// CAPTURE CURRENT SCREEN TO PDF   
void mousePressed() {
  pdf.nextPage ();
}

// FLASHLIGHT CLASS
class Flashlight {
  int a,b,c,d;
  
  Flashlight () {
    a = mouseX;
    b = mouseY;
    d = 255;
  }
  
  void drawFlashlight () {
    fill (d,d,d, opacity);
    rectMode (CORNER);
    ellipse (a,b,ellipseSize,ellipseSize2);
    
    if (mouseX < 250) {
      ellipseSize = 250 - mouseX;
    } else {
      ellipseSize = mouseX - 250;
    }
    
    if (mouseY < 250) {
      ellipseSize2 = 250 - mouseY;
    } else {
      ellipseSize2 = mouseY - 250;
    }
  }
}

// TUNNEL CLASS
class Tunnel {
  int h,z,t,u;
 
  Tunnel (float pRed, float pBlue, float pGreen) {
    h = 500;
    z = 0;
    t = 240;
    u = 260;
    float rgbRed = pRed;
    float rgbBlue = pBlue;
    float rgbGreen = pGreen;
  }
  
  void drawTunnel () {
    for (int i = 0; i < 250; i += 10) {
    fill (rgbRed-i,rgbGreen-i,rgbBlue); // If I click O
    rect (i,i,500-(i*x),500-(i*x));
    drawLines (h,z,t,u);
    }
    }
  }

// DRAW LINES FUNCTION
void drawLines (int h, int z, int t, int u) {
  strokeWeight (1);
  fill (255,222,13);
  line (z,z,t,t);
  line (h,h,u,u);
  line (z,h,t,260);
  line (h,z,u,t);
}

// KEYPRESSED FUNCTION
void keyPressed () {
  if (keyPressed) {
  if (key == 'l' || key =='L') {        // CLICK 'L' FOR LIME
    rgbRed = 156;
    rgbGreen = 247;
    rgbBlue = 0;
} else if (key == 'r' || key == 'R') {  // CLICK 'R' FOR RED
    rgbRed = 225;
    rgbGreen = 0;
    rgbBlue = 0;
} else if (key == 'g' || key == 'G') {  // CLICK 'G' FOR GREEN
    rgbRed = 0;
    rgbGreen = 234;
    rgbBlue = 1;
} else if (key == 'y' || key == 'Y') {  // CLICK 'Y' FOR YELLOW
    rgbRed = 247;
    rgbGreen = 200;
    rgbBlue = 0;
} else if ( key == 'o' || key == 'O') { // CLICK 'O' FOR ORANGE
    rgbRed = 234;
    rgbGreen = 106;
    rgbBlue = 0;
} else if (keyCode == UP) {             // CLICK UP TO INCREASE FLASHLIGHT OPACITY
    if (opacity > 100) {
      opacity = 100;
    } opacity +=5;
} else if (keyCode == DOWN) {           // CLICK DOWN TO DECREASE FLASHLIGHT OPACITY 
    if (opacity < 0) {
      opacity = 0;
    } opacity -= 5;
} else if (key == 'x' || key == 'X') {  // CLICK X TO END RECORD
    endRecord ();
    exit ();
    }
  }
}


