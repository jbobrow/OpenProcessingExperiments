
color c;

void setup ()
{
  size(200,200);
  background (#1ab40d);
}
void draw()
{
for(int i=0;i<=255;i++){

for(int j=0;j<=255;j++){
c=color(mouseX,i,j);
set(i,j,c);
}
}
for( int x = 0; x <= width/2; x++)
{
   for( int y = 0; y <= height/2; y++)
   {
     fill(#2D5817);
     ellipse (x *20 , y*20, 22 ,22);  
     fill (#e8c410); 
     ellipse(  x * 20 , y * 20, 18, 18);
     fill (#de5e09); 
     ellipse ( x *20, y*20, 10, 10);
     fill (#C65204); 
     ellipse ( x *20, y*20, 8, 8);
     
 } 
  }
}

                
                                
