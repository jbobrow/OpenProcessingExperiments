
//////////////// Project_ MOUSE POSITION & COLOUR BEHAVIOUR \\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2013\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


float x=10;
float y = 10;

void setup() {
  size(500,500);
  smooth();
  strokeWeight(.01);
  background(255);
}


void draw() {


  for (int i =0; i<100;i+= 3) {
    for(int j =0;j<100;j+= 3 ) {
      noStroke();
      line(mouseX,mouseY,x*i/2,y*j/2);
      noStroke();
      fill(random(0,mouseX),random(mouseY,0),random(i,i+j));
      ellipse(x*i/2,y*j/2,mouseX/105*i/10,mouseX/105*i/10);
    }
  }
}


//////////////// Project_ MOUSE POSITION & COLOUR BEHAVIOUR \\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2013\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


