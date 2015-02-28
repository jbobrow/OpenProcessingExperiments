
import processing.pdf.*;

void setup() {
  size(800, 800);
  cursor(CROSS);
  // Remove comment for auto-write of vector-based PDF file -- increase memory usage!
  //beginRecord(PDF, "everything.pdf");
  smooth();
  noStroke();
  frameRate(50);
  colorMode(RGB, 255);
  background(0);
}

// Variable Declaration
float angle;
float jitter;
float o = 0;

// Palette Initialisation
color c1 = color(200, 40, 60);
color c2 = color(216, 199, 169);
color c3 = color(165, 136, 105);
color c4 = color(195, 196, 192);
color c5 = color(40, 160, 10);
color c6 = color(40, 160, 10);
color c7 = color(255, 255, 255);
color c8 = color(0,0,0,0);


// Oscillator for colour cycling
void oscillator() {
  float r = random(-0.29,0.19);
}

void rdraw()
{
  translate(400,400);
  int count=0;
  while(count<random(64,24192*angle))
  { 
    if (second() % 1 == 0) { 
      jitter = random(-180, 180);
    }
    angle = ((mouseX - mouseY) + (mouseX*mouseY) + jitter*1.1)/((mouseX - mouseY) - (mouseX*mouseY) - jitter);
    float c = sin(angle);
    // LINE ONE
    fill(c1,15+sin(angle)+o);
    rotate(mouseY+c-c+mouseX);
    rect(mouseX-400,mouseY-400,10*sin(angle),.2);
    // LINE TWO
    fill(c2,12+sin(angle)+o);
    rotate(mouseY-mouseX);
    rect(mouseX-400,mouseY-400,25,.3);
    // LINE THREE
    fill(c3,20+sin(angle)+o);
    rotate((mouseX*c)+(mouseY/c));
    rect(mouseX-410,mouseY-410,10,.4);
    // LINE FOUR
    fill(c4,20+sin(angle)+o);
    rotate(mouseX-mouseY);
    //rotate(mouseX-c+c-mouseY);
    rect(mouseX-425,mouseY-425,15,.5);
    // LINE FIVE
    fill(c5,5+sin(angle)+o);  
    rotate(mouseY-c-c-mouseX*angle);
    rect(mouseX-450,mouseY-450,30,.4);
    // LINE SIX
    fill(c6,5+sin(angle)+o);  
    rotate((mouseX-angle)-c-(mouseY/angle));
    rect(mouseX-475,mouseY-475,10,.3);
    // LINE SEVEN
    fill(c7,15+sin(angle)+o);  
    rotate(mouseY-mouseX);
    rect(mouseX-500,mouseY-500,100,.2);   
    count=count+1;
  }
}

void draw()
{
  kPalette();
  kOpacityhigh();
  kOpacitylow();
  kDefault();
  kReset();
  kQuit();
  if (mousePressed == true) {
    rdraw();
  } 
  else {
  }
}


