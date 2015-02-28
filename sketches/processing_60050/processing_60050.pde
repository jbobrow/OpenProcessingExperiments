
//A Ring is a mathematical structure which satisfies
//certain axioms. This visual plays with the finite rings
//Z/nZ, highlighting their units and zero divisors.

float r = 25;
float R, dheight, dwidth;
float endAngle = PI;

int N = 10; //Number of elements in the ring
//If a finite ring has no zero divisors, then it is a field
boolean isField = false;//This will update as N changes

boolean border = true; //Show the border
boolean unitEmph = false; //Don't highlight the units
boolean zrdvEmph = false;  //Don't highlight the zero divisors
boolean categorize = false; //Don't show field/not a field label


void setup() {
  size(400, 450);
  dheight = height - 100; //Make space for text
  dwidth = width;
  R = min(dwidth, dheight)/2 - r; //size of the ring-arc
  background(0);
  noLoop();
  smooth();
}

void draw() {
  colorMode(HSB, 1.25*N, 170, 50);
  background(0);
  textAlign(BASELINE);
  textSize(20);
  fill(N-1, 100, 100);
  textAlign(LEFT);
  text("Toggle Units", 10, height-60);
  text("(u)", 10, height-40);
  fill(0, 100, 100);
  textAlign(RIGHT);
  text("Toggle Zero Divisors", width-10, height-60);
  text("(z)", width-10, height-40);
  fill(0, 0, 100);
  textAlign(CENTER);
  text("Z/" + N + "Z (Up/Down)", width/2, height-8);

  //Numbers are spaced evenly along the ring-arc
  float theta = endAngle / (N-1);
  strokeWeight(3);
  stroke(0, 0, 50);
  noFill();
  if (border)//Show the ring-arc
    arc(dwidth/2, dheight/2, 2*R, 2*R, 0, endAngle);

  //The 0-node is drawn separate, to make the for-loop simpler.
  //0 is excluded from being a zero divisor by definition, 
  //and for our purposes 0 is never a unit. (N >=2)
  drawNode(dwidth/2+R, dheight/2, 0);
  isField = true;//Assume it is a field, until we find a zero divisor
  for (int i=1; i<N; i++)
  {
    float x0 = dwidth/2 + R*cos(i*theta);
    float y0 = dheight/2 + R*sin(i*theta);
    drawConnections(x0, y0, theta, i);
    drawNode(x0, y0, i);
  }
  if (categorize && isField)
  {  
    fill(0, 0, 100);
    text("Field!", dwidth/2, dheight/2);
  }
}
//Look for inverses and zero divisors of the number (a)
void drawConnections(float x0, float y0, float theta, int a) {
  boolean isUnit = false;//short-cut for the for-loop below
  float x1 = x0;
  float y1 = x0;
  for (int n = a; n<N && !isUnit; n++)
  {
    if (a*n % N == 0)//if (a) is a zero divisor
    {
      isField = false; //Fields can't have zero divisors!
      if (zrdvEmph)
      {
        stroke(0, 100, 100);
        if (a == n) //Can't connect with a line, so we'll circle
        {
          noFill();
          strokeWeight(2);
          ellipse(x0, y0, 1.2*r, 1.2*r);
        }
        else
        {
          strokeWeight(3);
          x1 = dwidth/2 + R*cos(n*theta);
          y1 = dheight/2 + R*sin(n*theta);
          line(x0, y0, x1, y1);
        }
      }
    }
    else if (a*n % N == 1)//if (a) is a unit
    {
      isUnit = true;//inverses are unique! If we found an inverse for (a), we're done
      if (unitEmph)
      {
        stroke(N-1, 100, 100);
        if (a == n) //(a) is its own inverse, so we'll circle it
        {
          noFill();
          strokeWeight(2);
          ellipse(x0, y0, 1.2*r, 1.2*r);
        }
        else
        {
          strokeWeight(3); 
          x1 = dwidth/2 + R*cos(n*theta);
          y1 = dheight/2 + R*sin(n*theta);
          line(x0, y0, x1, y1);
        }
      }
    }
  }
}

//Draws the numbers in the ring as ellipses
void drawNode(float x, float y, int a) {
  noStroke();
  fill(a, 100, 100);
  ellipse(x, y, r, r);

  fill(0);  
  float textx = x;
  float texty = y;
  textAlign(CENTER, CENTER);
  textSize(.7*r);
  text(a, textx, texty);
}

//Various controls
void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) //Remove elements
      N = max(N-1, 2);
    else if (keyCode == UP) //Add elements
      N++;
    else if (keyCode == RIGHT) //Close ring-arc 
      endAngle += PI/12;
    else if (keyCode == LEFT)//Open ring-arc
      endAngle -= PI/12;
  }
  else {
    if (key == 'u')//toggle Unit highlighting
      unitEmph = !unitEmph;
    else if (key == 'z')//toggle Zero Divisor highlighting
      zrdvEmph = !zrdvEmph;
    else if (key == 'f')//show field or not
      categorize = !categorize;
    else if (key == ' ') //show ring-arc or not
      border = !border;
  }
  redraw();
}

