
import processing.pdf.*;


  size(800,800);
  beginRecord (PDF,"oper.log.pdf");
  background(255);

 
 for(int i=0;i<width;i+=20){
 
  fill(0);
  rect(0,i,width,10);
  fill(237,41,41,100);
  rect(i,0,100,800);
  fill(random (181),random (41),random (50,237),50);
  rect(0,i,width,100);


 }

  endRecord(); 

