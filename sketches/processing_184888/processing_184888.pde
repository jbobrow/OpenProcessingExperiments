
void setup()
{
size(480, 480);
background(140);
smooth();
stroke(#13CED6);
strokeWeight(5);
}
 
 
 void draw()
 {
   for (int i = 40; i <= 440; i += 10) {
 
     line(i, 40, i + 5, 440);
   }
 }
 


