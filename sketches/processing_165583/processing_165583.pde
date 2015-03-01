
PFont fonty;
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
 
float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
  
void setup() {
  size(816,900);
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
  pledges(150,215);
  pledges(150,335);
  pledges(150,455);
  pledges(150,575);
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
  text("Pledge to save!",width/2-width*0.25-7,120);
}
  
void pledges(float x, float y) {
  fill(0);
  textFont(fonty, 35);
  text("Will you pledge to...",x-30,y-35);
  textFont(fonty,35);
  textFont(fonty,24);
  text("Yes",x,y);
  text("No",x,y+30);
  fill(255);
  stroke(0);
  ellipse(x-10,y-10,10,10);
  ellipse(x-10,y+22,10,10);
  noStroke();
  fill(0);
  textAlign(LEFT);
}    

void buttonOne() {
  rectMode(CENTER);
  fill(0);
  textFont(fonty,33);
  rect(width/2, height*0.85, 150,75);
  fill(0);
  text("Find your new percentile",width/2-170,height*0.85-50);
  fill(255);
  text("here!",width/2-36, height*0.85+10);
} 
