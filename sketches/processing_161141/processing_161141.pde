
int i = 0;
int numberOfPoints = 0;
int numberOfLines = 10;
ArrayList<PVector> points;

float temp1 = -1; 
float temp2 = -1;
float temp3 = 0;
float temp4 = 0; 

boolean allow = false;
  
void setup()
{
  size(500,500);
  background(75,0,130);
  points = new ArrayList<PVector>();
}
void draw()
{
  //background(255); 
   fill(random(255),random(255),random(255),random(255));
   if(points.size()>0)
   {
     star(temp1, temp2, 5, 10, 5);
   } 

}
void mouseClicked()
{
  if(mouseButton == LEFT)
  {
   temp1 = mouseX;
   temp2 = mouseY;
   stroke(255);
   fill(random(255),random(255),random(255),random(255));
   points.add(new PVector(mouseX, mouseY));
   PVector test = points.get(numberOfPoints);
   if(numberOfPoints > 0)
   {
     test = points.get(numberOfPoints-1);
     
     //line(test.x, test.y, mouseX, mouseY);
     temp3 = test.x;
     temp4 = test.y;
     
     allow = true;
   }
   test = points.get(numberOfPoints);
   numberOfPoints++;
   println(test.x + " " + test.y + " " + test.mag());
  }
  else if(mouseButton == RIGHT && numberOfPoints >=0 && allow)
  {
    stroke(75,0,130);
    fill(75,0,130);
    star(temp1, temp2, 5, 10, 5); 
    //line(temp3, temp4, temp1, temp2);
    numberOfPoints--;
    points.remove(numberOfPoints);
    allow = false;
  }
  fill(255);
}

void keyPressed()
{
  int keyIndex = key;
  if(keyIndex == 32)
  {
    background(75,0,130);
    points.clear();
    numberOfPoints=0;
    numberOfLines=10;
  }
  if(keyIndex == 10)
  {
    numberOfLines = numberOfPoints;
    while(numberOfLines>1)
    {
      PVector temp1 = points.get(numberOfLines-1);
      PVector temp2 = points.get(numberOfLines-2);
      
      println(temp1.x + " x1 " + temp1.y + " y1 " + temp2.x  + " " + temp2.y);
      stroke(255,255,255,120);
      line(temp1.x, temp1.y, temp2.x, temp2.y);
      numberOfLines--;
    }    
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


