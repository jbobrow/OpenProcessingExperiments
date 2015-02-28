
// Andy Warhol effect for an image

PImage bild;
PFont font;

color col_orig;
color black = color(0,0,0);

float limit1 = random(150,200);
float limit2 = random(200,255);
int mouse_active = 1;

int bild_width = 817;
int bild_height = 543;

int dimension = bild_width * bild_height;

// generate 2 random colors
color randomcol01 = color(random(255),random(255),random(255));
color randomcol02 = color(random(255),random(255),random(255));


void setup() {
  /*
   Defines the dimension of the display window in units of pixels. 
   The size() function must be the first line in setup(). 
   If size() is not called, the default size of the window is 100x100 pixels. 
   The system variables width and height are set by the parameters passed to 
   the size() function.

   Do not use variables as the parameters to size() command, 
   ---------------------------------------------------------
   because it will cause problems when exporting your sketch. 
   When variables are used, the dimensions of your sketch cannot 
   be determined during export. Instead, employ numeric values in 
   the size() statement, and then use the built-in width and height 
   variables inside your program when you need the dimensions of the 
   display window are needed. 
   */
   
  size(817,543);
    
  bild = loadImage("mando.jpg");
  image (bild,0,0);
  
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("ABC1Vari-48.vlw"); 
  textFont(font); 

  }

void draw () {
  loadPixels();
  bild.loadPixels();
  
  limit1 = mouseX*255/bild_width;
  limit2 = limit1 + (255-limit1)*mouseY/bild_height;
  
  // if mouse_activ1 = 1 set the color of pixels
  // for the different ranges defined by the limit
  
  if ( mouse_active == 1 )
    {
      
      for (int i=0; i < dimension; i+=1) { 
      col_orig = bild.pixels[i];
    
        if ( brightness(col_orig) < limit1 ){
          pixels[i] = black; 
        }
    
        if ( brightness(col_orig) > limit1 & 
          brightness(col_orig) < limit2 ){
          pixels[i] = randomcol01; 
        }
  
        if ( brightness(col_orig) > limit2 ){
          pixels[i] = randomcol02; 
        }
      }
  
    updatePixels();
   }
  
  // display some text //
  fill(randomcol01);
  text("Mandoline", 550, 80);
  fill(randomcol02);
  text("Mandoline", 60, 500);
  
  // optionally display the values for limit1 and limit2
  // fill(255,255,255);
  // text(limit1,80,400);
  // text(limit2,80,450);

}


void mouseClicked() {
  // switch on/off mouse effect
  if ( mouse_active == 1 ) 
    { mouse_active = 0; }
    else
    { mouse_active = 1; }
}

