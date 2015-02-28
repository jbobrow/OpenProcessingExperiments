
void setup () {
   size(640, 488);
   stroke(255);
   background(0, 30, 30);
   
  PImage img1;
  img1 = loadImage("nocturne.jpg");
  image(img1, 0, 0);
  
}

void draw () {    
  fill(0, 30, 30);
  ellipse(320, 244, 600, 448);
  
  //axes
  line(320, 468, 320, 20);
  line(20, 244, 620, 244);
  
  //quadrant I
  line(320, 244, 380, 25);
  line(320, 244, 440, 40);
  line(320, 244, 500, 66);
  line(320, 244, 560, 110);
  
  //quadrant II
  line(320, 244, 380, 463);
  line(320, 244, 440, 448);
  line(320, 244, 500, 422);
  line(320, 244, 560, 378);
  
  //quadrant III
  line(320, 244, 260, 463);
  line(320, 244, 200, 448);
  line(320, 244, 140, 422);
  line(320, 244, 80, 378);
  
  //quadrant IV
  line(320, 244, 260, 25);
  line(320, 244, 200, 40);
  line(320, 244, 140, 66);
  line(320, 244, 80, 110);
}

