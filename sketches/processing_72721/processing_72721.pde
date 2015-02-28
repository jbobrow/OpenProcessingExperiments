
//Sarah Anderson, seanders
//ems2 hw5, wallpaper

size(400,400);
smooth();

for(int x=0; x<width; x+=20)
{
  for (int y=0; y<height; y+=20)
  {
   //noStroke(); 
   fill(255,0,0,100); 
   rect(x,y, 40,40);
   fill(50,50,50);
   stroke(0);
   /*
   line(y,y,width/2,height/2);
   line(y,y,width/2,height);
   line(y,y,width/2,0);
   line(y,y,0,height/2);
   line(y,y,width,height/2);
   */
  }  
}

for (int i=0; i<width ;i+=35)
{
  for(int n=0; n<height; n+=35)
  {
   stroke(0,0,255);
   fill(0,0,255,60);
   rect(i,n,40,40);
   stroke(255,255,255,100);
   line(i,n,230,230);
   ellipse(n,n,10,10);
   line(n,n, 0,height);
   line(n,n,width,0);
   line(n,n,width,height);
   line(n,n,width,height/2);
   line(n,n,0,height/2);
   
   
  }  
}
