
int barWidth = 20;
int lastBar = -1;

void setup() {
  size (500,500);
  background (#F09DC0);
  colorMode(HSB, width, height, 100); 
  noStroke();

}

void draw() {
//----------------------
//circle "sun"
//----------------------

 fill(#F6F7EB);
      ellipse(250,200,200,200 );
      
//----------------------
//rectangle
//----------------------

  beginShape();
    fill(#B9D1E8);
    vertex(0,215);
    vertex(500,215);
    vertex(500,500);
    vertex(0,500);
  endShape(CLOSE);

//----------------------
//gradient background
//----------------------
  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(barX, mouseY, 66);
    rect(barX, 0, barWidth, 215);
    lastBar = whichBar;
  }
//----------------------
//text
//----------------------

 if (mousePressed) {
    println(mouseX);
    textSize(32);
    fill (#FFFFFF);
    text("GOODNIGHT, SUN", 80, mouseY);
 
   }
}


