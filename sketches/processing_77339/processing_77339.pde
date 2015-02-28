
//Hannah A. CP1 , Mods 4-5, Doubling Shapes
//http://hannahsprogrammingsite.webs.com/Doublingshapes.html
int limit=1;
int e = 2;
void setup()
{
 size(300,300);
 frameRate(1);
int limit=1;
}
void draw()
{  
   background(0);
  strokeWeight(10);
  fill(random(255),random(255),random(255));
  stroke(random(255),random(255),random(255));
  int e = 1;
  if(limit<4800)
  {
  while(e <= limit)  
  
  {
 
  ellipse(int(random(300)),int(random(300)),30,30);
  e++;
  }
   limit = limit * 2;
  }
 
     
}



