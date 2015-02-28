
//Rug 1


//import PDF library

import processing.pdf.*;

//create a boolean to turn recording on/off
boolean record;

void setup (){
  size (480,720);
  background (250,250,225);
  
}

void draw (){

//use an if statement to start recording
if (record) {
// Note that #### will be replaced with the frame number. Fancy!
beginRecord(PDF, "frame-####.pdf");
}  

  noStroke ();
 rectMode (CENTER);
 fill(163,146,128);
 
//1st band
rect (width/2, height/8, width, 50);

//2nd band
rect (width/2, height/4, width, 50);

//3nd band
rect (width/2, height/2-50, width, 50);

//4nd band
rect (width/2, height/2+50, width, 50);

//5rd band
rect (width/2, height-height/4, width, 50);

//6th band
rect (width/2, height-height/8, width, 50);

fill (0);
//first large triangle    
  triangle (width/2-100, height/2+200, width/2, height/2, width/2+100, height/2+200); 
//second large triangle
  triangle (width/2+100, height/2-200, width/2, height/2, width/2-100, height/2-200); 
//first short triangle  
  triangle (width/2-50, height/2+30, width/2, height/2, width/2-50, height/2-30); 
//second short triangle
  triangle (width/2+50, height/2-30, width/2, height/2, width/2+50, height/2+30); 

//inside left and right
   for (int i = 153; i <=570; i +=8) {
 fill(0);
  rect (122, i, 6, 6);
  rect (359, i, 6, 6);
}
//outside left and right
   for (int i = 15; i <=710; i +=15) {
 fill(0);
  rect (15, i, 10, 10);
  rect (466, i, 10, 10);
}
//outside top and bottom
   for (int i = 15; i <=710; i +=15) {
 fill(0);
  rect (i, 15, 10, 10);
  rect (i, 705, 10, 10);
}

//inside top and bottom
   for (int i = 132; i <=350; i +=8) {
 fill(0);
  rect (i, 142, 6, 6);
  rect (i, 579, 6, 6);
} 

//lines on the top
   for (int i = 65; i <=115; i +=5) {
stroke (0);
strokeWeight (1);
line (0, i, 480, i);
} 

//lines on the bottom
   for (int i = 605; i <=655; i +=5) {
stroke (0);
strokeWeight (1);
line (0, i, 480, i);
} 


//left top squares
rect (width/6-20, height/4+75, 20,20);
rect (width/6, height/4+55, 20,20);

//right top squares
rect (width-width/6+20, height/4+75, 20,20);
rect (width-width/6, height/4+55, 20,20);

//left bottom squares
rect (width/6-20, height-height/4-75, 20,20);
rect (width/6, height-height/4-55, 20,20);

//right bottom squares
rect (width-width/6+20, height-height/4-75, 20,20);
rect (width-width/6, height-height/4-55, 20,20);
  
//center line
line (0, height/2, width, height/2);
line (width/2, 0, width/2, height); 
  
  
 noFill ();
stroke (180,32,36);
strokeWeight (20);
//border
  rect (width/2,height/2,width,height);
strokeWeight (10);
//triangle border
  rect (width/2,height/2,220,420); 


//use an if statement to stop recording and turn recording off
if (record) {
endRecord();
record = false;
}

}


//if you press a key, a pdf will be recorded
void keyPressed () {
record = true;
}

