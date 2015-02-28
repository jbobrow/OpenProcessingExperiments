
void setup () {
  //set up sketch
  size (800, 800); 
  smooth ();
  background (0, 0, 0); 

  //body 1
  fill (255, 0, 0);
  ellipseMode (CORNER);
  ellipse (120, 80, 590, 600);

  //eyes
  fill (139, 69, 19);
  ellipseMode (CORNER);
  ellipse (160, 200, 250, 255);
  ellipse (420, 200, 259, 255);

  fill (255, 255, 255);
  ellipseMode (CORNER);
  ellipse (195, 225, 205, 205);
  ellipse (465, 225, 205, 205); 
    
  fill (255, 255, 255); 
  stroke (255, 255, 255);
  line (330, 310, 350, 250);
  line (330, 310, 390, 310);
  line (600, 310, 630, 250);
  line (600, 310,660, 310);

  //nose
  fill (255, 255, 0);
  triangle (380, 370, 450, 370, 415, 420);

  //eyebrow
  bezier (185, 131, 293, 202, 553, 202, 653, 131);
  
  
}

void draw () 
{
  frameRate (40);
  
  //eyes
  fill (random (255), random (255), random (255));
  ellipseMode (CORNER);
  ellipse (260, 255, 130, 130);
  ellipse (530, 255, 130, 130);
  
  //feather
  fill (random (255), random (255), random (255));
  arc (220, 460, 90, 80, -0.014, 3.161);
  fill (random (255), random (255), random (255));
  arc (320, 460, 90, 80, -0.014, 3.161);
  fill (random (255), random (255), random (255));
  arc (420, 460, 90, 80, -0.014, 3.161);
  fill (random (255), random (255), random (255));
  arc (520, 460, 90, 80, -0.014, 3.161);
  fill (random (255), random (255), random (255));
  arc (280, 520, 80, 80, -0.014, 3.161);
  fill (random (255), random (255), random (255));
  arc (380, 520, 80, 80, -0.014, 3.161);
  fill (random (255), random (255), random (255));
  arc (480, 520, 80, 80, -0.014, 3.161);
  fill (random (255), random (255), random (255));
  arc (340, 580, 70, 65, -0.014, 3.161);
  fill (random (255), random (255), random (255));
  arc (440, 580, 70, 65, -0.014, 3.161);
}
