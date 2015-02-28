
// DIGITAL GARDEN

/*
Instructions:
Click to expose the underlying photograph
Press the space bar to cycle through the images
*/

// set up our variables
PImage ss;
int sw, sh;
float mx, my, dx, dy;

int rand;
int fade;
int count;
int expand = 0;

float dopop=1.0;
float dofade=1.0;

boolean transition = false;
boolean click = false;

float maxsize;
float strokealpha;
float modify;

float dist;
float ourX; 
float ourY;

float root50000 = sqrt(50000.0); 


void setup(){
  size(500, 375, P2D);
  background(255);
  noSmooth();

  // load a random image from the first 4 (best) images
  rand = (int)Math.floor(random(1,4));
  ss = loadImage("flower"+rand+".jpg");
  ss.loadPixels();

  sw = ss.width;
  sh = ss.height;

  // add to the color components to make the screen black
  fade = -255;

  // set up our drawing parameters
  noFill();
  ellipseMode(CENTER);

}

void draw(){

  // smooth the mouse data
  // courtesy of Golan
  float A = 0.67;
  float B = 1.0-A;
  mx = A*mx + B*mouseX;
  my = A*my + B*mouseY;
  ourX = mx;
  ourY = my;

  // show the original image
  if (click) 
    image(ss, 0, 0);
  
  // show the interpreted image
  else {
    // fade the image up
    if (fade<0)
      fade = fade + 51;
    
    // if we're cycling between photos
    if (transition) {
      // slowly destroy the image resolution
      count++;
      dopop++;
      // only drop to alpha every other cycle
      if (count%2==0) dofade++;
      expand+=2;

      // once we've gone through ten cycles 
      // pop everything back into focus
      if (count > 10) {
        fade = -255;
        ss = loadImage("flower"+rand+".jpg");  // new flower
        ss.loadPixels();
        transition=false;
        count = expand = 0;
        dopop = dofade = 1.0;
      }
    }

    // wipe the background
    background(0);

    // use a variable to expand the grid
    // during transitions
    for (int y=0; y<sh; y+=(7+expand)){
      for(int x=0; x<sw; x+=(7+expand)){
        
        // get the color on our grid and calculate the brightness
        color c = getColorAtXYFromImage(x, y, ss);
        float w = (red(c) + green(c) + blue(c))/3.0;

        float s = w/255.0; // number between 0 - 1

        // get the distance between the pixel and the mouse
        dx = x - ourX;
        dy = y - ourY;
        dist = sqrt(dx*dx + dy*dy);

        // how far can the pixel be away from the mouse?
        modify = dist/root50000; // number between 0 and 1

        // the maximum size of the ellipses
        // the alpha of the ellipses
        maxsize = 10 + 90*modify;
        strokealpha = 102 - 51*modify;

        // size of the ellipse
        s*=maxsize;
        
        // dopop and dofade are normally set to "1"
        // we increment them during transitions
        s*=dopop;
        strokealpha /= dofade;

        if (s < 20) smooth(); // only smooth the small ellipses
        else noSmooth();
        
        // write the ellipse to the screen
        // the fade variable ranges from 0 to -255
        stroke(red(c)+fade,green(c)+fade,blue(c)+fade, strokealpha);
        ellipse(x,y,s,s);
      }
    }
  }
}

// our standard color-retrieval function
color getColorAtXYFromImage(int x, int y, PImage img){
  int maxloc= img.width*img.height;
  int loc = (y * img.width) + x;
  if (loc < maxloc){
    return img.pixels[loc];
  } else {
    return 0;
  }
}

// used to cycle between the before and after images
void mousePressed() {
  click = true;
}
void mouseReleased() {
  click = false;
}

void keyPressed() {
  // I could constrain this to the space key
  // but it's not really necessary
  rand++;
  if (rand>10) rand=1;
  transition = true;
}

