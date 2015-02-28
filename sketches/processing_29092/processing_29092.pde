


float i=4;
int x=1;

float j=1;

void setup()
{
  size(800,800);
  background(0);
}


void draw()
{
  float r;

  println(i); 


  pushMatrix();
  translate(width/2, height/2);


  if(i<=1000)
  {
    float m = map(i, 0,500, 0, 255 );

    fill(150-m,255-m,100-m,50);
    smooth();


    x=x+5;
    rotate(radians(x));

    stroke(255,50);
    strokeWeight(3);



    r=sqrt(i); 

    triangle(0,r,10,i,100,i/4);



    i=i+1;//gap between spira
    // i=i+(i/4)+(0.0001);
    noStroke(); 

    println(x);
  }

  popMatrix();
}


