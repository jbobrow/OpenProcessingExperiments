
void setup() {
  size (800,500, P3D);
  stroke (255);
  background(128,128,128);
  // "cx" allows easy definition of color on the x-axis
  int cx =  (height/256); 

//Draws a frame of areas around the draw area.
// Each area can be used to adjust the stroke color.
//Magenta Selection area 
   for (int i = 0; i < height; i = i+1) {
  stroke (height-i*cx,0,height-i*cx);   
  line(0, i, 15, i);
  stroke (255);
  line(15,0,15,height); 
}

//Cyan Selection area 
  for (int i = 0; i < height; i = i+1) {
  stroke (0,(height-i*cx),(height-i*cx));   
   line(16, i, 30, i);
    stroke (255);
  line(30,0,30,height);
}

//Yellow Selection area 
  for (int i = 0; i < height; i = i+1) {
  stroke ((height-i*cx),(height-i*cx),0);   
   line(31, i, 45, i);
    stroke (255);
  line(46,0,46,height);
}
//Blue Selection area 
  for (int i = 0; i < height; i = i+1) {
  stroke (0,0,(height-i*cx));   
  line(width-31, i, width-45, i);
}
//Green Selection area 
  for (int i = 0; i < height; i = i+1) {
  stroke ((height-i*cx),0,0);   
  line(width-16, i, width-30, i);
}
//Red Selection area 
  for (int i = 0; i < height; i = i+1) {
  stroke (0,(height-i*cx),0);   
  line(width, i, width-15, i);
}
}
  int Red = (128);
  int Green = (128);
  int Blue = (128);

 
 
  
void mousePressed() {
   int cx =  (height/256); 
// set magenta level  
    if (mouseX <= 15){   
   Red = ((height-mouseY)/cx);
   Blue = ((height-mouseY)/cx); 
  noStroke (); 
  }
// set cyan level  
  if ((mouseX<=30) && (mouseX > 15)){ 
  Green = ((height-mouseY)/cx);
  Blue = ((height-mouseY)/cx);
   noStroke ();
  }
// set yellow level  
  if ((mouseX<=45) && (mouseX > 30)){ 
  Green = ((height-mouseY)/cx);
  Red = ((height-mouseY)/cx);
   noStroke ();
  }

// set green level  
    if (mouseX >= width-15){   
   Green = ((height-mouseY)/cx);
   
  noStroke (); 
  }
// set red level  
  if ((mouseX>=width-30) && (mouseX <width-15)){ 
  Red = ((height-mouseY)/cx);
 
   noStroke ();
  }
// set blue level  
  if ((mouseX>=width-45) && (mouseX < width-30)){ 
  Blue = ((height-mouseY)/cx);
   noStroke ();
  }
    
  
  loop();
}
  void draw (){
    if ( mousePressed) {
    if ((mouseX > 50 && mouseX < width-50)){
  stroke (Red,Green,Blue); 
  line (pmouseX,pmouseY,mouseX,mouseY);
  
  lights();
  translate(mouseX, mouseY, (mouseX/width-mouseY/width)*(width+height)/2);
  noStroke();
  fill (Red,Green,Blue);
  sphere (50);

    }
    }
  }
 void mouseReleased () {
  

  

}

  



