
import processing.pdf.*;
import java.util.Calendar;  
// will save an image for you

boolean savePDF = false;

int i;
void setup()
{
int (450);
size(450,450);
frameRate(100);
}

  
   
void draw(){
  // this line will start pdf export, if the variable savePDF was set to true 
   if (savePDF) beginRecord(PDF, timestamp()+".pdf");

   //start your code here
     //background(255);
     
  background(255);
  for(int a=0;a<450;++a)
  {
    for(int i=0;i<450;++i)
     {
   
     }
   strokeWeight(0.05);
   smooth();
   line(mouseX,mouseY,225+225*sin(a*2),450);
  
   
}
  // end of pdf recording
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
  
  


}



//don't change this

void keyPressed() {
  
  //key s or p for saving and printing
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;

}

//creates a timeStamp String
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


