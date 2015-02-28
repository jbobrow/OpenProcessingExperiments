
PFont myFont;

void setup(){
  size (500, 500);
  myFont=loadFont ("ComicSansMS-48.vlw");
  textFont (myFont);
  noStroke();
  smooth();
}



void draw(){
  background (255);
  
  if (mousePressed){
    fill (125, 125, 125);
    ellipse (250, 250, 425, 125);
    triangle (125, 230, 170, 230, 75, 400);
    noFill ();
    fill (0);
    text ("Halt's Maul!", 135, 270); 
  
}else{
    
    fill (125, 125, 125);
    ellipse (250, 200, 400, 125);
    triangle (300, 230, 325, 200, 375, 400);
    noFill ();
    fill (0);
    text ("Yeah!", 200, 195);
    text ("Comic Sans!", 135, 240); 
}
}

