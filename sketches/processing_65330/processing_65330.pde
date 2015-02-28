
// produce some randomize effect on an image
// start with big circles, draw random points, and reduce radius 
// the detail structure of the image is developping slowly

PImage bild;
PFont font;

color col_orig;
color col01, col02,colnew;
color black = color(0,0,0);

int x_1,x_2;
int y_1,y_2;
int x_pos1,y_pos1, x_pos2, y_pos2;
int mouse_active = 1;

int bild_width = 817;
int bild_height = 543;
int bild_sqr_sum = bild_width*bild_width+bild_height*bild_height;

int dimension = bild_width * bild_height;

// int anzahl01 = 0;
// float radius01 = 3;
// float rdecrease = 1.0;
float b01,b02;

// color randomcol01 = color(random(255),random(255),random(255));
// color randomcol02 = color(random(255),random(255),random(255));


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
  colorMode(HSB, 100);
    
  // Lade Bilde
  bild = loadImage("mando.jpg");
  // zeige das Bild
  image (bild,0,0);
  
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("ABC1Vari-48.vlw"); 
  textFont(font); 

  }

void draw () {
        
        for (int i=1; i < 542; i+=1 )
        {
          y_1 = i;
          y_2 = i+1;
        
        for (int j=1; j < 817; j+=1 ) 
        {        
          
           x_pos1 = j;
           y_pos1 = y_1;
           x_pos2 = j;
           y_pos2 = y_2;
           
           col01=bild.pixels[y_pos1*bild_width+x_pos1]; 
           // b01 = brightness(col01);
          
           col02=bild.pixels[y_pos2*bild_width+x_pos2];
           // b02 = brightness(col02);
           
           if ( mouse_active == 1 )
           {
             b01 = hue(col01);
             b02 = hue(col02);
           }
           else if ( mouse_active == 2 )
           {
              b01 = brightness(col01);
              b02 = brightness(col02);
           }
           else if ( mouse_active == 3 )
           {
              b01 = saturation(col01);
              b02 = saturation(col02);
           }
           else if ( mouse_active == 4 )
           {
              b01 = red(col01);
              b02 = red(col02);
           }
           else if ( mouse_active == 5 )
           {
              b01 = blue(col01);
              b02 = blue(col02);
           }
           else 
           {
              b01 = green(col01);
              b02 = green(col02);
           }
           ;;
           
           if ( b02 < b01 )
           {
             bild.set(x_pos2,y_pos2,col01);
             bild.set(x_pos1,y_pos1,col02);
           
           }
        
          
        }
        // Ende for Schleife j
        }
        // Ende for Schleife i
        
        bild.updatePixels ();
        // zeige das neue Bild
        image(bild, 0, 0);
        // radius01 *= rdecrease;
     
}


void mouseClicked() {
  // switch on/off mouse effect
  /* save frame as png */
  // saveFrame("output-####.png");
  
  // Lade Bilde
  bild = loadImage("mando.jpg");
  // zeige das Bild
  image (bild,0,0);
       
  
  mouse_active += 1;    
  if ( mouse_active == 7 ) 
    { mouse_active = 1; };
  
    
   
  
}

