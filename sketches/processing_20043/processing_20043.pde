
float r;
float g;
float b;
float a;

float Distance;

void setup()
{
  size(640,480);
  smooth();
  noStroke();
  frameRate(1);
}

void draw()
{

  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);

  Distance = dist(width/2, height/2, mouseX, mouseY)*2;
  background(Distance);

  for (float y=17.5; y <= 800; y+=150) {
    for(float x=17.5; x<= 700; x+=150) { 


      //outer circle
      fill(r, g, b, a);
      smooth();
      noStroke();
      ellipse(x, y, 200, 200);
      //inner circle
      fill(random(255));
      smooth();
      ellipse(x, y, 75, 75);
      //white 
      fill(Distance);
      arc(x, y, 50, 50, TWO_PI-PI/2, TWO_PI);
      arc(x, y, 50, 50, PI/2, PI);
      //red
      fill(r,g,b,a);
      arc(x, y, 50, 50, 0, PI/2);
      arc(x, y, 50, 50, PI, TWO_PI-PI/2);
      //eye
      fill(r,g,b,a);
      ellipse(x,y,35,35);
    }
  }
}


