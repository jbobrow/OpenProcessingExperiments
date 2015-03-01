
import processing.pdf.*;
import java.util.Calendar;  

boolean savePDF = false;

int xIntensity, yIntensity;
int xStep, yStep;
 
void setup(){
  size(600,600);
}
 
void draw(){
   // this line will start pdf export, if the variable savePDF was set to true 
   if (savePDF) beginRecord(PDF, timestamp()+".pdf");

   //start your code here
     //background(255);
  background(255);
   
  xIntensity = 100;
  yIntensity = 100;
   
  xStep = int( width / xIntensity );
  yStep = int( height / yIntensity );
   
  pushMatrix();
  translate(width/2,height/2);
  scale(0.5);
    for( int i = 0; i < 4; i++ ){
      rotate(i*PI/2);
      linegular();
    }
  popMatrix(); 
   
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
}
 
void linegular(){
  for( int j = yStep, i = width; i > 0; i -= xStep ){   
    line(0,j,i,0);
    j+=yStep; 
    if(j>height) break;

 //end your code here


  // end of pdf recording
  if (savePDF) {
    savePDF = false;
    endRecord();
  }

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






