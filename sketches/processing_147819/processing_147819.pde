

// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: LEE Daeun 
// ID: 201420095


void setup() { 
  size (1024, 768); 
  smooth(); 
  noLoop(); 
  strokeWeight(random(9));
}

void draw() { 
  background(219,234,255); 

  for (int a = 0; a < width; a= a+ 150) { 
    for (int b= 0; b < height; b = b+150) { 
      noFill(); 
      stroke(64,64,64);
      ellipse(a-100,b,20,20);
      stroke(0,103,242);
      rect(a, b, 70, 70); 
      stroke(13,53,108); 
      ellipse(a+40, b, 50, 50); 
      stroke(136,150,170); 
      rect(a+140, b+40, 50, 50);
      stroke(23,27,131);
      rect(a-10, b-10, 90, 90);  
      stroke(51,59,70); 
      ellipse(a+40, b+150, 50, 50); 
      stroke(173,176,252);
      rect(a+15, b+15, 20, 20);
    } 
  } 
} 

void keyPressed() { 
  background(0); 
  redraw();

}  

