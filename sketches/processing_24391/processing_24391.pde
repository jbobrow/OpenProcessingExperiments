


int m = 0;
int n = 0;
int o = 20;
int a = 30;
int b = a*2;
int c = 90;
int d = 60;
float z = 0;
int x = -900;
float y = 1200;
color to = color(92, 220, 10);
//color to = color(80, 170, 2);
color from = color(255, 255, 0);

void setup() {
  size(300, 600);
  background(255);
  m = width;
  x = -(height*2-width);
  y = height*2;
}


void draw() {
  smooth();
  noStroke();
  while(y >= 0) {
    color used = lerpColor(from, to, 1-z*0.0025);
    fill(used);
    triangle(width, 0, x, 0, width, y);
    x = x + (width/100);
    y = y - (width/100);
    z = z + 1;
  }


  while(a < 2500) {
    fill(255, 255, 0); 
    triangle(width, 0, 0, a, 0, b);
    a = a + a*2;
    b = b + b*2;
  }

  while(n < height) {
    stroke(61,147,4,20);
    strokeWeight(3);
    if(random(0,2) < 1) {
      line(width,0,m,n);
      m = m - o;
      if(m < -width) {
        m = width;
        n = n + o;
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

