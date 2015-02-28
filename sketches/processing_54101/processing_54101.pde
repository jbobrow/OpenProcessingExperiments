
float interval;


void setup()
{
  size(700, 500);
  smooth();
  noLoop();
  interval = width/4.0;
}


void draw()
{
  background(0);

  for (int i=100; i<width; i+= interval)
  {
    float scaled = random(0.10, 1.5);

    float c1 = 255;
    float r = random(255);
    float g = random(255);
    float b = random(255);

    littlered(i, random(height/4, height*0.75), color(r, g, b), scaled);
  }

  //  littlered(random(100, 300), height/4, color(c1, g, b), scaled);
  //  littlered(width/2, height/2, color(r, c1, b), scaled);
  //  littlered(width*.75, random(height/2, 400), color(r, g, c1), scaled);
}

void littlered(float x, float y, color c, float s)
{
  pushMatrix();
  translate(x, y);

  scale(s);


  noStroke();
  fill(c);

  //body
  rect(-60, -40, 120, 200);

  //eye white
  fill(255);

  ellipse(0, 40, 150, 150);
  //eye center
  fill(0);
  ellipse(0, 40, 80, 80);


  //legs
  strokeWeight(3);
  stroke(255);
  line(-20, 160, -20, 180);
  line(20, 160, 20, 180);
  rect(20, 180, 10, 1);
  rect(-30, 180, 10, 1);

  //smile
  stroke(255);
  noFill();
  arc(0, 130, 15, 15, 0, PI);

  //antennae
  strokeCap(ROUND);
  noFill();
  arc(-60, -40, 50, 80, TWO_PI-PI/2, TWO_PI);
  arc(60, -40, 50, 80, PI, radians(270));
  stroke(c);
  fill(c);
  ellipse(-60, -80, 5, 5);
  ellipse(60, -80, 5, 5);

  popMatrix();
}

void mousePressed()
{
 redraw(); 
}

