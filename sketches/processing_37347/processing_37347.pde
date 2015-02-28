
/*Joseph Kotay. Practice Computational Methods.  Professor Nick Senske
 This sketch uses the for() loop command to draw a series of patterns from primitive objects. This
 design pattern is actually inspired by a Seminole quilt pattern I found online.
 There is probably a way to draw this sketch with less lines of code, using a nested loop
 that is more condense.*/

void setup() {	
  size(300,300);
  smooth();
}	

void draw() {	
  //colorMode(RGB, mouseX);  //Uncommenting this line makes the sketch interactive with the mouse position.	
  background(0);	

  // White diamond pattrens 
  for (int quadX = 0; quadX < width; quadX+=80) {	
    noStroke();
    fill(255);	
    quad(quadX, height/2,quadX+30, (height/2)+30, quadX+60, height/2, quadX+30, (height/2)-30);

    // Yellow diamond patterns
    for (int rectX = 60; rectX < width-60; rectX+=80) {	
      fill(250, 230, 30);	
      quad(rectX, height/2, rectX+10, (height/2)+10, rectX+20, height/2, rectX+10, (height/2)-10);

      //Top and bootom circles
      ellipseMode(CENTER);
      int circleSize = 60;
      for (int top_circX = 70; top_circX < width; top_circX+=80) {	
        fill(250, 230, 30);	
        ellipse(top_circX, (height/2)-40, circleSize, circleSize);

        for (int bottom_circX = 70; bottom_circX < width; bottom_circX+=80) {		
          ellipse(bottom_circX, (height/2)+40, circleSize, circleSize);

          //Top and bottom triangles
          for (int top_triangX = 0; top_triangX < width; top_triangX+=60) {
            triangle(top_triangX, height- height, top_triangX+30, height-260, top_triangX+60, height- height);

            for (int bottom_triangX = 0; bottom_triangX < width; bottom_triangX+=60) {
              triangle(bottom_triangX, height, bottom_triangX+30, height-40, bottom_triangX+60, height);
            }
          }
        }
      }
    }
  }
}	


