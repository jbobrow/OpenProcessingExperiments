
float circleDi=50;
float circleLoc1=50;
float circleLoc2=150;
float strokeSize=2;
float backColour= random(1,255);
float circleCol= random(1,255);
float change1= random(0.1,0.5);
// Your basic setup
void setup() {
  size(200,200);
  smooth();
}

void draw() {
  // Draw the background and the ellipse
  // Variables are used for everything: background, stroke, fill, location, and size.
  background(backColour);
  stroke(strokeSize);
  fill(100);
  ellipse(circleLoc1,circleLoc1,circleDi,circleDi);
   ellipse(circleLoc1,circleLoc2,circleDi,circleDi);
    ellipse(circleLoc2,circleLoc1,circleDi,circleDi);
     ellipse(circleLoc2,circleLoc2,circleDi,circleDi);
  
   circleDi= circleDi+change1;
circleLoc1=circleLoc1+change1;
circleLoc2=circleLoc2+change1;
     
}


