
void setup() {
  size(400, 200);
  
}
 
void draw() {
  background(0);    // must be inside draw otherwise
                    // seconds do not disappear
  
  // get details of current time from operating system
  int s = second();
  int m = minute();
  int h = hour();
  
  stroke(0);
  strokeWeight(0.5);
  
  // draw rect for no of hours on clock
  fill(94,155,11);
  quad(20, 20, 20, 100, 20 + h*15, 100, 20 + h*15, 20);
  
  // draw rect for no of minutes on clock
  fill(118,157,65);
  quad(20, 110, 20, 150, 20 + m*6, 150, 20 +m*6, 110);
  
  // draw rect for no of seconds on clock
  fill(147,162,126);
  quad(20, 160, 20, 180,  20 + s*6, 180,  20 + s*6, 160);
  
  // draw vertical lines to divide the rect into time segments (hrs)
  // this must happen after the quads are drawn as goes on top
  for(float a = 20.0; a <= 360.0; a += 15) {
    line(a, 20, a, 100);
  }
   
  // divide into mins and secs
  for(int b = 20; b<= 380; b += 6) {
    line(b, 110, b, 150);
    line(b, 160, b, 180);
  }

}


