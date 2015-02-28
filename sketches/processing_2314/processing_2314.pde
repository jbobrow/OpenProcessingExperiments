
// produce some randomize effect on an image
// start with big circles, draw random points, and reduce radius 
// the detail structure of the image is developping slowly

PImage bild;
PFont font;

color col_orig;
color black = color(0,0,0);

int x_pos;
int y_pos;

int mouse_active = 1;
int mode = 0;

int bild_width = 600;
int bild_height = 800;

int bild_sqr_sum = bild_width*bild_width+bild_height*bild_height;
int x_move = bild_width/2;
int y_move = bild_height/2;

int dimension = bild_width * bild_height;

int anzahl01 = 0;
float radius01 = 50.0;
float radius_fac = random (0.990,0.996);
float rotate01 = random(0.001);
float rotate02 = random(0.005);

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
   
  size(600,800);
    
  bild = loadImage("mandoline_silvestri.jpg");
  image (bild,0,0);
  
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("ABC1Vari-48.vlw"); 
  textFont(font); 

  }

void draw () {
  loadPixels();
  bild.loadPixels();
  
  /* x_pos = mouseX;
  y_pos = mouseY; */
  
  x_pos = floor(random (0,bild_width));
  y_pos = floor(random (0,bild_height));
 
  // if mouse_activ1 = 1 sort som pixels arount 
  // x_pos / y_pos
  
  if ( mouse_active == 1 )
     {
       if (mode == 0) 
       //++++++++++++++++++++++++
       {
          // draw 50 objects
          for (int i=0; i < 50; i+=1 ) 
          {        
          x_pos = floor(random (0,bild_width));
          y_pos = floor(random (0,bild_height));
          col_orig=bild.pixels[y_pos*bild_width+x_pos];    
          fill (col_orig);
          stroke(col_orig);
          // rotate (0.001);
          // draw lines   
          line (x_pos/2,y_pos/2,x_pos/2+radius01,y_pos/2+radius01);
          }
          
          radius01 *= radius_fac;
          
          // if radius < 1.001 switch mode
          if ( radius01 < 1.001 ){ mode = 1;radius01 = 50; radius_fac = random (0.990,0.996);}
       }
       
       else if (mode == 1 )
       //+++++++++++++++++++++++++++++++++
       
       {
          // draw 50 objects
          for (int i=0; i < 50; i+=1 ) 
          {        
          x_pos = floor(random (0,bild_width));
          y_pos = floor(random (0,bild_height));
          col_orig=bild.pixels[y_pos*bild_width+x_pos];    
          fill (col_orig);
          stroke(col_orig);
          // rotate (0.001);
          // draw lines   
          ellipse (x_move+x_pos/2,y_pos/2,radius01,radius01);
          }
          
          radius01 *= radius_fac;
          
          // if radius < 1.001 switch mode
          if ( radius01 < 1.001 ){ mode = 2; radius01 = 50; radius_fac = random (0.990,0.996); }
       }
       
       
       else if (mode == 2 )
       //+++++++++++++++++++++++++++++++
       
       {
          // draw 50 objects
          for (int i=0; i < 50; i+=1 ) 
          {        
          x_pos = floor(random (0,bild_width));
          y_pos = floor(random (0,bild_height));
          col_orig=bild.pixels[y_pos*bild_width+x_pos];    
          fill (col_orig);
          stroke(col_orig);
          rotate (rotate01);
          // draw lines   
          ellipse (x_pos/2,y_move+y_pos/2,radius01,radius01);
          }
          
          radius01 *= radius_fac;
          
          // if radius < 1.001 switch mode
          if ( radius01 < 1.001 ){ mode = 3; radius01 = 50;rotate01 = random(0.001); 
          radius_fac = random (0.990,0.996);}
       }
       
       
       else if (mode == 3 )
       //++++++++++++++++++++++++++
       
       {  
          // draw 50 objects
          for (int i=0; i < 50; i+=1 ) 
          {        
          x_pos = floor(random (0,bild_width));
          y_pos = floor(random (0,bild_height));
          col_orig=bild.pixels[y_pos*bild_width+x_pos];    
          fill (col_orig);
          stroke(col_orig);
          rotate (rotate02);
          // draw lines   
          line (x_move+x_pos/2,y_move+y_pos/2,x_move+x_pos/2+radius01,y_move+y_pos/2+radius01);
          // ellipse (x_move+x_pos/2,y_move+y_pos/2,radius01,radius01);
          }
          
          radius01 *= radius_fac;
          
          // if radius < 1.001 switch mode
          if ( radius01 < 1.001 ){ mode = 4; radius01 = 50; rotate02 = random(0.005);
          radius_fac = random (0.990,0.996);}
       }
       
       else if (mode == 4 )
       //++++++++++++++++++++++++++++++++++++
       {
       // if radius < 1.001 draw random colors
       {
          
          
          for (int i=0; i < 50; i+=1 ) 
          {
          x_pos = floor(random (0,bild_width));
          y_pos = floor(random (0,bild_height));
        
          // calculate random color  
          randomcol01 = color(random(255),random(255),random(255));
        
          fill (randomcol01);
          stroke(randomcol01);
          line (x_pos,y_pos,x_pos+5,y_pos+5);
          rotate (0.01);
         
          }
          anzahl01 +=1;
          if (anzahl01 > 1000 ){ mode = 5; radius01 = 50;anzahl01=0;
          radius_fac = random (0.990,0.996);}
          
       }
       }
       
       else if (mode == 5 )
       //++++++++++++++++++++++++++++++++++++
       // if radius < 1.001 draw random colors
       {
          
          for (int i=0; i < 50; i+=1 ) 
          {
          x_pos = floor(random (0,bild_width));
          y_pos = floor(random (0,bild_height));
                  
          col_orig=bild.pixels[y_pos*bild_width+x_pos];    
          fill (col_orig);
          stroke(col_orig);
         // calculate radius of circle
         
          ellipse (x_pos,y_pos,radius01,radius01);
          }
          radius01 *= radius_fac;
          if ( radius01 < 1.001 ){ mode = 0; radius01 = 50; radius_fac = random (0.990,0.996);}
       }
          
     }
   
  // display some text //
  /* fill(randomcol01);
  text("Mandoline", 550, 80);
  fill(randomcol02);
  text("Mandoline", 60, 500); */
  
  /* fill(black);
  rect(80,350,100,100);
  fill(255,255,255);
  text(radius01,80,400);  */
  
  // text(y_pos,80,450);

}


void mouseClicked() {
  // switch on/off mouse effect
  if ( mouse_active == 1 ) 
    { mouse_active = 0; }
    else
    { mouse_active = 1; }
}

