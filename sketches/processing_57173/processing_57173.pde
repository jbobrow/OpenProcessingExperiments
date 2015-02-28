
float x;
float r=0;
float t=0; 
PImage photo;

void setup () {
  textSize (25);
  size (612,612); 
  x=width; 
   photo=loadImage ("hugo csson trummor.jpg");// the name of the image has to exactly the 
   //same and inside " "
   smooth (); 
   strokeWeight(5);
   noFill (); 
   frameRate (1); // framerate has to be slowed down so that every movement happens only once each second
   // instead of 60 times per second
   
    
}

void draw () {
  background (#0C3743); 
  
  image (photo, 4,4); // loads the image and puts in the location. the location is the last two digits in
  // the code. x,y
  
  text ("Hugos Personal Clock", 170,40); 
  
  String message = "Current time: "+ nf( hour (),2) + ":" + nf(minute(),2) + ":" + nf(second(),2); 
 // similar to makeing variable where you can have mulitple other functions 
// inside it 
// the nf function in this is to display a 0 infron of any number that is single
String Message = "Current date: "+ nf( year (),2) + "-" + nf(month(),2) + "-" + nf(day(),2);
 
  
  text(message, 130,580);// message is the variable for the text that is 
  // going to be displayed
  text(Message, 130,530);
  
  resetMatrix () ;
  translate (width/2,height/2.3);// moves the origin to the center of the 
  //screen
  //fill (#126C6F); 
  strokeWeight(7);
  ellipse (0, 0, 400,400);// the border of the clock
  
  resetMatrix () ;// resets the moved origin and all other comands which 
  // were declared earlier on in the program.
  translate (width/2,height/2.3);// moves the origin to the center
  rotate (r);// the roation of the long pointer of the clock
  line (0,0,0,-200);
  r=r+0.105;// speed and what actually makes the pointer rotate.

  }
  
  void mousePressed () {
   stroke (random (255), random (255), random (255)); 
    
  }
  
  
  


 


