
float gray = 0.0;
int[] xes = {50,61,83,69,71,50,29,31,17,39};
int[] yes = {18,37,43,60,82,73,82,60,43,37};

int [] x2 = new int [5];
int [] y2 = new int [5];


void setup () {
  size(400,400);
  
  for (int i = 0; i < 5; i++)
  {
    x2[i] = (int)random(1,50);
    y2[i] = (int)random(1,50);
    }
}

void draw () {
  for (int i = 0; i < 400; i++)
  {
    float percent = (float)i / 400;
    stroke(255 * percent);
    line(0,i,400,i);
  }
  for (int i = 0; i <400; i += 40)
  { 
    stroke(255);
    line(0,i,400,i);
    line(i,0,i,400);
  }
  beginShape();
  for (int i = 0; i < xes.length; i++)
  {
    vertex(xes[i], yes[i]);
  }
    endShape();
    
    pushMatrix();
    rotate(radians(20));
    translate(100,0);
    drawShapes (0,10);
    popMatrix();
   
    pushMatrix();
    translate(75,0);
    
    drawShapes (200,150);
    popMatrix();
}

void drawShapes(float offset,float offset2)
{
   beginShape();
  for (int i = 0; i < xes.length; i++)
  {
    vertex(xes[i] + offset, yes[i]+ offset2);
  }
    endShape();
}


