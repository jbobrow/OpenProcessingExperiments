
size (600,600);
background(237,160,78);

int i=0;

for (int y=0; y<height; y+=20)
{
  for(int x=0; x<width; x+=20, i++)
  {
    if(random(50)<25) {
      
       //line(x,y,x*2,y*2);
       //line(x,y,x*2,y*2
       
       stroke (63,34,36);
       line (x,y,x*4,y*4);
       line (x,y,x*4,y*4);
       
      }else{
        
        float angolo =0;
        
        angolo +=0.02;
        resetMatrix ();
        translate (x,y);
        rotate (angolo);
        fill (96+random(-32,32), 144+random(-32,32), 170+random(-32,32), 30);
        ellipse(0,10,80,80);
        
      
      }
      }
      }
