
void setup()
{
  size(600,600);
}

void draw ()
{
  int x=0;
  int y=0;
  
   
  for(int i=0;i<width;i+=30)
  {
    for(int j=0;j<height;j+=30)
    {
   fill(255,0,0);
      line(0,i,600,300); 
      line(0,j,300,0);  
           line(j,0,300,300);
           
            noFill();
             ellipse(0,j,300,300);


    }
  }
    for(int k=600;k>0;k-=30);
    {
       for(int l=600;l>0;l-=30)
    {
      line(600,l,300,0);
      line(l,600,300,300);
      line(600,l,0,300);
      noFill();
            ellipse(600,l,300,300);


    
    }
    }

             fill(0,0,0);
            ellipse(width/2,height/2,100,100);




}


