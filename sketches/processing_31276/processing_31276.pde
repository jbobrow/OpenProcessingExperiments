
void setup()
{
  size(800,800);
  background(255);
}

void draw()
{
  strokeWeight(2);
  stroke(0);
 // fill(0,5);
  noFill();

  float a;
  int b = 0;
  rectMode(CENTER);
  translate(width/2,height/2);
  int c = 10;
  float x = 0;
  float rot = 32;
  float r = PI/rot;
  float rd = 0;
  float gr = 0;
  float bl = 0;  
  
while(x<.5*rot)
  {
    b = 0;
    a = 550;
    while(b<c)
    {
      rd=random(255);
      gr=random(255);
      bl=random(255);
      fill(rd,60);
      stroke(rd,60);
      rotate((PI/4));
      rect(0,0,a,a);
      a = (sqrt(a*a+a*a))/2;
      
     // fill(255-rd,60);
     // stroke(255-rd,60);
      
      //rotate((PI/4)-rot);
      //rect(0,0,a,a);
      //a = (sqrt(a*a+a*a))/2;
      b=b+1;
    }
    strokeWeight(1);
    rotate(r);
    x = x+1;
  }
}


