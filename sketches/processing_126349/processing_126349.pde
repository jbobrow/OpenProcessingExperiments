
// Brisa MP. copy@left (2011) 

//import codeanticode.gsvideo.*;           // PC

import processing.video.*;                 // MAC

//GSCapture cam;                           // PC
Capture cam;                               //MAC

float x; // vaiables random gráfica 
float xx; 


void setup() {
  
 size(800, 600);
 
  
 // cam = new GSCapture(this, 320, 240);  // PC
  cam = new Capture(this, 320, 240);    // MAC
  
  tint (255); 
   frameRate(20);
  
}



void draw() {
  
   
  if (cam.available() == true) {
  
    cam.read();
    image(cam, 0, 0,width,height);

 
  

    // rando 1 
   x= random (20,width); 
    stroke (255); 
    fill (100,50,50,10); 
  line(x,0,x, height);
  ellipse(x,x,width, height);
  //line(x,x,width, height);
  rect(x,x,width, height);
  
  // random 2
  
   xx= random (20,width); 
    stroke (100); 
 
   ellipse(x,x,width, height);
  line(xx,xx,width, height);
  rect(xx,xx,width, height);
  

  
 
 // columna 1 iz a de

copy(300, 250, 100, 100, 100 ,100 , 100, 100); 

copy(300, 250, 100, 100, 200, 130, 100, 100); 

copy(300, 250, 100, 100, 200, 200, 100, 100); 

copy(300, 250, 100, 30, 300, 280, 200, 100); 

copy(300, 250, 100, 30, 300, 200, 200, 100); 
 
 

// columna 2 iz a dr


copy(300, 250, 100, 100, 3, 5, 100, 100); 

copy(300, 250, 100, 100, 3, 60, 100, 100); 

copy(300, 250, 100, 100, 3, 130, 100, 100); 

copy(300, 250, 100, 100, 3, 200, 100, 100); 

copy(300, 250, 100, 100, 3, 280, 100, 100); 

copy(300, 250, 100, 100, 3, 380, 100, 100); 



// columna 3 iz a dr



copy(300, 250, 100, 100, 100, 5, 100, 100); 

copy(300, 250, 100, 100, 100, 60, 100, 100); 



copy(300, 250, 100, 100, 100, 280, 100, 100); 

copy(300, 250, 100, 100, 100, 380, 100, 100); 




// columna 4 iz a dr


copy(300, 250, 100, 100, 400, 5, 100, 100); 

copy(300, 250, 100, 100, 400, 60, 100, 100); 


copy(300, 250, 100, 100, 300, 130, 200, 100); 


copy(300, 250, 300, 100, 450, 200, 200, 200); 

copy(300, 250, 100, 100, 450, 300, 400, 100); 

copy(300, 250, 100, 100, 450, 400, 400, 200); 


// columna 5 iz a dr

copy(30, 30, 100, 100, 500, 60, 200, 200); 


    
  }
  
}
