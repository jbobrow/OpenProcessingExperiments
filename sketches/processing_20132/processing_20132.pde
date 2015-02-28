
//Note borrowed code snippets from here: http://processing.org/learning/anatomy/

//version of this is in white o'reilly book
int nSides = 5;
float proportion;
float maxDist;
float rotationSpeed;
int intervalVar = 10;
void setup()
{
 size(1000,800);
 noStroke();
 smooth(); 
 maxDist = dist(0,0, width, height);

}

void draw()
{
 background(10); 
 //proportion = random(0.2, 0.8) * cos(PI / nSides);
 proportion = .5 * cos(PI / nSides);
 
intervalVar = mouseY/20;
 
 for (int i = 0; i<=width; i+=10 + intervalVar)
 {
  for(int j=0; j<=height;j+=10 + intervalVar)
   {
    float mouseDistance = dist(mouseX,mouseY,i,j);
    float diameter = (mouseDistance/maxDist) * 100;
    float nsideVar = 3 + mouseX/5;//had to play with this a bit to get good variation in number of star sides (increases w/ x of mouse)
   
    println(nsideVar);
    nSides = int((mouseDistance/maxDist)*nsideVar);
    float mouseDistanceNonZero = mouseDistance + 1;
    rotationSpeed = (maxDist/mouseDistanceNonZero);
    //println(rotationSpeed);
  
   //star(nSides, cx, cy, 24, proportion);  //this was the original call to star function from polystar example
   
   star(nSides, i,j, diameter/2, proportion, i, j, rotationSpeed); 
   
   } 
 }
 
}


void star(int n, float cx, float cy, float r, float proportion, int ix, int jy, float rotationSpeed)
{
  star(n, cx, cy, 2.0 * r, 2.0 * r, 0.0, proportion, ix, jy, rotationSpeed);
}

void star(int n, float cx, float cy, float w, float h,
  float startAngle, float proportion, int ix, int jy, float rSpeed)
{
  float rotationAngle = 0.0;
  pushMatrix();
  //translate(ix, jy);
  //rotate(rotationAngle); 
  
  rotationAngle += rSpeed;
  
  if (n > 2)
  {
    float angle = TWO_PI/ (2 *n);  // twice as many sides
    float dw; // draw width
    float dh; // draw height
    
    w = w / 2.0;
    h = h / 2.0;
  

  beginShape();
 
    for (int i = 0; i < 2 * n; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * proportion;
        dh = h * proportion;
      }

      vertex(cx + dw * cos(startAngle + angle * i),
        cy + dh * sin(startAngle + angle * i));
    
    }
    endShape(CLOSE);
    
  }
  
  popMatrix();
}



