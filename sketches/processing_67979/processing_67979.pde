
//// “For the lines”
//// Tweaked example from a book .. don't remember which one.
//// Berti Búrquez  22 Ago 2012

void setup(){
  size(840,520);  
  background(245);
  smooth();
  strokeWeight(.2);
}

void draw(){  
   for(int i=0; i<1; i++){                ///————— Line roots
    line(i+10,10,random(width),random(height));       // Left upper
    line(width-10,10,random(width),random(height));   // Right upper
    line(10,height-10,random(width),random(height));  // etc…
    line(width-10,height-10,random(width),random(height));
    line(width/2,height-10,random(width),random(height));
    line(width/2,10,random(width),random(height));
  }
}

void clearBackground(){
  background(255);
}

void mousePressed() {  // Reset
  clearBackground();
}
