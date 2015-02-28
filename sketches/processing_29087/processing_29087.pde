

int i=0;
float theta=0;


void setup() 
{
  size(600,600);
  noStroke();
  background(255);
}



void draw() 
{

  for (int n=0;n<400;n++) 
  {

    theta=theta+PI/8;

    float x=1.5*n*sin(theta);
    float y=1.5*n*cos(theta);

    fill(n,n,500-n);
    
    pushMatrix();
    translate(width/2,height/2);
    //rotate(y); //if rotated jelly effect
    translate(x,y);
    ellipse(0,0,25,25);
    popMatrix();
  }
}


