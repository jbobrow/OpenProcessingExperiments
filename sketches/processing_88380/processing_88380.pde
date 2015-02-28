

// http://js.do/blog/processing/editor/ 

int x0=0;  
int y0=0;

void setup() {  //setup function called initially, only once
   size(640, 400);
}

void draw() {  //draw function loops 

  translate(width/2, height/2);
  background(0);
  stroke(80,170,240);
  for (float i=-400;i<=400; i+=5) {
    line (x0,y0,i+mouseX-width/2, mouseY-height/2-25+cos(i/33)*50);
  }
   if (mousePressed) {
      x0 = mouseX-width/2; y0 = mouseY-height/2-25;
   }
 }
