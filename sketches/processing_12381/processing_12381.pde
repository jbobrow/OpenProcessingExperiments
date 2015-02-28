
void setup (){

 size (1000,700);
int centerx=width/2;
int centery=height/2;
background(255);
colorMode(HSB,2000);
stroke(1); 
int Triangle_Scale=2000;
int ax=centerx;
int bx=centerx-Triangle_Scale;
int cx=centerx+Triangle_Scale;
int ay=centery-Triangle_Scale;
int by=centery+Triangle_Scale;
int cy=by;
fill(Triangle_Scale);
triangle(ax,ay,bx,by,cx,cy);
for(int i=Triangle_Scale; i>0; i=i-12)
{  bx=centerx-i;
   cx=centerx+i;
   ay=centery-i;
   by=centery+i;
   cy=by;
  fill(i+950,2000-i,1500);  
  triangle(ax,ay,bx,by,cx,cy);
  
}
  
}


