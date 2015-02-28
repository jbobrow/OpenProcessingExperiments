
import processing.pdf.*;

size(300,600);
smooth();
background(0);
  
 


//draw something here
for (int rep=0; rep<width; rep+=60)
{
  for (int i=0; i<=height+10; i+=10) {
    for (int j=0; j<=40; j+=10) {
      strokeWeight(2);
      stroke(round(255-i*255/height/2),180);
      if (j==0) {
      
      }
      else if (j==40) {
  
      }
      if ((i%50)==0 && rep==0) {
        strokeWeight(random(15));
        stroke(200,random(10,100));
        noFill();
        bezier(-10,i,i,i*random(2,3),width-i,i*random(2,3)-height,width+10,i);
        
    }
    }
  }
  
}
