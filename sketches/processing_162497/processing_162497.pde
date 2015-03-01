
void setup () { 
  size (1000, 1000);
  smooth ();
}

void draw () {
  translate (width*0.5, height*0.5);
  scale (0.4);
  background (255);
  for (int i=0; i<255; i+=7){
    float mouse= i * map (mouseX, 0, height, 0, 255);
    float mouse2= i* map (mouseY, 0, width, 0, 255);
    
    float x= cos (radians (i*2))* mouse;
    float y= sin (radians (i*2))* mouse;
    
    fill (mouse, mouse2, mouse*3);
    noStroke;
    ellipse (x, y, mouse, mouse2);
  }
}


