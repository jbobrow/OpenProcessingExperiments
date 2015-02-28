
PFont font;

size (250, 250);

smooth ();
noStroke ();

for(int y=0; y<=height+20; y+=20) {
  for(int x=0; x<=width+20; x+=20) {
    fill (random (x,y),random (x,y),random(x,y), random (20,110));
    
    font=loadFont ("Baskerville-Bold-48.vlw");
    textFont (font);
    textSize (random (5,90));
    text ("L", random (1,250), random (1,250));
    text ("1", random (1,250), random (1,250));
    text ("C", random (1,250), random (1,250));
    text ("5", random (1,250), random (1,250));
    text ("K", random (1,250), random (1,250));
    text ("8", random (1,250), random (1,250));
    
    strokeWeight (random (.5, 3));
    stroke(random (0,50), random(70,160));
     line (x, y, 40, 40);
   
    
    
  }
}

