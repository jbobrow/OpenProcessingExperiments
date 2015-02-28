
size(500, 500);
background(0);

for(int x=0; x<500; x=x+40)
   {
     for(int y=0; y<500; y=y+40)
        {
          rect(x, y, 10, 10);
        }
   }

smooth();
translate(width/2, height/2);
for(int i=0; i<360; i+=45)
    {
      rotate(radians(45));
          noStroke();
          fill(250, 4*i%250, 250, 2*i%200);
          rect(0, 0, 150, 150);
    }
     
     


