
//>>> DRAW TRIANGLES AND LINES BY MOVING THE MOUSE
//>>> DRAW CIRCLES BY PRESSING THE MOUSE
//>>> PRESS ANY KEY TO RESTART
/* Amirreza Chabouk
   YSDN Winter 2012
*/
void setup() {
  size(500, 500);
  background(125);
  frameRate(60);
  smooth();
  noStroke();
}

float a=1;
float b= random(230, 255);//Used to make bule the dominant hue
void draw() {


  float c= random(80);
  if (mousePressed) {// when mouse is pressed circles randomly appear on the canvas
    strokeWeight(random(8));
    fill(random(20), random(0), random(145), random(250));
    ellipse(random(mouseX*2), random(mouseY*2), c, c);
    ellipse(random(mouseX), random(mouseY), c, c);
  }

  stroke(255);
  fill(mouseY-10, mouseX-100, b, 150);// the values of Red and Green are based on the mouse location
  b=b-0.0001;
  stroke(255, 255, 255, random(150));
  strokeWeight(1);
  triangle(mouseX, mouseY, pmouseY-50, pmouseX-50, pmouseX+20, pmouseY+20);//positioning traingles using mouse loction
  
  if (mouseX > pmouseX) {
    strokeWeight(random(1, 1.9));
    line(mouseX, mouseY-30, pmouseY+c, pmouseX-c);//lines are appeared when the mouse moves across the canvas
  }
}

void keyPressed () { 
  if (key ==' ');
  {
    background (125);
  }
}


