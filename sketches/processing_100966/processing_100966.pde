
/*A shy fellow couldnt control his excitement
after looking a beautiful girl(my favourite).Close the curtain 
by just moving mouse in any direction and later press it. Do the
same for a while and see wat is the condition of that fellow..
Just for experiment....*/


Maxim maxim;
AudioPlayer player;
PImage img;
float w=320,h=240;
float x = w-20;
float y = h-40;
float eas = 0.01;
float k=w,l=h;
int barWidth = 20;
int lastBar = -1;

void setup() {
size(1366,768);
 colorMode(HSB, width, 100, width);
maxim = new Maxim(this);
  player = maxim.loadFile("kaze1.wav");
  player.setLooping(true);
  img = loadImage("boa1.png");
smooth();
strokeWeight(12);
ellipseMode(RADIUS);
}
void draw() {
  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(barX, 100, mouseY);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
  }
if (mousePressed) {
  background(img);
  fill(255);
  stroke(0);
  ellipse(320,240,50,100);
  player.play();
  strokeWeight(2);
  fill(0);
  ellipse(w - 20,h - 40,20,20);
  ellipse(w + 20,h - 40,20,20);
  fill(255,0,0);
  beginShape();
  vertex(w - 20,h);
  vertex(w,h-10);
  vertex(w+20,h);
  vertex(w,h+10);
  endShape(CLOSE);
  stroke(255,0,0);
  arc(w,h+25,25,50,0,PI);
 strokeWeight(2);
  fill(0);
   float targetX = w+40;
x += (targetX - x) * eas;
fill(255);
ellipse(x, y, 7, 7);
 ellipse(x+30, y, 7, 7);
float targetY = mouseX;
k += (targetX - k) * eas;
fill(255,0,0);
beginShape();
vertex(k - 20,l);
  vertex(k,l-10);
  vertex(k+20,l);
  vertex(k,l+10);
  endShape(CLOSE);
}
}





