

float i=0;
 int x=1;
void setup()
{
  size(800,800,P3D);
background(0);

}

void draw()
{
  
   println(i); 
  
   
   float r;
 
  if(i<= 100)
 {
    float m = map(i, 0,100, 0, 255 );
   fill(0,255-m,m);
 
  smooth();
      translate(width/2, height/2);
      x=x+5;
rotate(radians(x));
stroke(m,255-m,0,90);
r= 2+(3*i);

  
  //strokeWeight(m);
  rect(0,r,5,5,10,20);
  //rect(0,r,5,5);

 
  i=i+0.2;
 // i=i+(i/4)+(0.0001);
  noStroke(); 
  
  println(x);
 
  }
  
  


}

