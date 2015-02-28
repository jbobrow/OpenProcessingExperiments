
int total = 20; // How many points do we want to remember? If it's slow.. make it smaller.
int[] x = new int[total];
int[] y = new int[total];
 
void setup() {
  size(800, 600);
  smooth();

}
 
void draw() {
  background(200);
 
  // Shift everything down by one
  for (int i = x.length-1; i > 0 ; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
 
// Set the top of to our most recent mouse points
  x[0] = mouseX;
  y[0] = mouseY;
 
//Draw the last 50 points
  for (int i = x.length-1; i > 0 ; i--) {
 
    fill(55+i*10); // Make it fade out as they get older
 
// Draw a bullseye and make it wiggle... GO BANANAS!
  drawTeddy(i);
  
    //for (int j = 0; j < i; j +=5) {
    //  ellipse(x[i]+random(-i, i)/5, y[i]+random(-i, i)/5, 5*j, 5*j);
    //}
  }
}

void drawTeddy(int i) {
  int r = int(random(-i, i));
  int a = i;
  stroke(255);
  //ears
  ellipse(x[i]+20+r, y[i]-30+r, 20+a, 20+a);
  ellipse(x[i]-20+r, y[i]-30+r, 20+a, 20+a);
  //body
  ellipse(x[i]+r, y[i]+20+r, 50+a, 60+a);
  //head
  ellipse(x[i]+r, y[i]-10+r, 50+a, 50+a);
  //arms
  ellipse(x[i]+20+r, y[i]+15+r, 20+a, 20+a);
  ellipse(x[i]-20+r, y[i]+15+r, 20+a, 20+a);
  //legs
  ellipse(x[i]+20+r, y[i]+35+r, 35+a, 35+a);
  ellipse(x[i]-20+r, y[i]+35+r, 35+a, 35+a);
  //nose
  fill(255);
  ellipse(x[i]+r, y[i]-5+r, 7+a, 7+a);
  //mouth
  line(x[i]+5+r, y[i]-6+r, x[i]-10+r+a, y[i]+5+r+a);
  line(x[i]-5+r, y[i]-6+r, x[i]+10+r+a, y[i]+5+r+a);
  //eyes
  ellipse(x[i]+10+r, y[i]-12+r, 7+a, 7+a);
  ellipse(x[i]-10+r, y[i]-12+r, 7+a, 7+a);
}               
