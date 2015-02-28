
/*
Rose Curves, based on : http://funprogramming.org/122-Programming-roses-and-other-flowers.html
 See the math inside at: http://en.wikipedia.org/wiki/Rose_%28mathematics%29
 
 Had to boost the framerate to allow a faster rendering of the whole shape. 
  Right Click & drag in some of the color formulas sets the range for a new partial colouring.
 
 1 increases the dividend, d1
 q decreases the dividend, d1
 2 increases the divisor, d2.
 w increases the divisor, d2.
 t increases dot size to a max of 10 
 b toggles the background
 i / k chages the drawing formula (aka "complexity", even if improper)
 j / l changes the stroke color formula. Don't know why it's buggy with processing.js 
 R resets
 S Saves a frame
 */

int d1=1;              // Dividend
float d2=2.0;          // Divisor
float k = d1/d2;       // Quotient  
float s = 2;           // Stroke Size (prior to scale) 
float l = 0.34;        // lower color limit, mouseX controlled
float m = 0.90;        // higher color limit, mouseY controlled 
int currentFunc = 0;   // default drawing function, case 0 in getCoords below
int totalFunc = 7;     // number of available functions
int strokeMode = 4;    // coloring method, see setStroke function below
String strokeDesc= ""; // init empty string to store stroke description
boolean bgSet = false; // toggles the useless background added just for fun
//PImage polar;


void setup() {
  size(600, 620);
  colorMode(HSB, 360, 100, 100, 100);
  /*
  Default framerate is 60, but it's far too slow for this sketch... also note that setting it this high
  makes impossible to use keyPressed, as it would sample the key input too often. 
  */
  frameRate(6000); 
  /*
  Loading Background from URL
  */
  //  String url="http://static4.grsites.com/archive/textures/ss/ss122.gif";
  //  polar = loadImage(url, "gif");
  bg();
}

void draw() {
  strokeWeight(s);
  float k = d1/d2;
  float t = frameCount;
  float[] coords = getCoords( k, t, currentFunc ); //call to function to return x
  setStroke ( k, t, strokeMode ); //call to function to set the stroke mode
  //String l1 = str(l); // an attempt to trim the floats values to 4 characters for log bar readability
  //l1 = l1.substring(0,5);
  //String m1 = str(m);
  //m1 = m1.substring(0,5);  
    if (mousePressed && (mouseButton == LEFT)) {
    l = map(mouseX, 0, width, -1, 1);  //scaling mouseX and mouseY in the -1,+1 range
    m = map(mouseY, 0, height-20, -1, 1);
  }

  point(300+map(coords[0],-1,+1,-290,290), 300+map(coords[1],-1,+1,-290,290));  //this does all the drawing job!

  //bottom log strip
  noStroke();
  fill(360, 0, 100, 100);
  rect(0, height-20, width, height); //text background
  fill(360, 100, 100, 100);
  textSize(10);
  
  text("D1: "+d1+ "  D2: "+int(d2)+ "  L: " +l+ "  M: "+m+"  Complexity: "+currentFunc+"  stroke: "+s+" Stroke Mode: "+strokeMode+", "+strokeDesc, 5, height-5);

} //end void draw()

void bg() {
  if (bgSet)
  {
//   image(polar, 0, 0, 800, 800);
//   filter(GRAY);
  }  
  else
  {
    background(0);
  }
}

/* 
 Function getCoords: it gets k and t as input, and currentFunc as switcher. 
 Returns an array with the x and y coordinates for each plotted dot based on the various trigonometric formulas.
 Feel free to experiment by adding more formul pairs or by variating the existent ones. 
 If you add more also change the Global var "totalFunc" accordingly, declared at the beginning.
 */

float[] getCoords(float k, float t, int currentFunc) {
  float[] coords = new float[2];
  switch(currentFunc) {
  case 1: 
    {
      coords[0] = cos(k/t) * sin(t); // x
      coords[1] = cos(k*t) * cos(t); // y
      return coords;
    }
  case 2: 
    {
      coords[0] = cos(sin(k*t)) * sin(t); 
      coords[1] = sin(cos(k*t)) * cos(t);
      return coords;
    }
  case 3: 
    {
      coords[0] = cos(cos(k*t)) * sin(t);
      coords[1] = cos(cos(k*t)) * cos(t); 
      return coords;
    }
  case 4: 
    {
      coords[0] = cos(k*k*t) * sin(t);
      coords[1] = cos(k*k*t) * cos(t); 
      return coords;
    }
  case 5: 
    {
      coords[0] = pow(cos(k*t), 3) * pow(sin(t), 3);
      coords[1] = pow(cos(k*t), 3) * pow(cos(t), 3); 
      return coords;
    }
  case 6: 
    {
      coords[0] = cos(k*k*t) * tan(t);
      coords[1] = cos(k*k*t) * atan(t);
      return coords;
    }
  case 7: 
  default: 
    {
      //      coords[0] = sq(cos(k*t)) * sin(t); //blueprint
      //      coords[1] = sq(cos(k*t)) * cos(t);
      coords[0] = cos(k*t) * sin(t) * cos(t/k);
      coords[1] = cos(k*t) * cos(t) * cos(t/k);
      return coords;
    }
  case 0: 
    {
      coords[0] = cos(k*t) * sin(t); 
      coords[1] = cos(k*t) * cos(t);
      return coords;
    }
  }
}

