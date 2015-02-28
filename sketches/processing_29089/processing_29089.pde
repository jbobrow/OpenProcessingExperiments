

float i=0;
 int x=1;
void setup()
{
  size(700,700);
background(0);

}

void draw()
{
  
   println(i); 
  
   
   float r;
 
  if(i<= 150)
 {
    float m = map(i, 0,100, 0, 255 );
   fill(random(50,150),50,150,40);
 
  smooth();
      translate(width/2, height/2);
      x=x+100; //very closely spaced, angles by which they are moving
rotate(radians(x));
stroke(m,255-m,0,90);
r= 2+(3*i);

  
  //strokeWeight(m);
  triangle(0,r,50,i/3,i,50);
  

 
  i=i+0.2;
 // i=i+(i/4)+(0.0001);
  noStroke(); 
  
  println(x);
 
  }
  
  


}

