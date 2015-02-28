
import processing.video.*;
Capture capture;

int tolerance = 20; //control how much a pixel must be diffrent from the corresponding pixel of the "samplingImage"
int pixelsNecessary = 100; //this describes the quantity of reactive pixels required to set to activare a sensor

int whichMode = 0; //this variables is just to show the functionality and is not necessary

boolean backgroundCaptured = false; //this variable are just to show the functionality and is not necessary

rects[] rects; //this object array contains all the instances of the rectangles defined into the class "rects" 

PImage samplingImage; //this is the image that is used check the differences with the live image

void setup(){
  
  size(500,375);
  
  samplingImage = createImage(500,375,RGB); //create a new blank image just to define its dimensions
  
  capture = new Capture(this, width, height, 30); //here begins a new sessions of capturing of the images from the webcam
  
  rectMode(CORNERS);
  rects = new rects[100]; //define the rects array dimension
  
  //here you can insert more rectangles (sensors) by specifying x1,y1,x2,y2
  rects[0] = new rects(100,100,130,130);
  rects[1] = new rects(50,200,150,280);
  rects[2] = new rects(250,50,380,100);

}


void keyPressed(){ 
  
     if( key == 'q' ){ //if the key is pressed reset a new sampleImage 
       
         setSampleImage();
         
     }
      
     //Others keys commands to change the parameters
     if( key == 's' && tolerance > 0 ) tolerance--;
     if( key == 'a' && tolerance < 255 ) tolerance++;
     if( key == 'f' && tolerance > 0 ) pixelsNecessary--; 
     if( key == 'g'  ) pixelsNecessary++;
     if( key == 'z' ) { if(backgroundCaptured==false)backgroundCaptured=true; else backgroundCaptured=false; whichMode++; }
   
}

void captureEvent(Capture myCapture) {
   
     capture.read(); //this refresh the image captured by webcam and stored in the capture variable
}


void draw(){
   
     int pixelX = -1, pixelY = -1; 
     
     if( whichMode % 2 == 1 ) setSampleImage(); //this is necessary for the motion mode because it needs a new sampleImage every cycle
   
     
     loadPixels();
     capture.loadPixels(); //fill an array of pixels from the current captured image
   
     for(int i=0; i<capture.height*capture.width; i++){ //read every element of the pixels array
      
        pixelX = i % width;                                                            //get the real pixel X position
        
        if( pixelX != width ) pixelY = ( i / width ) +1; else pixelY = ( i / width );  //get the real pixel Y position
      
      
        if( abs( hue( capture.pixels[i] ) - hue( samplingImage.pixels[i] ) ) > tolerance && abs( saturation( capture.pixels[i] ) - saturation( samplingImage.pixels[i] ) ) > tolerance && abs( brightness( capture.pixels[i] ) - brightness( samplingImage.pixels[i] ) ) >tolerance ){ //HSB values comparison between the current image and the sample image at the current pixel
        
            for( int q = 0; q < 100; q++){ //loop trough the rects array
         
               if(rects[q]!=null){ 
          
                    if( pixelX > rects[q].x1 && pixelX < rects[q].x2 && pixelY > rects[q].y1 && pixelY < rects[q].y2 )  //check if there is a sensors in this part of the image
                    rects[q].amount++; //increase the number of pixels activated for this sensor
          
               } 
          
            }
      
        }
     } 
   
   
     image( capture , 0 , 0 ); //show the live webcam image
     
   
     
     
     if(!backgroundCaptured){ //this is just for this demostration. you nees just what is in the else parenthesis
         fill( 0 , 0 , 0 , 100 );
         rect(0,0,width,height-30);
         fill(255);
         textAlign(CENTER);
         text( "Go out from the screen and press 'q' key\n in order to capture the background.\n\n Drag the rectangles (sensors) to change the sensors positions.\n\nPress 'a'/'s' keys to decrease/increase the sensors tolerance.\n\nPress 'f'/'g' keys to decrease/increase the number of pixels\n necessary to activate a sensor.\n\n Press 'z' to switch to the motion sensor mode. " , width/2 , 100 );
         textAlign(LEFT);
         
     }
     else
     {
         
         for( int q = 0 ; q < 100 ; q++){ //loop trough the rects array
         
           if( rects[q] != null ) rects[q].draw(); //draw this rectangle object (go to the class to learn more)
          
         }
     
     }
     
     //these are for this demo as well
     fill( 0 , 0 , 0 , 200 );
     stroke( 0 );
     rect( 0 , height - 30 , width , height );
     fill( 255 );
     text( "Tolerance (a/s): " + (255-tolerance) , 10 , height - 10 );
     text( "Pixels required (f/g): " + pixelsNecessary , 150 , height - 10 );
     
     if(whichMode%2==1) text( "Mode (z): Motion Sensor" , 320 , height - 10 ); else  text( "Mode (z): Presence Sensor" , 320 , height - 10 ); 
     
}


class rects{ //rectangle (sensors) class

     int x1 , x2 , y1 , y2 , amount ; //coordinateso of the corner-corner rectangle and the amount of activated pixels 
      
     rects( int get_x1 , int get_y1 , int get_x2 , int get_y2 ){ //lets create a new rectangles with the passed parameters
      
         x1 = get_x1;
         y1 = get_y1;
         x2 = get_x2;
         y2 = get_y2;
      
     }
  
     public void draw(){ //rectangle draw function
  
         noFill(); 
         
         if( amount > pixelsNecessary || amount == ((x2-x1)*(y2-y1)) ) fill( 255 , 0 , 0 ); //if the amount is higher than ne pixelsNecessary variable or if it is equal to the number of maximum pixels of a rectangle draw it of red
  
         if( mousePressed && mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2 ){ //this is just for this demo in order to let you move the sensors
  
             x1 += mouseX - pmouseX ;
             x2 += mouseX - pmouseX ;
             y1 += mouseY - pmouseY ;
             y2 += mouseY - pmouseY ;
          }
          
          //draw the rectangle and the amount value text
          stroke( 255 );
          rect( x1 , y1 , x2 , y2 );
          fill( 255 );
          textAlign( CENTER );
          text( amount , x1 + ( x2 - x1 ) / 2 , y1 + ( y2 - y1 ) / 2 + 5 );
          amount = 0;
          textAlign( LEFT );
     }  
  
}



void setSampleImage(){ 
  
      backgroundCaptured=true; //this is for the demo
      
      loadPixels(); 
      samplingImage.loadPixels(); //fill an array of pixels from the sampling image
        
      for( int i = 0 ; i < capture.height * capture.width ; i++ ) samplingImage.pixels[i] = capture.pixels[i]; //change every pixel with the current pixel of the live image
         
      samplingImage.updatePixels(); //update the image

}

