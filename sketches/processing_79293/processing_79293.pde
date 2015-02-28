
float start1 = 0.0;
float start2 = 1.0;
float increment = 0.01;
float a, b, xPos, yPos;


void setup () {
    size(600,600);
    background(0);
}
  
void draw () {
  xPos = (int)(noise(start1+= increment) * height);
  yPos = (int)(noise(start2+= increment) * height);
  fill(0, 1);
  rect(0, 0, width, height);
  smooth();
  noStroke();
  fill(255);
  ellipse(xPos,yPos,mouseX/2, mouseY/2);
  if(mousePressed){
   xPos = xPos*-1;
   yPos = yPos*-1;
  }
}
