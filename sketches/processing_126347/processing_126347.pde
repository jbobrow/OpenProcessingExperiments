
// Por: Brisa MP copyleft (2011) 

//import codeanticode.gsvideo.*;           // Wind
import processing.video.*;                 // MAC

//GSCapture cam;                           // Wind
Capture cam;                              // MAC


// variable random 
float x; 
float xx; 



void setup() {
  
  size(800, 600);
  background(255);
  
  //cam = new GSCapture(this, 320, 240);   // Wind
  cam = new Capture(this, 320, 240);        // MAC
  
   tint(255, 200, 220, 50); // luz, color , transparencia imagen 
   frameRate(1); // velocidad de la imagen
  
}

void draw() {
  
  if (cam.available() == true) {
   
    
    cam.read();
    image(cam, 0, 0,width,height);
    


// columna 1 iz a de

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 100,int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 30, int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 30, int(random(width)), int(random(height)), 100, 100); 

 

// columna 2 iz a dr


copy(300, 250, 100, 100,int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100); 



// columna 3 iz a dr



copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100); 

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100); 



copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100);

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100);




// columna 4 iz a dr


copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100);

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100);


copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100);


copy(300, 250, 300, 100, int(random(width)), int(random(height)), 100, 100);

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100);

copy(300, 250, 100, 100, int(random(width)), int(random(height)), 100, 100);


// columna 5 iz a dr

copy(30, 30, 100, 100,int(random(width)), int(random(height)), 100, 100);


  }
  
}
