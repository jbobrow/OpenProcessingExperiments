
void setup()
{
  size(600,600);
}

void draw ()
{
  int x=0;
  int y=0;
  
   

  for(int i=0;i<width;i+=20)
  {
    for(int j=0;j<height;j+=20)
    {
     noFill();
     beginShape();
     fill(90,90,90);
     vertex(i,300);
     vertex(300,i);
     endShape(CLOSE);
     
     beginShape();
     fill(255,0,0);
     vertex(i,600);
     vertex(0,i);
     endShape(CLOSE);
     
     
      beginShape();
     fill(255,0,0);
     vertex(i,600);
     vertex(0,i);
     endShape(CLOSE);
     
     
     
     

    }
    
    for(int k=600;k>0;k-=20)
    {
      beginShape();
     fill(255,0,0);
     vertex(k,0);
     vertex(600,k);
     endShape(CLOSE);
    }
  }
  
  for(int a=0;a<width;a+=50)
  {
    for(int b=0;b<width;b+=50)
    {
      noFill();
     ellipse(300,300,a,b);
    }
  }
  
  
 

noFill();
ellipse(width/2,height/2,20,600);
ellipse(width/2,height/2,600,20);

}


