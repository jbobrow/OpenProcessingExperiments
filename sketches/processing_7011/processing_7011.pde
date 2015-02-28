
/** 
  *  Pixel Noise 
  *  by Joel C. Doyle 
  *   
  *  Pixelated noise like a TV set. 
  */ 
   
//GUI library import
import interfascia.*;
 
GUIController c;      //declare a GUIController object
IFButton b1, b2, b3, b4;  //create four buttons
//end GUI stuff

int psize;  //size of "pixels" 
int frame_rate = 30;  //FYI, no noticable difference in speed after 30fps
 
int x_count ;  //horizontal "pixel" count 
int y_count ;  //vertical "pixel" count 
 
void setup(){ 
  
  //set size of the window, P2D mode gives fast performance
  size(720, 640, P2D); 
  frameRate(frame_rate); 
  
  //radio button code
  c = new GUIController (this); //define the GUIController object
  
  //define the 4 buttons (label, xpos, ypos, xsize, ysize)
  b1 = new IFButton ("16", 30, 20, 40, 17);
  b2 = new IFButton ("8", 30, 40, 40, 17);
  b3 = new IFButton ("4", 30, 60, 40, 17);
  b4 = new IFButton ("2", 30, 80, 40, 17);
  
  //buttons apparently have a addActionListener method. i'm new to java.
  b1.addActionListener(this);
  b2.addActionListener(this);
  b3.addActionListener(this);
  b4.addActionListener(this);
  
  //add the buttons to the controller?
  c.add (b1);
  c.add (b2);
  c.add (b3);
  c.add (b4);
  //end radio button code
}

void draw(){ 

  noStroke(); //commenting this out gives a neat effect
  
  //draw the "pixels"
  for(int i=0; i<y_count; i++){ 
    for(int j=0; j<x_count; j++){ 
      //pick a random grayscale value before drawing each rectangle. (thanks subpixel!)
      fill(int(random(256))); 
      rect(j*psize, i*psize, psize, psize); 
    } 
  } 
} 

//what to do when the buttons are pushed
void actionPerformed (GUIEvent e) {
  if (e.getSource() == b1) {  //if button one ("16") is pushed 
    psize = 16;               //change the "pixel" size
    x_count = (width/psize);  //update the number of "pixels" drawn
    y_count = (height/psize);
  } 
  else if (e.getSource() == b2) {
    psize = 8;
    x_count = (width/psize);   
    y_count = (height/psize);  
  }
  else if (e.getSource() == b3) {
    psize = 4;
    x_count = (width/psize);  
    y_count = (height/psize);  
  }
  else if (e.getSource() == b4) {
    psize = 2;
    x_count = (width/psize);  
    y_count = (height/psize);  
  }
}