/*
Function setStroke: gets K and T and sets the way the dots are colored based on different formulas inside stroke()
 */

void setStroke (float k, float t, int strokeMode) {
  switch(strokeMode) {

  case 0:
  default:
    stroke(360, 100, 100, 100);  // red stroke
    if (sq(sq(sin(k*t))) < l || sq(sq(sin(k*t))) > m ) {
      stroke(50, 100, 100, 50); // draw yellow dots instead of red ones
    }
    strokeDesc = "Red with yellow on MouseClick";
    break;

  case 1:
    stroke(360, 100, sq(sin(k*t))*100+20, 100); // Red stroke with brightness fade
    if (sq(sq(sin(k*t))) < l || sq(sq(sin(k*t))) > m ) {
      stroke(50, 100, sq(sin(k*t))*100+20, 50); // draw yellow dots with brightness fade instead of red ones
    }
    strokeDesc = "Red/yellow on MouseClick with brightness fade";
    break;

  case 2:
    stroke(sin(sin(k*t))*60, 100, sq(sin(k*t))*100+10, 100); //Red and Yellow alternate strokes
    strokeDesc = "Red/yellow faded, alternate branches";
    break;

  case 3:
    stroke(360*sq(sin(k*k*t)), 100, sq(sin(k*t))*100+20, 100);  // hue stroke
    if (sq(sin(k*t)) < l || sq(sin(k*t)) > m ) {
      stroke(720*sq(sin(k*k*t)), 100, 10+90*sin(k*t), 50); // draw hue stroke with variable brightness and halved hue
    }
    strokeDesc = "Hue, alternate branches, brightness on MouseClick";  
    break;

  case 4:
    stroke(360*sq(sin(k*t)), 100, sq(cos(k*t))*90+10, 100);
    strokeDesc = "Hue, bright harlequin"; 
    break;

  case 5:
    stroke(200, 0, 10+90*sq(sin(k*t)), 100); 
    if (sq(sq(sin(k*t))) < l || sq(sq(sin(k*t))) > m ) {
      stroke(200, 100, 10+90*sq(sin(k*t)), 100); // draw yellow dots instead of red ones
    }
    strokeDesc = "Greyscale with blue on MouseClick";
  }
}

void keyReleased() {
  switch(key) {
  case 'i':
  case 'I':
    if (currentFunc < totalFunc ) {
        currentFunc++;
        bg(); 
        redraw();
    }
  break; 
  case 'k':
  case 'K':
    if (currentFunc > 0 ) {
        currentFunc--;
        bg();
        redraw();
    }
  break; 
  case 'j':
  case 'J':
    strokeMode -=1;
    if (strokeMode < 1) {    
        strokeMode = 1;
    }
  break;   
  case 'l':
  case 'L':
    strokeMode +=1;
    if (strokeMode > 5) {    
        strokeMode = 1;
    }
  break;

  /*  
  commented as it doesn't work in processing.js. No idea why, if you have hints help me with a comment please.
  case CODED:
    if (key == UP || keyCode == DOWN) { //doesn't work on processing.js
      if (keyCode == UP) {
        if (currentFunc < totalFunc ) {
          currentFunc++;
          bg(); 
          redraw();
        }
      } 
      else {
        if (currentFunc > 0 ) {
          currentFunc--;
          bg();
          redraw();
        }
      }
    }
    if (keyCode == LEFT || keyCode == RIGHT) {
      if (keyCode == LEFT) {
        if (strokeMode >0) {
          strokeMode--;
          strokeMode = strokeMode % 6;
        }
      } 
      else {
        strokeMode++;
        strokeMode = strokeMode % 6;
      }
    }
    break; 
    */
  case '1':
    bg();
    d1++;
    break;
  case 'q':
  case 'Q':
    bg();
    d1--;
    break;
  case '2':
    bg();
    d2++;
    break; 
  case 'w':
  case 'W':
    bg();
    d2--;
    break; 
  case 't': // increases stroke weight (dots size) to a max of 0.030.
  case 'T':
    s += 1;
    if (s > 10) {
      s = 1;
    }
    break; 
  case 'b': // Toggles image or black background. Disabled the image background for processing.js version but left the function for reference.
  case 'B':
    if (bgSet)
    {
      bgSet = false;
    }  
    else
    {
      bgSet = true;
    }
    bg();
    break;
  case 'r': // reset / redraw
  case 'R':
    d1=1;
    d2=2.0;
    bg();
    redraw();
    break;
  case 's': //save
  case 'S':
    println("Saved screenshot: Rose_d1-"+d1+"_d2-"+int(d2)+"_C-"+currentFunc+"_S-"+strokeMode+"_####.png");
    saveFrame("Rose_d1-"+d1+"_d2-"+int(d2)+"_C-"+currentFunc+"_S-"+strokeMode+"_####.png");
    break;
  }
}

