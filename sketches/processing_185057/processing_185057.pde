
void setup(){
  size(500,400);
  frameRate(2);
 
}
   
void draw()
{
   float a=random(35,40); background(a); 
   for (int p=0; p<=width; p=p+30)
   {
     for (int o=100; o<=200; o=o+20)
     {
       star(p,o);
     }
   }
 film(); 
}
 
void star(int x, int y)
{
   float m=random(height);
   float n=random(3);
   noStroke(); fill(255,y);
   rectMode(CENTER); rect(x,m,n,n);     
}

void film()
{
  frameRate(200);
  pushMatrix();
      for (int q=0; q<=width; q=q+1)
      {
        for (int r=0; r<=height; r=r+1)
        {
          float s=random(3);
          float t=random(100,200);
          noStroke(); fill(100,10);
          rectMode(CENTER); rect(q,r,s,s);
        }
      }
   popMatrix();
//JUST A NOTE: The following matrix is really cool if you make the strokeWeight really big!   
   pushMatrix();
     float crackle=random(100,230);
     float weight=random(0.1);
     for (int qi=0; qi<=width; qi=qi+100)
       {
         frameRate(200);
         float ri=random(-100,400);
         stroke(crackle,50); strokeWeight(weight);
         line(qi,ri,qi,ri+crackle);
       }
   popMatrix();
}
