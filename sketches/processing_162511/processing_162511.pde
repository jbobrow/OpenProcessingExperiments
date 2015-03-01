
void setup () { 
  size (500, 500);
  smooth ();
}

void draw () {
  translate (width*0.5, height*0.5);
  scale (0.2);
   background (127,200,219);
  for (int i=0; i<255; i+=7){
    stroke (i*2.5, 255, 255);
    
    float mouse= i * map (mouseX, 0, height, 0, 10);
    float mouse2= i* map (mouseY, 0, width, 0, 10);
    
    float x= cos (radians (i*2))* mouse;
    float y= sin (radians (i*2))* mouse;

    
    fill (mouse/2, mouse2/3, mouse);
    ellipse (x, y, mouse, mouse2);
  }
}


