
PFont font;

size (250, 250);
background (0);
smooth ();

for(int y=0; y<=height; y+=15) {
  for(int x=0; x<=width; x+=15) {
    
    font=loadFont ("CharlemagneStd-Bold-48.vlw");
    textFont (font);
    
    textSize (random (5, 15));
    fill(250, random (40, 130));
    text ("L1C", x, y);
    text ("5K8", x-10, y+10);
    text ("L1C", random (1, 250),random (1,250));
    text("5K8",random( 1,250), random(1, 250));
  
}}

