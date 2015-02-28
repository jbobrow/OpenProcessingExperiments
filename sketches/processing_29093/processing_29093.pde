


float i=0;
 int x=1;
void setup()
{
  size(800,800,P3D);
background(255);

}

void draw()
{
  
   println(i); 
  
   
   float r;
 
  if(i<= 100)
 {
    float m = map(i, 0,100, 0, 255 );
   fill(0,255-m,150-m);
 
  smooth();
      translate(width/2, height/2);
      x=x+5;
rotate(radians(x));
stroke(m,255-m,100,125);
r= 2+(3*i);

  
  //strokeWeight(m);
  rect(0,r,20,20,40,50);
  //rect(0,r,5,5);

 
  i=i+0.2;
 // i=i+(i/4)+(0.0001);
  noStroke(); 
  
  println(x);
 
  }
  
  


}

