
int r;


 void setup() {

   size(900,900);
   r = 30;
   smooth();
 }

 void draw() {
      background(0);
   
   for(int y=15; y<height; y+=r) {
     for(int x=15; x<width; x+=r) {
       fill(random(0,35),random(150,155),random(200), 250);
fill(250,192,203);
ellipse(x, y, r, r);
fill(250,128,114);
fill(0);
ellipse(x-6, y-3, r/5, r/3);
ellipse(x+6, y-3, r/5, r/3);
fill(255);
ellipse(x-7, y-5, r/15, r/7.5);
ellipse(x+5, y-5, r/15, r/7.5);
fill(250,128,114);
ellipse(x, y+6, r/5, r/10);
fill(205,92,92);
ellipse(x+9, y+4, r/6, r/10);
ellipse(x-8, y+4, r/6, r/10);
     }
   }
   
   
   
int specialX = mouseX - (mouseX % r-15);
int specialY = mouseY - (mouseY % r-15);
   
fill(152,251,152);
rect(specialX-15,specialY-15, 30,30);
fill(255);
ellipse(specialX-7,specialY-5, 8,8);
ellipse(specialX+5,specialY-5,12,12);
fill(0);
ellipse(specialX-8,specialY-3, 3,3);
ellipse(specialX+8,specialY-6, 5,5);
fill(0);
line(specialX-5,specialY+7, specialX+2,specialY+7);
line(specialX-5,specialY+7, specialX-8,specialY+9);
line(specialX+2,specialY+7, specialX+5,specialY+9);
   
   
if (mousePressed)
{
  fill(0);
rect(specialX-15,specialY-15, 30,30);


  
fill(152,251,152);
ellipse(specialX, specialY, r, r);
fill(250,128,114);

fill(0);
line(specialX-9,specialY-9, specialX-5,specialY-11);
line(specialX+9,specialY-9, specialX+5,specialY-11);

fill(0);
ellipse(specialX-6, specialY-3, r/5, r/3);
ellipse(specialX+6, specialY-3, r/5, r/3);
fill(255);
ellipse(specialX-7, specialY-5, r/15, r/7.5);
ellipse(specialX+5, specialY-5, r/15, r/7.5);

fill(0);
line(specialX+7,specialY+7, specialX-7,specialY+10);
line(specialX-7,specialY+7, specialX+7,specialY+10);


fill(205,92,92);
ellipse(specialX+9, specialY+4, r/6, r/10);
ellipse(specialX-8, specialY+4, r/6, r/10);
} 





//else 

/*{
fill(35,150,250);
ellipse(specialX, specialY, r, r);
fill(250,128,114);
fill(0);
ellipse(specialX-6, specialY-3, r/5, r/3);
ellipse(specialX+6, specialY-3, r/5, r/3);
fill(255);
ellipse(specialX-7, specialY-5, r/15, r/7.5);
ellipse(specialX+5, specialY-5, r/15, r/7.5);
fill(250,128,114);
ellipse(specialX, specialY+6, r/5, r/10);
fill(35,100,150);
ellipse(specialX+9, specialY+4, r/6, r/10);
ellipse(specialX-8, specialY+4, r/6, r/10);
}*/

   
 }


