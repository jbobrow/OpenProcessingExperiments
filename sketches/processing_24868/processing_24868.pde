
void setup() {
  size(250,500);
  smooth();
  background(0);
}

void draw() {
  scale(.5);
  color from = color(255);
  color to = color(80,210,232);
  color intA = lerpColor(from,to,.2);
  color intB = lerpColor(from,to,.4);
  color intC = lerpColor(from,to,.6);
  color intD = lerpColor(from,to,.8);
  color insideBLUE = color(80,210,232);
  color insideINTA = lerpColor(insideBLUE,from,.8);
    color insideINTB = lerpColor(insideBLUE,from,.6);
      color insideINTC = lerpColor(insideBLUE,from,.4);
        color insideINTD = lerpColor(insideBLUE,from,.2);



          noFill();
  stroke(from);
  strokeWeight(10);
  ellipseMode(CENTER);
  ellipse(250,500,200,200);
  {
    noFill();
    stroke(intA);
    strokeWeight(4);
    ellipseMode(CENTER);
    ellipse(250,500,210,210);
    {
      noFill();
      stroke(intB);
      strokeWeight(3);
      ellipseMode(CENTER);
      ellipse(250,500,215,215);
      {
        noFill();
        stroke(to);
        strokeWeight(1);
        ellipseMode(CENTER);
        ellipse(250,500,220,220);
        {
           noFill();
        stroke(insideINTA);
        strokeWeight(8);
        ellipseMode(CENTER);
        ellipse(250,500,190,190);
        {
           noFill();
        stroke(insideINTB);
        strokeWeight(4);
        ellipseMode(CENTER);
        ellipse(250,500,185,185);
        {
           noFill();
        stroke(insideINTC);
        strokeWeight(2);
        ellipseMode(CENTER);
        ellipse(250,500,180,180);
        }
        }
        }
      }
    }
  }
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}

