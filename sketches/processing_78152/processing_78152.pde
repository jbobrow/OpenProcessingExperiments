
PImage miImagen;


  size(800,400);

  background(0); 
  miImagen=loadImage("Lenna.jpg");
  image(miImagen,0,0);
  loadPixels();
  frameRate(10);
int j=399;
int lim1=400, lim2=800, lim3=0;
  /*for(int i=0;i<320000;i++)
  {
    if(i>=lim1&&i<lim2)
    {
     pixels[i]=pixels[j];
     j++;
     if(j==lim1)
     {
       j=lim2;
       lim1=j+400;
       lim2=j+800;
     }
    }
  }*/
  for(int i=0;i<320000;i++)
  {
    if(i>=lim1&&i<lim2)
    {
      pixels[i]=pixels[j];
      j--;
     if(j==lim3)
     {
       lim3+=800;
       lim1+=800;
       lim2+=800;
       j=lim1;
     }
    }
  }
  /*for(int i=0;i<400;i++)
  {
    for(int j=0;j<400;j++)
    {
      pixels[i*800+400+j]=pixels[i*800+j];
    }
  }*/
  updatePixels();
  

