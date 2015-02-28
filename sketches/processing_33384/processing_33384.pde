
//this program can be used to represent the 
//intensity of any particular parameter on a grid 
//The number of circles increases as we move along the positive x -direction

PFont font;
float randomBValue;
void setup() {
  size(800, 800);
  font = createFont("Helvetica", 11, true);
  textFont(font,20);
}

void draw() {


  background(0);
  fill(255);
  text("X-AMPLITUDE: "+mouseX, 10, 20);


  noFill();

  //creates circles that are equal in number to current x-position
  //chooses random colours for the contours
  for (int i=1;i<=mouseX;i++)
  {
    randomBValue=random(0,255);
    stroke(mouseY, mouseX, randomBValue);
    ellipse(random(width/2-width/4, width/2+width/4), random(height/2-height/4, height/2+height/4), random(0, 400), random(0, 400));
  }

}

                
                
