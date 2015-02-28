
// limits the number of rectangles
int num = 20;
// sets the arrays
float [] x = new float[num];
float [] y = new float[num];
float [] speed = new float[num];
color [] c = new color[num];

void setup()  {
  size(300, 300);
  background(255);
  colorMode(RGB,width);
  rectMode(CENTER);
 
  //seed the arrays
  for (int i = 0; i < num; i++)  {
    x[i] = random(width);
    y[i] = random(height);
    speed[i] = 2;
    c[i] = color(0, random(width/2), 100);
  }
   
}

void draw()  {
  background(255);
 
  for (int i = 0; i < num; i++)  {
    stroke(200);
    fill(c[i],255);
    rect(x[i], y[i], 100, 50);
    rect(x[i]*2, y[i]*2, 10, 100);
    x[i] = x[i] + speed[i];
    if (x[i] > width)  {
      x[i] = 0;
    } 
  }
}


