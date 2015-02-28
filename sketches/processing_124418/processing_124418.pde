
void setup()  
{ 
size (400, 400);
smooth ();
}
 
void draw () { 
     
if (mousePressed) {
   
  background (0);
   scale (4);

 //Gesicht
   fill (255);
  strokeWeight(1);
  ellipse (35,40, 11,9);
  ellipse (65,40, 11,9);
 
  fill (255,0,0);
  noStroke();
  ellipse (map(mouseX,0,width,26,40), map(mouseY,0,width,34,42), 5,5);
  ellipse (map(mouseX,0,width,56,70), map(mouseY,0,width,34,42), 5,5);
  
  noFill ();
   stroke(0);
  strokeWeight(10);
  ellipse (35,40, 20,20);
  ellipse (65,40, 20,20);
  
  fill (255);
   noStroke();
rect(45, 65, 5, 6, 0, 0, 1, 1);
rect(50, 65, 5, 8, 0, 0, 1, 1);
  
  
}
 
else {
   
  background (255);
  scale (4);
 
 //körper
     noFill ();
   stroke(0);
  strokeWeight(1);
  ellipse (50,110, 83,100);
  
     fill (0);
  ellipse (70,10, 15,35);
  
   fill (0);
  ellipse (30,10, 15,35);
  
    noFill ();
   stroke(0);
  strokeWeight(1);
  ellipse (70,10, 30,50);
  
   noFill ();
   stroke(0);
  strokeWeight(1);
  ellipse (30,10, 30,50);
 
fill (255);
   stroke(0);
  strokeWeight(1);
  ellipse (50,47, 65,67);
  

 
 //Gesicht
  fill (0);
  noStroke();

  ellipse (map(mouseX,0,width,27,41), map(mouseY,0,width,35,43), 5,5);
  ellipse (map(mouseX,0,width,57,71), map(mouseY,0,width,35,43), 5,5);
  
  noFill ();
   stroke(255);
  strokeWeight(10);
  ellipse (35,40, 20,20);
  ellipse (65,40, 20,20);

  noFill ();
   stroke(0);
  strokeWeight(1);
  ellipse (35,40, 11,11);
  ellipse (65,40, 11,11);
  
  fill (0);
triangle(45, 50, 55, 50, 50, 60);
  
  noFill ();
rect(45, 65, 5, 8, 0, 0, 10, 10);
rect(50, 65, 5, 8, 0, 0, 10, 10);
  
  fill (0);
  ellipse (35,63, 1,1);
  ellipse (65,57, 1,1);
   ellipse (33,58, 1,1);
  ellipse (60,60, 1,1);
   ellipse (38,60, 1,1);
  ellipse (66,63, 1,1);
  
  
  }
}


