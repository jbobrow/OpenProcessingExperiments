
void setup()
{
size(620, 620);
background(0);
 
}
void draw()
{
 
  for (int i=0; i<620; i+=20) {
    fill (255,237,0);
    triangle(i, 30,i+ 10,10,i+20, 30); 
        
       for (int j=0; j<50; j+=20) {
         fill (255,237,0);
         triangle(i, 30+j,i+ 10,10+j,i+20, 30+j); 
       }
       
        for (int j=0; j<30; j+=20) {
         fill (255,237,0);
         triangle(i, 600+j,i+ 10,400+j,i+20, 600+j); 
       }
  }
 
 fill(#EEEEEE);
  rect(width/2-0.6, height/3,66.4,140,15,15,0,0);
 
  fill(0);
 
  triangle(width/2, height/3+140, width/2+8,height/3+120, width/2+16, height/3+140);
 triangle(width/2+16, height/3+140, width/2+24,height/3+120, width/2+32, height/3+140);
triangle(width/2+32, height/3+140, width/2+40,height/3+120, width/2+48, height/3+140);
triangle(width/2+48, height/3+140, width/2+56,height/3+120, width/2+64, height/3+140);
  
  triangle(width/2+10, height/3+30, width/2+15, height/3+60, width/2+20, height/3+35);
  triangle(width/2+44.4, height/3+35, width/2+49.4, height/3+60, width/2+54.4, height/3+30);
}
