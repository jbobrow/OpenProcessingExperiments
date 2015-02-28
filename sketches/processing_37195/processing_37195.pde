
size (500,500);
background(255);
smooth();

int trig = 10 ;

for (int x= 10; x<200; x+=20){
   for (int y= 10; y<200; y+=20){
     triangle (x, y, x-5, y+10, x+5, y+10);
   }
}
                
                
