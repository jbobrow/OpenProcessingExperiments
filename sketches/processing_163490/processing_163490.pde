
float delta = 2;
float p = 100;
float pi = 0;
float X, Y, Z = 0;

void setup()
{
  size(800, 800, P3D);
  smooth();
  
}

void draw()
{
  background(30);
  translate(width/2,height/2,0);
    
  rotateX (X);
  rotateY (Y);
  
  X += 0.06;
  Y += 0.09;
  
  
  for (float u = 0; u < 1000; u++)
  {
    point(random(width)-width/2,random(height)-height/2,random(-600,600));
    stroke(255);
    strokeWeight(2);
  }
  
  
  
  
  for (float pi = 0; pi < 360; pi += 5)
  {
    for(float deg = 0; deg <360; deg += delta)
    {
      float theta = radians(deg);
      float x1 = p * sin(pi) * cos(theta);
      float y1 = p * sin(pi) * sin(theta);
      float z1 = p * cos(pi);
      stroke(30,60,180,100);
      strokeWeight(3);
      point(x1,y1,z1);
      
      float x2 = p / 3 * sin(pi) * cos(theta);
      float y2 = p / 3 * sin(pi) * sin(theta);
      float z2 = p / 3 * cos(pi);
      stroke(180,60,30,100);
      strokeWeight(3);
      point(x2,y2,z2);
      
      float x3 = p / 1.7 * sin(pi) * cos(theta);
      float y3 = p / 1.7 * sin(pi) * sin(theta);
      float z3 = p / 1.7 * cos(pi);
      stroke(150,60,30,100);
      strokeWeight(2);
      point(x3,y3,z3);
      
      float x4 = p / 1.3 * sin(pi) * cos(theta);
      float y4 = p / 1.3 * sin(pi) * sin(theta);
      float z4 = p / 1.3 * cos(pi);
      stroke(120,120,70,100);
      strokeWeight(2);
      point(x4,y4,z4);
      
      float x5 = 150 + p / 4.3 * sin(pi) * cos(theta);
      float y5 = 150 + p / 4.3 * sin(pi) * sin(theta);
      float z5 = 150 + p / 4.3 * cos(pi);
      stroke(100,100,100,100);
      strokeWeight(2);
      point(x5,y5,z5);
      
      float x6 = 220 + p / 5.3 * sin(pi) * cos(theta);
      float y6 = 50 + p / 5.3 * sin(pi) * sin(theta);
      float z6 = -300 + p / 5.3 * cos(pi);
      stroke(180,140,140,100);
      strokeWeight(2);
      point(x6,y6,z6);
      
      float x7 = -170 + p / 5.8 * sin(pi) * cos(theta);
      float y7 = -80 + p / 5.8 * sin(pi) * sin(theta);
      float z7 = 200 + p / 5.8 * cos(pi);
      stroke(180,220,160,100);
      strokeWeight(2);
      point(x7,y7,z7);

    }
  }
 
  
  if (mousePressed)
  {
   sphere(110);
   fill(0); 
  }
 
}
