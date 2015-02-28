
size(500,500);
background(0);

for(int x=0; x<500; x=x+10)
    {
      for(int y=0; y<500; y=y+10)
         {
           fill(x%250, y%250, y%250);
           rect(x, y, 2, 2);
         }
    }


