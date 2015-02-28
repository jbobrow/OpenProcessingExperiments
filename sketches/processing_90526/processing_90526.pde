
// © Julia Shen 
// yuans @ andrew.cmu.edu

float x, y, wd, ht;

void setup()
{

size(400, 400);
smooth();
background(205, 255, 246);

x = width/2;
y = height/2;
wd = width;
ht = height;
  
}

void draw()
{
  figure(50, 50, wd/7, ht/7);
  figure(150, 50, wd/7, ht/7);
  figure(250, 50, wd/7, ht/7);
  figure(350, 50, wd/7, ht/7);
  
  figure(50, 150, wd/7, ht/7);
  figure(150, 150, wd/7, ht/7);
  figure(250, 150, wd/7, ht/7);
  figure(350, 150, wd/7, ht/7);
  
  figure(50, 250, wd/7, ht/7);
  figure(150, 250, wd/7, ht/7);
  figure(250, 250, wd/7, ht/7);
  figure(350, 250, wd/7, ht/7);
  
  figure(50, 350, wd/7, ht/7);
  figure(150, 350, wd/7, ht/7);
  figure(250, 350, wd/7, ht/7);
  figure(350, 350, wd/7, ht/7);
}


void figure(float fx, float fy, float fwd, float fht)
{
  noStroke();
   fill(255, 179, 179);
  ellipse(fx - 20, fy - 20, fwd, fht);
  ellipse(fx - 20, fy + 20, fwd, fht);
  ellipse(fx + 20, fy - 20, fwd, fht);
  ellipse(fx + 20, fy + 20, fwd, fht);
  fill(255, 242, 117);
  ellipse(fx, fy, fwd, fht);
  
  
  if (mousePressed == true)
  {
    fill (random(255), random(255), random(255));
    ellipse(x - 70, y - 80, wd*.4, ht*.4 );
    ellipse(x + 60, y - 90, wd*.4, ht*.4);
    ellipse(x + 100, y + 30, wd*.4,  ht*.4);
    ellipse(x + 30, y + 100, wd*.4, ht*.4);
    ellipse(x - 80, y + 50, wd*.4, ht*.4);
    fill (random (255), random(255), random(255));
    ellipse(x, y, wd/2, ht/2);
  }
  
}



