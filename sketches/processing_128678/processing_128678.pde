
// Processing Source Code for Recursion_Art.pde
// By Jim Plaxco, www.artsnova.com
static final int LIMIT=10;  // size of the smallest rectangle to draw

// System Setup Function
void setup() {
  size(920,480);      // canvas/screen size
  background(255);    // canvas/screen background color, 255=white
  stroke(0);          // draw color, 0=black
  fill(126);          // fill color, 126= mid-gray
  rectMode(CENTER);   // use x,y as rectangle center
}

// System Draw Function
void draw() {
  if(frameCount==1)  Recursion_Art(width/2,height/2, width/2,height/2);
}

// Recursion_Art Function
// Input Parameters: x,y = center of rectangle
//                   w,h = width and height
// Return Value: None (void)
void Recursion_Art(int x, int y, int w, int h) {
   fill(random(255),random(255),random(255)); // fill color
  rect(x,y,w,h);
  if(w > LIMIT)
  { // the size of the current rectangle is larger than the LIMIT value
    Recursion_Art(x-((w/2)+int(random(-w*.4, w*.4))),
                  y-((h/2)+int(random(-h*.2, h*.2))),
                  (w/2)+int(random(-w*.4, w*.4)),
                  (h/2)+int(random(-h*.2, h*.2)));
    Recursion_Art(x+((w/2)+int(random(-w*.4, w*.4))),
                  y-((h/2)+int(random(-h*.2, h*.4))),
                  (w/2)+int(random(-w*.4, w*.4)),
                  (h/2)+int(random(-h*.2, h*.2)));
    Recursion_Art(x-((w/2)+int(random(-w*.4, w*.4))),
                  y+((h/2)+int(random(-h*.2, h*.2))),
                  (w/2)+int(random(-w*.4, w*.4)),
                  (h/2)+int(random(-h*.2, h*.2)));
    Recursion_Art(x+((w/2)+int(random(-w*.4, w*.4))),
                  y+((h/2)+int(random(-h*.2, h*.4))),
                  (w/2)+int(random(-w*.4, w*.4)),
                  (h/2)+int(random(-h*.2, h*.2)));
    }
}

//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//============== 

