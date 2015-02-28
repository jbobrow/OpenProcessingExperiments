
float twistiness = 10;
//float nseed = random(10), amp = 100;
float yPos=10;
float theta = radians(random(30,60));
float strokeW= 7;

void setup()
{
  size(800, 800);
 //noLoop();
 branch(twistiness);
 frameRate(7);
   //testPattern();
}

void draw()
{
 background(0);
  //fill(0);
  //text("twistiness="+twistiness, 20, 20);
  
  translate(width/2, height);
//randomSeed(10);   // get the same randoms every time
 branch(110);
}
 void branch(float len) {
// float a =(mouseX/(float)width);
 organicLine(0,0,0,-len,20,-twistiness); 
  
 
  //strokeWeight(len/10);
  //rotate(theta*180);
 // line(0,0,0,-len);
  translate(0,-len);
   stroke(255,random(20,120),random(100,200),random(10,250));
   
   
   if (len >20) { // no inf. loop

//rotate(theta*.50);
pushMatrix();
rotate(-theta*.2);
branch(len*.7);
popMatrix();
pushMatrix();
rotate(theta*.4);
branch(len*.5);
popMatrix();
pushMatrix();
rotate(theta*.2);
branch(len*.7);
popMatrix();

 
}


 }


void testPattern()
{
 
  float weights = 1;
  for (int i = 0;  i < 10; i++)
  {
    int nextX = (int) (weights);

    strokeWeight(weights);

    stroke(200, 0, 0, 127);
   
   line(10, 50, nextX, height - 50);
    translate (width/2,height/2);
    stroke(0);
    organicLine(10, 50, nextX, 50 , weights, twistiness);
 translate (width/2,height);
    strokeWeight(1);
    stroke(255);
    point(10, 50);
    point(nextX, height);

    
  }
}


void organicLine(float x1, float y1, float x2, float y2, float strokeW, float howTwisty)
{
  strokeCap(LEFT);
  //strokeWeight(4);
 
  float numSections = 30;

  float cx = x2-x1*2; // change in x
  float cy = y2-y1; // change in y

  float nx1 = x1;
  float ny1 = y1;
  //float perc = 5/numSections;
 // float n = noise(random(10,10));

  for (int i = 0; i <= numSections; i++) {
    
    float nx2 = nx1 + i/numSections * cx+ random(-5,5);
    float ny2 = ny1 + i/numSections * cy+random(-3,3);
    //if(ny1>10);
    line(nx1, ny1, nx2, ny2+numSections*2);
   ellipse(nx2, ny2,1,2);
    nx1 = nx2;
    ny1 = ny2;
    
  }
}
