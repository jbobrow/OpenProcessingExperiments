

int segs = 12;
int steps = 6;
float rotAdjust = TWO_PI / segs / 2;
float radius;
float segWidth;
float interval = TWO_PI / segs;


void setup() {
  size(600, 600);
  background(255);
  smooth();
  ellipseMode(CENTER);
  noStroke();

  radius = min(width, height) * 0.45;
  segWidth = radius / steps;


  drawShadeWheel();
  drawTriangles();
  drawLines();
  drawLines2();
  // drawLines3();

  drawCircle(0, 0, 400);
  drawCircle2(0, 0, 400);
  drawCircle3(0, 0, 400);
  drawCircle4(0, 0, 400);
  drawTriangles();
}


void drawShadeWheel() {
  for (int j = 0; j < steps; j++) {
    color[] cols = {
      color(255-(255/steps)*j, 255-(255/steps)*j, 0), 
      color(255-(255/steps)*j, (255/1.5)-((255/1.5)/steps)*j, 0), 
      color(255-(255/steps)*j, (255/2)-((255/2)/steps)*j, 0), 
      color(255-(255/steps)*j, (255/2.5)-((255/2.5)/steps)*j, 0), 
      color(255-(255/steps)*j, 0, 0), 
      color(255-(255/steps)*j, 0, (255/2)-((255/2)/steps)*j), 
      color(255-(255/steps)*j, 0, 255-(255/steps)*j), 
      color((255/2)-((255/2)/steps)*j, 0, 255-(255/steps)*j), 
      color(0, 0, 255-(255/steps)*j), 
      color(0, 255-(255/steps)*j, (255/2.5)-((255/2.5)/steps)*j), 
      color(0, 255-(255/steps)*j, 0), 
      color((255/2)-((255/2)/steps)*j, 255-(255/steps)*j, 0)
    };
    for (int i = 0; i < segs; i++) {
      fill(cols[i]);
      arc(width/2, height/2, radius, radius, 
      interval*i+rotAdjust, interval*(i+1)+rotAdjust);
    }
    radius -= segWidth;
  }
}




void drawTriangles() {
  pushMatrix();
  smooth();
  strokeWeight(4);
  noFill();
  translate(width/2, height/2);
  for (int i = 0 ; i < 25 ; i++) {
    stroke(random(255), random(255), random(255));
    triangle(-120, 0, 120, 120, 120, 0);
    rotate(TWO_PI/24);
  }

  int segs = 12;
  int steps = 6;
  float rotAdjust = TWO_PI / segs / 2;
  float radius;
  float segWidth;
  float interval = TWO_PI / segs;
  popMatrix();
}

void drawLines()
{
  smooth();
  stroke(0);
  strokeWeight(4);
  noFill();
  int x = 0;
  for (x=0; x < width; x+=20)
  {
    line(0, x, x, height); 
    //x = x +20;
  }
}

void drawLines2()
{
  smooth();
  stroke(0);
  strokeWeight(4);
  noFill();
  //translate(width/2,height/2);
  int x = 600;
  for ( x=600; x > 0; x-=20)
  {
    line(600, x, x, 0); 
    //x = x +20;
  }
}

//   void drawLines3()
//  {
//    smooth();
//    stroke(0);
//strokeWeight(4);
//noFill();
//int x = 0;
//for(x=0; x < height; x+=20)
//    {
//      line(x,width,height,0); 
//      //x = x +20;
//    }
//  }




void drawCircle(int x, int y, int s)
{
  strokeWeight(10);
  stroke(x, y, s);
  fill(x, y, s, 40);
  translate(width/2, height/2);
  ellipse(x, y, s, s);  
  if (s > 5)         
  {
    drawCircle(x - s/2, y, s/2);  
    drawCircle(x + s/2, y, s/2);
  }
}

void drawCircle2(int y, int x, int s)
{
  stroke(x, y, s);
  fill(x, y, s, 40);
  translate(width/2, height/2);
  ellipse(x, y, s, s);  
  if (s > 5)         
  {
    drawCircle(x - s/2, y- s/2, s/2);  
    drawCircle(x + s/2, y + s/2, s/2);
  }
}

void drawCircle3(int y, int x, int s)
{
  stroke(x, y, s);
  fill(x, y, s, 40);
  //translate(width/2,height/2);
  ellipse(x, y, s, s);  
  if (s > 5)         
  {
    drawCircle(x, y- s/2, s/2);  
    drawCircle(x, y + s/2, s/2);
  }
}

void drawCircle4(int y, int x, int s)
{
  stroke(x, y, s);
  fill(x, y, s, 40);
  //translate();
  ellipse(x, y, s, s);  
  if (s > 5)         
  {
    drawCircle(x, y- s/2, s/2);  
    drawCircle(x, y -s/2*2, s/2);
  }
}







