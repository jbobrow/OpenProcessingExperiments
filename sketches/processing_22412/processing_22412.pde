
//Problem Set 2
//Question 1
//Matthew Iannacci
void setup() {
  size(500,500);
  background(0);
}
//intended colours i wish to display
color from = color(100,80,0);
color to = color(0,116,130);
void draw() {


//loop used to create the gradient that goes throughout the canvas
for (int x = 0; x < height; x++) {
  float atm = norm(x,0,height);
  stroke(lerpColor(from,to,atm));
  rect(x,0,x,width);

}

}


