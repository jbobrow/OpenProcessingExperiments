
// make a gaudy, crazy drawing
// @author: hugh s
// @title: gaudy drawing

void setup() {
  size(1000, 700);
  background(0);
  noCursor();
}
color c = color(255,255,255);

void draw() {

  // this section makes the white center circle
  noStroke();
  fill(c, c);
  ellipse(mouseX,mouseY, 20,20);
  explode();
  
}

void explode() {
   // creates an ellipse as long as i is > 0, decremented by 20
   // this ellipse is displaced by translate in a random direction
   // determined by a random number between -10 and 10
   
   for(int i = 255; i>0; i = i-20) {
     translate(random(-10,10), random(-10,10));
     fill(i/random(1,4),i/random(1,4),i/random(1,4));
     ellipse(mouseX,mouseY,20,20);
   }
}

//this section changes the background and clears the page on mouse click
void mouseClicked() {
  background(random(0,255),random(0,255),random(0,255));
}                                               
