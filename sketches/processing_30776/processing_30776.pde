
//flash math(s) 08 iterative
//allonestring
//april 2011
//june 2014 converted to js
int numRows = 5;
int numColumns = 5;
int counter = 0;
tripleBlob bbb;
color[] colours;
float[] angles;
float[] radii;
PVector[] lineEnds;

void setup()
{
  size(600, 600);
  background(255, 255, 255);
  smooth();
  noStroke();
  colorMode(RGB);  
  
  colours = new color[69];
  angles = new float[69];
  radii = new float[69];
  lineEnds = new PVector[69];

  for(int r = 0; r < numRows; r++)
  {
    for(int c = 0; c < numColumns; c++)
    {
      for(int s = 0; s < (r + c + 2) / 2; s++)
      {
          colours[counter] = color(random(103)+68, random(103)+68, random(103)+68, 64);
          radii[counter] = 15 + (r + c) * 10 + random(60);
          angles[counter] = random(TWO_PI);
          counter++;
      }
    }
  }
}

void draw()
{
  background(255);
  counter = 0;
  for(int r = 0; r < numRows; r++)
  {
    for(int c = 0; c < numColumns; c++)
    {
     for(int s = 0; s < (r + c + 2) / 2; s++)
      {
        bbb = new tripleBlob(colours[counter], radii[counter], angles[counter]);

        float xpos = r * 500 / numRows + 100;
        float ypos = c * 500 / numColumns + 100;
        pushMatrix();
        translate(xpos, ypos);
        bbb.display();
        popMatrix();
        

        float lineEndsX = xpos + cos(angles[counter]) * 0.43 * radii[counter];
        float lineEndsY = ypos + sin(angles[counter]) * 0.43 * radii[counter];
        lineEnds[counter] = new PVector(lineEndsX, lineEndsY);

        angles[counter] += random(PI / 10);//TWO_PI/5;
        counter++;
        if(counter > 1)
        { 
          if(c == 0 & s == 0) 
          {
            continue;
          }
          line(lineEnds[counter-2].x, lineEnds[counter-2].y, lineEnds[counter-1].x, lineEnds[counter-1].y);
        }      
      }
    }
  }
}

//new shape to create blob shape
class tripleBlob
{
  float rotation;
  color colour;
  float angle;
  float radius;
  
  tripleBlob(color colour, float radius, float angle) 
  {
    this.colour = colour;
    this.radius = radius / 10;
    this.angle = angle;
  }
  
  void display()
  {
    smooth();
    ellipseMode(CENTER);
    fill(colour);
    stroke(127);
    beginShape();
    ellipse(0, 0, 4*radius, 4*radius);
    ellipse(cos(angle)* 3*radius, sin(angle)*3*radius, 1.5*radius, 1.5*radius);
    ellipse(cos(angle) * 4.3 * radius, sin(angle) * 4.3 * radius, 0.7 * radius, 0.7 * radius);
    endShape();
  }
}



