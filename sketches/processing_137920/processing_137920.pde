
// Introduction to Computational Arts: Processing - Project.
//
// The sketch represents randomness is both creation and purpose.
// An image is modfied, updated, degraded, by using a mouse to helpo guide the 
// effect, but the effect has a large random element, so it cannot be 
// accurately used. 
//
// Jeff Tomlinson - March 2014


float dotSize = 4;          // Size of the dots (1=1 pixel).
boolean display = false;    // Display dots when true

int cnt = 0;                // Counter for screen saving.
int spd = 256;              // Speed of plotting the dots (size of loop in draw function)

float xPos, yPos;           // X and Y positions.
float mX, mY;               // Last clicked mouse position

PImage basePic;             // The picture to work on.
int scrHeight, scrWidth;    // Screen dimensions
color currPixel;            // Current pixel for colour information
boolean update = false;     // 
int effectSize = 1;         // Amount of change in colour etc.
int pType = 1;              // Currently selected type of operation on the image

void setup() {
  // Load the Cake picture
  basePic = loadImage("cake.jpg");
  
  // Get the image dimensions and set the size of the canvas to match the size
  // of the image, providied that it is within the dimension restrictions
  // of the assignment.
  scrHeight = constrain(basePic.height,600,720);
  scrWidth = constrain(basePic.width,800,1280);
  size(scrWidth, scrHeight);
  
  // Display the image as the background.
  background(basePic);

  // Default position is the center of the canvas. 
  xPos = width/2;       
  yPos = height/2;
  mX = xPos;
  mY = yPos;  
  
  // HLS color  mode.
  colorMode(HSB, 360, 100, 100, 100); 
  smooth();
  noStroke();
  println("Press 'x' or mouse click to start the display");
}

void draw() {
    // Only display is the display boolean is set.
    if (display) {

    // SPD controls the speed of the output.  The higher the value the more 
    // dots are plotted within the draw function which results is faster 
    // plotting. 
    for (int i=1; i<spd; i+=1) {

        // Based on a random number, select the direction to place the next 
        // dot/circle.  0->North, 1->North west etc. 
        switch((int) random(0, 8)) {
            case 0 : 
                yPos -= dotSize;    
                break;
            case 1 :
                xPos += dotSize;
                yPos -= dotSize;
                break;
            case 2 :
                xPos += dotSize;
                break;
            case 3 :
                xPos += dotSize;
                yPos += dotSize;
                break;
            case 4 :
                yPos += dotSize;
                break;
            case 5 :
                xPos -= dotSize;
                yPos += dotSize;
            break;
                case 6 :
                xPos -= dotSize;
                break;
            case 7 :
                xPos -= dotSize;
                yPos -= dotSize;
                break;
            default:
                println("Should not get here");
        }

        // Update the X position and add a bias towards moving towards the mouse
        // ensure that it stays within the boundaries (issues with constrain?)
        xPos = xPos+constrain(0.001*(mouseX-xPos),-1,1);
        if (xPos > width ) xPos = width;
        else if (xPos <= 0 ) xPos = 0;

        // Update the Y position with a bias towards the mouse
        yPos = yPos+constrain(0.001*(mouseY-yPos),-1,1);
        if (yPos > height) yPos = height;
        else if (yPos <= 0) yPos = 0;

        // Prepare to output the next dot/circle ...
        noStroke();  
        colorMode(RGB,255,255,255,100);

        // Get the colour of the current pixel in both RGB and HSB mode.
        currPixel = get(int(xPos), int(yPos));
        float lRed=red(currPixel);
        float lGreen = green(currPixel);
        float lBlue = blue(currPixel);
        float lTrans = alpha(currPixel);

        colorMode(HSB,360,100,100,100);
        float lHue=hue(currPixel);
        float lSat=saturation(currPixel);
        float lBright=brightness(currPixel);

        // 1 = Desaturate, except for the RED areas.         
        if (pType == 1) {       
            if (lRed > 100 && lGreen < 20 && lBlue < 20) {
                lRed = constrain(lRed+2*effectSize,0,255);
                lGreen = constrain(lGreen-effectSize,0,255);
                lBlue = constrain(lBlue-effectSize,0,255);
                fillStrokeR(lRed,lGreen,lBlue, lTrans);
            }
            else {
                fillStrokeH(lHue,constrain(lSat-effectSize,10,100),lBright, lTrans);
            }
        }
        
        // 2 = Swap RED -> GREEN, GREEN -> BLUE, BLUE -> RED
        if (pType == 2) {
            fillStrokeR(lBlue, lRed, lGreen,lTrans);
        }

        // 3 = Make Green
        if (pType == 3) {
            fillStrokeR(lRed,constrain(lGreen+effectSize,0,255),lBlue, lTrans);
        }

        // 4 = Desaturate
        if (pType == 4) {
            fillStrokeH(lHue,constrain(lSat-effectSize,10,100),lBright, lTrans);
        }

        // 5 = Increase saturation and brightness
        if (pType == 5) {
            fillStrokeH(lHue, constrain(lSat+effectSize,10,100)
                            , constrain(lBright+effectSize,10,100), lTrans);
        }
        // 6 = Roatate thru' the hues. 
        if (pType == 6) {
            lHue=lHue+effectSize;
            if (lHue > 360) {
                lHue = 0;
            }
            fillStrokeH(lHue,lSat,lBright, lTrans);
        }
        
        // 7 = Increase brightness
        if (pType == 7) {
            fillStrokeH(lHue,lSat,constrain(lBright+effectSize,10,100), lTrans);
        }

        // 8 = Decrease brightness
        if (pType == 8) {
            fillStrokeH(lHue,lSat,constrain(lBright-effectSize,10,100), lTrans);
        }

        if (dotSize > 1) {
            ellipse(xPos, yPos, dotSize, dotSize);
        } 
        else {
            point(xPos, yPos);
        }

        }
    }
}

