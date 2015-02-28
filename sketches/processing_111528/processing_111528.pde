
PImage buckets1;
float thickness = 1.5;

void setup() 
{
  size(600, 800); 
  buckets1 = requestImage("buckets1.jpg"); 
} 

void draw()
{
  println("x: " + mouseX + " y: " + mouseY);

  if (buckets1.width > 0)
  {
    buckets1.filter(POSTERIZE, 15);
    image(buckets1, 0, 0);
  } 
  
  //Blue lines
  stroke(131, 223, 255, 170);
  strokeWeight(4);
  line(0, 709, 600, 706);
  strokeWeight(2);
  line(0, 696, 600, 685);
  line(0, 683, 600, 660);
  line(0, 670, 600, 620);
  line(0, 657, 600, 648);
  line(0, 630, 600, 680);
  
  strokeWeight(6);
  line(0, 722, 600, 722);
  line(0, 735, 600, 735);
  line(0, 748, 600, 748);
  strokeWeight(8);
  line(0, 761, 600, 761); 
  line(0, 774, 600, 774);
  line(0, 787, 600, 787);
  line(0, 800, 600, 800);
  
  //Animated stuff
float x = 0;
  float y = 0;
  float prevX = x;
  float prevY = y;
  strokeWeight(5);
  stroke(209, 56, 190, 80);

  while (x < 700)
  {
    x += 1;
    y += random(-6, 6);
    line(prevX, prevY, x, y);
    prevX = x;
    prevY = y;
  }
  
  float A = 8;
  float B = 8;
  float prevA = A;
  float prevB = B;
  strokeWeight(6);
  stroke(15, 183, 127, 70);

  while (A < 700)
  {
    A += 5;
    B += random(-6, 5.5);
    line(prevA, prevB, A, B);
    prevA = A;
    prevB = B;
  }

float C = 10;
  float D = 10;
  float prevC = A;
  float prevD = B;
  strokeWeight(6);
  stroke(96, 11, 139, 70);

  while (C < 700)
  {
    C += 1;
    D += random(-5, 4);
    line(prevC, prevD, C, D);
    prevC = C;
    prevD = D;
  }

//Nose  
 stroke(183, 2, 5, 80);
  thickness = thickness + 1; 
  if (thickness > 17)
  {
    thickness = 1.5;
  }
  
  strokeWeight(thickness); 
  fill(0);
  ellipse(351, 442, 50, 43);

}


