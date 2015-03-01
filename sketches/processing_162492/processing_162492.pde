
void setup () { 
  size (1000, 1000);
  smooth ();
}

void draw () {
  translate (width*0.5, height*0.5);
  
  background (255);
  for (int i=0; i<255; i+=7){
    float mouse= height * map (mouseX, 0, height, 1, 5);
    scale (0.3)
    float x= cos (radians (i*2))* mouse;
    float y= sin (radians (i*2))* mouse;
    
    fill (255, 255, mouse);
    ellipse (x, y, mouse, mouse);
  }
}


