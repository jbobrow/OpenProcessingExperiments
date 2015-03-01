
import processing.pdf.*;
import java.util.Calendar;  

boolean savePDF = false;
//this will help to save any images I have done
void setup() {
  size(400, 400);
}
 
void draw() {
  background(255);
  horLines();
  vertLines();
  otherVertLines();
  colorChange();
  
     //end your code here


  // end of pdf recording
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
  
}
 
void horLines(){
  for (float x=0;x<=400;x+=20) {
    line(mouseX, mouseY, x, 0);
  }
}
 
void vertLines(){
  for(float y=0;y<=400;y+=20){
    line(mouseX,mouseY,0,y);
  }
}
void otherVertLines(){
  for(float y=0;y<=400;y+=20){
    line(mouseX,mouseY,400,y);
  }
}

void colorChange(){
  if(mousePressed){
    stroke(255,0,255);
  }
  else stroke(0);


 //end your code here


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


