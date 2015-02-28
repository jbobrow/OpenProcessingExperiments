
//////////////////////////////////
//YELLOW ILLUSION
//////////////////////////////////////
PGraphics p;
float i=0;
int g=0;
//int j=0;
void setup()
{
  size(800,800);
background(0);
p = createGraphics(4000, 4000, P2D);
//i= int(radians(0));
frameRate(100);
}

void draw()
{
  
  fill(0);
  rect(0,0,width,height);
   
   p.beginDraw();
   
   p.noStroke();
  if(i<= 3000)
 {
    float m = map(i, 0,2000, 30, 200 );
//   p.fill(0,255-m,m);
 
  p.smooth();
      p.translate(width/2, height/2);
p.rotate(i*radians(137.5));
//p.stroke(m,255-m,0,90);
  //  p.fill(200+m,200+m,255-m);
//p.rect(0,7*sqrt(i),15,15);
  //strokeWeight(m);
   if(i%2==0)
  {
    p.fill(255-m,255-m,0);
    p.rect(0,7*sqrt(i),10,10);
  }
  else if(i%3==0)
  { 

     p.fill(255,m,0);
    p.rect(0,7*sqrt(i),13,13);
  }
  else
  {
    p.fill(m,255-m,0);   
    p.rect(0,7*sqrt(i),5,5);
  }

 
  i=i+1;
 // i=i+(i/4)+(0.0001);
  p.noStroke(); 
  
  println(i);
 
  }
  p.endDraw(); 
  
 translate(width/2,height/2);
  rotate(radians(g));
  imageMode(CENTER);
  
  image(p,1600,1600);
  g+=1;
  
  


}