// Process and update colour for HSB
void fillStrokeH(float ht, float sg, float bb, float tt) {
    colorMode(HSB,360,100,100,100);
    fill(ht,sg,bb, tt);
    stroke(ht,sg,bb, tt);
}

// Process and update colour for RGB
void fillStrokeR(float ht, float sg, float bb, float tt) {
    colorMode(RGB,255,255,255,100);
    fill(ht,sg,bb, tt);
    stroke(ht,sg,bb, tt);
}

// Mouse pressed,  draw a new circle around mouse coordinates
void mousePressed() {
  mX = mouseX;
  mY = mouseY;
  display = !display;
  println("[Mouse]: Display ", display);
}

// Control functions - lowercase letters and backspace to clear the screen.
void keyReleased(){
    switch(key) {
      case BACKSPACE :       // Clear the screen 
        background(#FFFFFF);
        background(basePic);
        break;
      case 's' :            // Save a PNG image
        cnt +=1;
        saveFrame("proj_save"+cnt+".png");
        println("s: Image : proj_save"+cnt+".png saved.");
        break;
      case 'p' :            // Increase the speed of the dots
        spd = constrain(2*spd,2,4096);
        println("p: Increase SPEED to ", spd);
        break;
      case 'm' :            // Decrease the speed of the dots.
        spd = constrain(spd/2,2,4096);
        println("m: Decrease SPEED to ", spd);
        break;      
      case 'e' :            // Increase the size of the effect
        effectSize = constrain(effectSize+1,1,10);
        println("e: Increase Effect Size to ", effectSize);
        break;
      case 'd' :            // Decrease the size of the effect
        effectSize = constrain(effectSize-1,1,10);
        println("d: Decrease Effect Size to ", effectSize);
        break;      
      case 'q' :            // Increase the dot size.
        dotSize = constrain(dotSize+1,1,32);
        println("q: Increase Dot Size to ", dotSize);
        break;      
      case 'a' :            // Decrease the dot size.
        dotSize = constrain(dotSize-1,1,32);
        println("a: Decrease Dot Size to ", dotSize);
        break;      
      case 'x' :            // Toggle display
        display = !display;
        println("x: Display ", display);
        break;
      case '1' :
        pType = 1;
        println("1 = Desaturate, except for the RED areas");
        break;
      case '2' :
        pType = 2;
        println("2 = Swap RED -> GREEN, GREEN -> BLUE, BLUE -> RED");
        break;
      case '3' :
        pType = 3;
        println("3 = Greenify");
        break;
      case '4' :
        pType = 4;
        println("4 = Desaturate"); 
        break;
      case '5' :
        pType = 5;
        println("5 = Increase saturation and brightness");
        break;
      case '6' :
        pType = 6;
        println("6 = Rotate thru' the colour hues");
        break;
      case '7' :
        pType = 7;
        println("7 = Increase brightness");
        break;
      case '8' :
        pType = 8;
        println("8 = Decrease brightness");
        break;
    }    
}


