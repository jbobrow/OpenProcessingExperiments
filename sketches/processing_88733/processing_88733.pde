
color[] palette = new color[5];
color c1;
color c2;
color c3;
color c4;
color c5;
color bgColor;

int swarmSize;
int xVariance;
int yVariance;
int maxSize;
int maxOpacity;
int maxStroke;

//Non-definables for swarm gen
int sideMod;
int sSize;
int opacity;
int stroke;

void setup() {
  size(600,400);

  c1= #BF2633;
  c2= #A6242F;
  c3= #D9CEAD;
  c4= #C0B18F;
  c5= #011C26;
  bgColor = #CDE1FF;

  palette[0] = c1;
  palette[1] = c2;
  palette[2] = c3;
  palette[3] = c4;
  palette[4] = c5;

  swarmSize = 1;
  xVariance = 60;
  yVariance = 60;
  maxSize = 30;
  maxOpacity = 255;
  maxStroke = 4;
}

void draw() {
}

void drawSwarm() {
  for (int i = 0; i < swarmSize; i++)
  {
    if (random(1, 10) < 5) {sideMod = -1;} 
    else {sideMod = 1;}
    stroke = int(random(1,maxStroke));
    sSize = int(random(1, maxSize));
    opacity = int(random(0, maxOpacity));
    
    strokeWeight(stroke);
    stroke(palette[int(random(1, 5))], opacity);
    fill(palette[int(random(1, 5))], opacity);

    // strokeWeight(int(random(1, 7)));
    ellipse(mouseX + int(random(1, xVariance)) * sideMod, mouseY+ int(random(1, yVariance)), sSize, sSize);
  }
}

void mouseMoved(){
    drawSwarm();
  }
  
void keyPressed(){
  background(bgColor);
} 




