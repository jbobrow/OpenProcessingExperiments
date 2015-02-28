
PImage gr;

void setup() {
  size(300, 300);
  gr = loadImage("fence-at-sunset2.jpg");
  smooth();
}

int cellSize = 13;//affects object size and spacing

void draw() {

  for (int y=0; y+6 <=width; y+=cellSize+15) {//y+6 shows pixel spacing, y+= cell size +15 affects starting point of diameter, +15 affects the spacing of objects
    for (int x=0; x+2<=height; x+=cellSize+5) {

      int a = int(random(0, gr.width));    
      int b = int(random(0, gr.height));   

      color myColor = gr.get(a, b);     
      fill(myColor);                        
      ellipse(x, y, cellSize, cellSize-3);//size of ellipses and spacing set

      noFill();    
      stroke(myColor);//line color set to match picture colors
      rect(x, y, random(20), random(60));//lines created with rectangles with no fill
    }
  }
  noLoop();
}

/*The picture used was of a fence at sunset. The ovals were set to match the 
pixels, while the rectangles were created to connect randomly each oval. The 
rectangle colors match the color pallette of the picture along with the oval color.

The picture itself was found online and then the colors were reverse by using Photoshop.

Original Picture:
http://www.google.com/imgres?q=fences+at+sunset&um=1&hl=en&biw=1265&bih=625&tbm=isch&tbnid=1IW5v2s0RsdByM:&imgrefurl=http://www.photographyblogger.net/25-unique-fence-pictures/&docid=D89SqJwBWOSYgM&w=500&h=332&ei=J7yHToTjC86DtgfD54Uy&zoom=1&iact=hc&vpx=445&vpy=167&dur=824&hovh=183&hovw=276&tx=165&ty=81&page=3&tbnh=127&tbnw=169&start=38&ndsp=20&ved=1t:429,r:2,s:38
*/

