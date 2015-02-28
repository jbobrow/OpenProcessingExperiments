
// concentric circles
// notice how we must decrement this time, not increment,
// this way we draw the smallest circle last

void setup() {
  size(300, 300);
  smooth();  
  colorMode(HSB);
}

//--------------------------------------------------------
void draw() {
  
  int radius = 440;
  int spacing = 40;  
  
  while ( radius > 0 ) {
    // introducing your new best friend: map() 
    // map() takes the radius, which varies between 500 and 40
    // and map it to a value which varies between 0 and 50
    int c = int( map(radius, 440, 40, 0, 64) );
    // use that value to set the hue    
    fill(c, 255, 255);
    
    ellipse(width/2, height/2, radius, radius);
    radius = radius - spacing;
  }  
}
