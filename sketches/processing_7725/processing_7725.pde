
void setup(){ // run once
  size(600,600); 
  smooth(); 
  background(250,255,196,100);
  frameRate(15); // slow the drawing down a bit
}

void draw (){ // run repeatedly
  fill(random(100,150),random(200),random(40),100); // make the fill mostly red and green, and
  //quite translucent
  noStroke();
  float cx = 300 + random(-200,200); // cluster the action on the x axis
  float cy = 300 + random(-200,200); // cluster the action on the y axis
  float csize = random (30,160); // make the size range between 30 and 160 pixels
  ellipse (cx,cy,csize+0.5*random(80),csize); // draw ellipses at varying points and 
  // varying sizes – make them look squashed rather than stretched
}

// void mousePressed(){
//  save("spotty"+millis()+".png"); // save an image with a unique filename on mouse-click

// }

