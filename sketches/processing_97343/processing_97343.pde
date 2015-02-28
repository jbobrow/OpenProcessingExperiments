
/*
Mandelbrot Set Explorer

LEFT MOUSE           = click and drag a box to zoom
MIDDLE MOUSE/WHEEL   = click to return to original zoom
RIGHT MOUSE          = click and drag to pan around the area
*/

int req_et = 201;                                         // required escappe time

float xoff = -2; float xmin = -2; float xmax = 2;  // variables for converting (i,j) coordinates to (x,y) coordinates
float yoff =  2; float ymin = -2; float ymax = 2;  //  the viewing area's min and max values, and the offset of the (x,y) origin from the (i,j) origin

float xli, yli, xlf, ylf;                                 // left click/release variables
float xr, yr;                                             // right click variables
boolean rightClick = false;    

void setup(){
  size(600,600);
  noLoop();
}

void draw() {
  background(0);
  float x_pos;                                              // current pixel location c = x_pos + i*y_pos
  float y_pos;

  int escape_time = 0;                                      // current number of successful iterations
  float x;                                                 // x and y used in recursive formula z = z*z + c
  float y;
  float x_temp;                                            // temporary x and y to avoid overwritting
  float y_temp;
  
  
  loadPixels(); 
                                                           // loop over all points in the square
  for (int j=0; j<width; j++) {
    x_pos = xoff + j*(xmax-xmin)/( width -1 );             // convert j to x
    for (int i=0; i<height; i++) {
      y_pos = yoff - i*(ymax-ymin)/( height-1 );           // convert i to y
      x = x_pos;
      y = y_pos; 
      escape_time = 0;

                                                           //calculate escape time of point (x,y)
      while ( (escape_time<req_et) && ((x*x + y*y)<4) ) {
        x_temp = x;
        y_temp = y;
        x = x_temp*x_temp - y_temp*y_temp + x_pos;
        y = 2*x_temp*y_temp + y_pos;
        escape_time++;
      }
      
      pixels[j+i*width] =color(int(255*escape_time/req_et));// colour the pixel based on the escape time, relative to req_et
    }
  }
  updatePixels();
  
  print("top left : (" + xmin + "," + ymin + ") \ntop right: (" + xmax + "," + ymax + ") \n\n");
}


void mousePressed() {
                                                          
  if (mouseButton == LEFT) {                              // left click and drag -> set new viewing area
    xli = xoff + mouseX*(xmax-xmin)/( width -1 );         // set initial rectangle corner
    yli = yoff - mouseY*(ymax-ymin)/( height-1 );
  }
                                                          
  if (mouseButton == RIGHT) {                             // right click and drag -> pan
    xr = mouseX*(xmax-xmin)/( width -1 );                 // set pan point
    yr = mouseY*(ymax-ymin)/( height-1 );
    rightClick = true;
  }
  
}

void mouseDragged() {
  float temp;
  
  
  if (rightClick == true) {                               // right click and drag -> pan
    loop();                                               // loop draw procedure while dragging to constantly update image
    
    temp = xmin + xr - mouseX*(xmax-xmin)/( width -1 );
    xmax = xmax + xr - mouseX*(xmax-xmin)/( width -1 );
    xmin = temp;
    xoff = xmin;
  
    temp = ymin - ( yr - mouseY*(ymax-ymin)/( height-1 ) );
    ymax = ymax - ( yr - mouseY*(ymax-ymin)/( height-1 ) );
    ymin = temp;
    yoff = ymax;
    
    xr = mouseX*(xmax-xmin)/( width -1 );                 // reset the grab point or acceleration happens
    yr = mouseY*(ymax-ymin)/( height-1 );

  }
}

void mouseReleased() {
  
  
  if (mouseButton == LEFT) {                               // left click and drag -> set new viewing area
    
    float window_size = max(abs(xlf-xli),abs(ylf-yli));    // ensure the viewing area remains a sqaure
   
    xlf = xoff + mouseX*(xmax-xmin)/( width -1 );          // set final rectagle corner
    ylf = yoff - mouseY*(ymax-ymin)/( height-1 );
  
    xmin = min(xli,xlf);                                   // update viewing area
    xmax = xmin + window_size; //max(xli,xlf);
    xoff = xmin;
  
    ymin = min(yli,ylf);
    ymax = ymin + window_size; //max(yli,ylf);
    yoff = ymax;
  
    redraw();
  }
  
  if (mouseButton == CENTER) {                             // middle click -> reset viewing area to (-2,-2)x(2,2) box
    xmin = -2;
    xmax = 2;
    xoff = xmin;
  
    ymin = -2;
    ymax = 2;
    yoff = ymax;
    
    redraw();
  }
  
  
  if (mouseButton == RIGHT) {                           // right click and drag -> pan
    rightClick = false;                                 // stop panning when right mouse button is release
    noLoop();
  }
}



