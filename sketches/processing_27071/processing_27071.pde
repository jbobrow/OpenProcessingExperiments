
int[] trail_x;
int[] trail_y;
int index = 0;




//what happens if you change these both to 50? what are they doing to the pattern?

void setup(){
  size(500,500);
    smooth();
  colorMode(RGB);
  trail_x = new int[50];
  trail_y = new int[50];
  frameRate(80);
}
 
void draw()

{
  
  //-------------------------------------YOUR PATTERN GOES IN HERE-------------------------------
  //try making pleasant designs :-)


background(100);

 fill(0, 0, 0); 
noStroke(); 
ellipse(56, 46, 55, 55);
ellipse(106, 126, 55, 55);   
ellipse(206, 426, 55, 55); 
ellipse(96, 356, 55, 55); 
ellipse(376, 126, 55, 55); 
ellipse(456, 408, 55, 55); 
ellipse(356, 308, 55, 55); 
ellipse(260, 240, 55, 55);
ellipse(250, 100, 55, 55);  
ellipse(55, 280, 55, 55);
ellipse(60, 460, 55, 55); 
ellipse(460, 40, 55, 55);
stroke(0, 128);
  for (int i=0; i < trail_x.length; i++) {
     
    // always end with the last mouse position to avoid the "jumping"
    // effect
    int pos = (index+i) % trail_x.length;
     
    // we can use the counter for color and size
    fill(map(i, 0, trail_x.length, 0, 100), 255, 255, 128);   
    ellipse(trail_x[pos], trail_y[pos], 10+i, 10+i); 
  }
}
 
void mouseMoved() {
  trail_x[index] = mouseX;
  trail_y[index] = mouseY;
  index++;
  if (index >= trail_x.length) index = 0;
  




}

