
//PATTERNS
//The code generates a canvas with a random pattern based in rectngles and columns 
//*Pressing some keys we can control the size of every variable:
//*"q"-"a", "w"-"s", "e"-"d", "r"-"f", "t"-"g", "y-"h", "u"-"j"
//*When mouse pressed saves a TIFF

//Written by Paco Rico with Processing. 
//pacorico.com

float rectx;
float recty;
float colx;
float intx;
float inty;
float scaleG;
float rotationG;

void setup() {
  size(500,500);
  background(255);
  scaleG =1; // scale
  rectx =random(14, 24); // width of black rectangle
  recty =random(14, 24);  // height of black rectangle
  intx =rectx*random(1.1, 2.9); // width separation between rectangles
  inty =recty*random(1.1, 2.9);  //height separation between rectangles
  colx=rectx*random(.1, .9); // column width
  float rotationG = 0.0; //rotation
}

void draw() {

//the real loop
background(255);
  for (int i = -2*width; i < 2*width; i = i+int(intx)) {
  for (int j = -2*height; j < 2*height; j = j+int(inty)) {

    pushMatrix();
    translate (width/2, height/2);
    fill(0);
    scale(scaleG);
    rotate(rotationG);
    // translate(width/2,height/2);
    rect (i, j, rectx, recty);
    fill(0);
    rect ((i+(rectx/2-colx/2)), -2*height, colx, 4*height);

    popMatrix();

  }
} 
}

void keyPressed() {
    if (key == 'q' || key == 'Q') {colx++;
    } 
    else if (key == 'a' || key == 'A') {colx--;
    }
    if (key == 'w' || key == 'W') {rectx++;
    } 
    else if (key == 's' || key == 'S') {rectx--;
    }
    if (key == 'e' || key == 'E') {recty++;
    } 
    else if (key == 'd' || key == 'D') {recty--;
    }
    if (key == 'r' || key == 'R') {intx++;
    } 
    else if (key == 'f' || key == 'F') {intx--;
    }
    if (key == 't' || key == 'T') {inty++;
    } 
    else if (key == 'g' || key == 'G') {inty--;
    }
    if (key == 'y' || key == 'Y') {scaleG+=.05;
    } 
    else if (key == 'h' || key == 'H') {scaleG-=.05;
    }
    if (key == 'u' || key == 'U') {rotationG+=.05;
    } 
    else if (key == 'j' || key == 'J') {rotationG-=.05;
    }
    if (key == 'p' || key == 'P') {saveFrame();
    } 
    
  redraw();
}
