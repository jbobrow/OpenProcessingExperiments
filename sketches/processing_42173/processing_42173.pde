

int h;
int m;
int s;

int total = 600;



void setup (){
  size (600,600);
  background (0);
  smooth ();
  colorMode (RGB, 600);
  
}




void draw () {
  h = hour ();
  m = minute ();
  s = second ();
  background (0);
  
  
  
 
  rectangles ();
   whiteLines ();
 // runningLine ();
  
  sand ();
  
  fallingSand ();
  hourGlass ();
  
}



void rectangles (){
  
  if (h>11) {
    h = h-12;
  }
    
    rectMode (CORNER);
    noStroke ();
    fill (600 - h*50);
    rect (0, 50*h, width, 50);
    
//    if (h == 0) {
//      stroke (600);
//      strokeWeight (1);
//      fill (0);
//      rect (0, 50*h, width, 50);
//    }
      
  
}
 
 
 
 
 void sand () {
   int xOne= 175;
   int yOne= 165+m*2;
   int depth = 120 - m*2;
   int yTwo = 435 - m*2;
   int depthLow = 0 + m*2;
   rectMode (CENTER);
   noStroke ();
   fill (428, 418, 104);
  // rect (width/2, 225, 250, 120);
   
   rectMode (CORNER);
   
  
   

   
   
   //upper rectangle
   rect (xOne, yOne, 250, depth);
  
   //lower rectangle
   //rect (xOne, 
   rect (xOne, yTwo, 250, depthLow);
   
   
   
 }
 
 
 
 
 void runningLine () {
   int lineStart = 175 + s*4;
   stroke (s*10, m*10, random (600));
   strokeWeight (1);
   line (lineStart, 0, lineStart, height);
 }
 
 
 void fallingSand () {
   int yHeight = (height/2 +14) + s*2;
   rectMode (CENTER);
   noStroke ();
   fill (428, 418, 104);
   rect (width/2, yHeight, 7, 7); 
  
 }
   


void hourGlass () {
  
  rectMode (CENTER);
  stroke (600);
  strokeWeight (4);
  
  //middle yellow rectangle
  fill (428, 418, 104);
  rect (width/2, height/2, 50, 28);
  //noFill ();
 //top and bottom rectangles
 fill (600, 100);
  rect (width/2, 225, 250, 120);
  rect (width/2, 375, 250, 120);
}


void whiteLines () {
  for (int l=0; l<600; l +=50) {
    stroke (300);
    strokeWeight (1);
    line (0, l, width, l);
  }
  
}



