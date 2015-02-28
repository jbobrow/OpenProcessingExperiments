
float x;
float y;
float xpos = 0.0;


void setup() {
  size(1450, 500);
  background(0);
  smooth();
}
void draw() 
{ 
  frameRate(10);

  x=random(width);
  y=random(height);


  for ( int i=0; i<width; i++)
  {

    float n=random(0.2)*80;
    fill(random(100,200), random(100, 255), random(255, 200),random(100));
    noStroke();
    xpos=xpos+0.01;
    float m=noise(xpos)*width;

    rect(i, m, 6,5);
    x++;
    y++;
  }
}



