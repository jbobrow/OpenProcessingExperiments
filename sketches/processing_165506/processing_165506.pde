
PFont fonty;
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave


float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
 
void setup() {
  size(816,displayHeight);
  fill(0,0,0);
  noStroke();
  rect(0,0,width,height);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  fonty = loadFont("HiraKakuPro-W6-48.vlw");
}
 
void draw() {
  background(0);
  back();
  mainPage();
  questionBoxType(120,150+30);
  questionMultipleChoice(120,250+30);
  questionRange(120,410+30);
  questionBoxType(120,510-10+30);
}
 
void back() {
  calcWave();
  renderWave(color(75,142,255,150),1);
  renderWave(color(92,216,149,150),-1);
  renderWave(color(231,234,85,150),-0.5);
  renderWave(color(60,222,199,150),0.5);
}
void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;
 
  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}
 
void renderWave(color c1, float dudly) {
  noStroke();
  fill(c1);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    rect(x*xspacing, 140+yvalues[x]*dudly, 14, 3);
  }
}

void mainPage() {
    rectMode(CENTER);

   
  fill(255,255,255);
  rect(width/2,height/2+10,width-150,height-90);
  buttonOne();
  
  fill(0);
  textFont(fonty,60);
  text("California Drought",width/2-width*0.25-65,120);
}
 
void questionBoxType(float x, float y) {
   
  fill(0);
  //line(width/2,0,width/2,height); //center line
  textFont(fonty,35);
  text("Question",x,y);
  stroke(0);
  fill(255);
  rectMode(CORNER);
  rect(x+30-2,y+18,250,25); //response box
  rectMode(CENTER);
  fill(0);
  textFont(fonty,18);
  text("Response Box", x+30, y+40);
}

void questionMultipleChoice(float x, float y) {
  textFont(fonty,35);
  text("Question",x,y);
  textFont(fonty,18);
  stroke(0);
  fill(255);
  ellipse(x+15,y+23,10,10); //a
  ellipse(x+15,y+48,10,10); //b
  ellipse(x+15,y+73,10,10); //c
  ellipse(x+15,y+98,10,10); //d
  fill(0);
  text("Answer Choice", x+30, y+30); //a
  text("Answer Choice", x+30, y+55); //b
  text("Answer Choice", x+30, y+80); //c
  text("Answer Choice", x+30, y+105); //d
}

void questionRange(float x, float y) {
  textFont(fonty,35);
  text("Question",x,y);
  textFont(fonty,18);
  text("1     2     3     4     5     6     7     8     9     10",x+30,y+30); //range
}
 
void buttonOne() {
  rectMode(CENTER);
  fill(0);
  textFont(fonty,33);
  rect(width/2, height*0.85, 150,75);
  fill(255);
  text("Continue",width/2-73, height*0.85+10);
}

