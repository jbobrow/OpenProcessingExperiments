
/* This is a program that creates a double helix with random color when and where 
  the  mouse is clicked. If a number is pressed on the keyboard, the screen is cleared.
  If a letter is pressed on the keyboard, the camera will start or stop rotating,
  and this will effect the way helixes are drawn. If the camera is rotating
  when the mouse is clicked, it will create a curving double helix shape.
*/

/****************************************************************************/

import processing.opengl.*;
float thetaCamera = 0.0;
boolean rotateCamera = false;
//initial double helix is the same color as the background
float sphereColor1 = 0;
float sphereColor2 = 0;
float sphereColor3 = 0;
int helixWidth = 120;
int helixLength = 800;
float z = 0.0;
float theta = 0.0;
float xLocation = width/2.0;
float yLocation = height/2.0;


void setup() {
  size(700,700,OPENGL);
  smooth();
  background(0);
  frameRate(30);
  camera(width/2.0, height/2.0, 800, width/2.0, height/2.0, 0, 0, 1, 0);
}

void draw() { 
  lights();    
  // Rotate camera eye 360 degrees if any letter is pressed on the keyboard.
  float eyeX = 800 * cos(thetaCamera) + 350;
  float eyeZ = 800 * sin(thetaCamera);
  thetaCamera += ((float)mouseY / 9600.0);
  if (rotateCamera == true) {
    camera( eyeX, height/2.0, eyeZ,         // eyeX, eyeY, eyeZ
           width/2.0, height/2.0, 0.0, // centerX, centerY, centerZ
           0.0, 1.0, 0.0);             // upX, upY, upZ
  }

  drawHelix ();
}

void drawHelix () {
    z += 20;
    if (z <= helixLength) {
      //theta and xCos and ySin build the isometric rotation
      theta += PI/12;
      float xCos = cos(theta);
      float ySin = sin(theta);   
      /* To create the double helix, the helixWidth must be divided by 2 here. 
       That's because the first translation only has to move from the center 
       of the spiral to the edge (radius), whereas the second translation has 
       to move all the way across the spiral's width (diameter).  */  
      noStroke();
      translate(helixWidth/2 * xCos + xLocation,helixWidth/2 * ySin + yLocation,z);
      fill(sphereColor1,sphereColor2,sphereColor3);
      sphere(12);
      
      //sphere #2 
      translate(-helixWidth * xCos,-helixWidth * ySin,0);
      fill(sphereColor2,sphereColor3,sphereColor1);
      sphere(12);

      // draw line connecting two spheres
      stroke(sphereColor3,sphereColor1,sphereColor2);
      line(0,0,0,helixWidth * xCos, helixWidth * ySin,0);
    }
}

//creates new double helix with random color
void mousePressed() {
    xLocation = mouseX;
    yLocation = mouseY;
    z = 0.0;
    theta = 0.0;
    sphereColor1 = random(185) + 70;
    sphereColor2 = random(185) + 70;
    sphereColor3 = random(185) + 70;
}

/* toggles camera rotation on/off when letters are pressed on the keyboard,
   and clears the screen when non-letters are pressed on the keyboard.*/
void keyPressed() {
    int keyIndex = -1;
    //finding out if it's a letter or not
    if (key >= 'A' && key <='Z') {
        keyIndex = key - 'A';
    }  else if (key >= 'a' && key <= 'z') {
          keyIndex = key - 'a';
    }
    //if it's not a letter key, clear the screen;
    if (keyIndex == -1) {
      background(0);
    }
    //if it is a letter, turn camera rotation on or off
    else {
        if (rotateCamera == true) rotateCamera = false; 
          else rotateCamera = true;
    }   
}

