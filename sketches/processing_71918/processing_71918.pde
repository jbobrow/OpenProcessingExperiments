
int xspacing = 5;   // spacing of x values
int w;              // Width - normally width of window
float theta = 0.0;  // Start angle at 0
float amp = 50.0;  // Amplitude
float period = 300;  // Td = 2PI/natural frequency in ideal system
float dx;  // deriv of x, state equation
float[] yVal;  //  store height values for the wave

void setup() {
  size(400, 360);
  w = width+16; //total length reaches beyong window scope
  dx = (TWO_PI / period) * xspacing; //dx = 2pi/wd = period *spacing
  yVal = new float[w/xspacing]; //create the array to hold values and make it only as long as necessary
  frameRate(9); 
}
void draw() {
  background(252, 204, 140);
  
  //Instructions
  PFont font;
  font = createFont("Arial", 18, true); 
  textFont(font, 14); 
  fill(0);
  String s = "Hover over the instrument to make the snake DANCE!";
  text(s, 15, 20, 100, 100);  

  //Draw in the snake!
  //translate the snake since I programmed the whole thing from the left over
  translate(width/2, height/2); 
  rotate(radians(-90));
  calcWave();
  translate(-width/2, -height/2);
  renderWave();
  translate(width/2, height/2);
  rotate(radians(90));
  translate(-width/2, -height/2);
  
  //face
  noStroke();
  fill(170, 145, 113);
  ellipse(10, 300, 150, 150);
  //turban
  fill(255);
  ellipse(5, 240, 100, 130);
  //eyes
  stroke(0);
  line(28, 320, 35, 330);
  line(35, 330, 32, 310);
  line(48, 300, 55, 310);
  line(55, 310, 52, 290);
  //basket
  fill(222, 196, 141);
  stroke(162, 147, 113);
  ellipse(250, 350, 210, 100);
  ellipse(250, 300, 200, 50);
  //cobra instrument
  stroke(186, 188, 65);
  fill(246, 250, 53);
  rect(48, 330, 40, 10);
  ellipse(82, 345, 30, 30);
  ellipse(92, 345, 10, 30);
  ellipse(98, 345, 10, 30);
  rect(100, 330, 400, 50);
  fill(0);
  for (int u = 150; u<width;u+=50)
  {
    smooth();
    ellipse(u, 345, 25, 25);
  }
  noStroke();
  //cheeks
  fill(190, 145, 113); 
  ellipse(25, 350, 40, 40);
  
  //may not apply for each round but it will always check if exclamation points are necessary
  exclamation();
  rectMode(CORNER);
}

//fill the array with important values to use later
void calcWave() {
  theta += mouseX/70;
  float x = theta;
  for (int i = 0; i < yVal.length; i++) {
    yVal[i] = (1+sin(x))*amp;
    x+=dx;
  }
}

//make the wave motion
void renderWave() {
  smooth();
  noStroke();
  fill(86, 142, 86);
  for (int x = 0; x < yVal.length; x++) {
    ellipse(x*xspacing, height/2+yVal[x], 45, 45);
  }
  xspacing = mouseX/70;
}

//if exclamation points are needed, this is where they would be added
void exclamation()
{
  if (mouseX>325) {
    //eyes
    noStroke();
    fill(255);
    ellipse(32, 320, 22, 22);
    ellipse(52, 300, 22, 22);
    stroke(0);
    fill(0);
    ellipse(32, 320, 5, 5);
    ellipse(52, 300, 5, 5);
    for (int count = 0;count<60;count+=15) {
      fill(0, 0, 0, random(130, 195));
      drawEx();
    }
  }
}

//draw the exclamation point 
void drawEx()
{
  rectMode(CENTER);
  float x_ex = random(80, 330);
  float y_ex = random(80, 230);
  float wi = 60;//random(30,65);
  float le = 100;//random(50,100);
  rect(x_ex, y_ex, wi, le);
  ellipse(x_ex, y_ex+le+random(10, 30), wi, wi);
}

