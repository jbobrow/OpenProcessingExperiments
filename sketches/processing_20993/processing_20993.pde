
//Rug #2

//import PDF library

      import processing.pdf.*;
      //create a boolean to turn recording on/off
      boolean record;

void setup (){
 size (480,720); 
 background (240,240,225);  
}


void draw () {
  
      //use an if statement to start recording
      if (record) {
      // Note that #### will be replaced with the frame number. Fancy!
      beginRecord(PDF, "frame-####.pdf");
}
  
  
  rectMode (CENTER);
  
//borders 
  noFill();
  stroke (145,102,31);
  strokeWeight (20);
  rect (width/2, height/2, width, height);
  stroke (0);
  strokeWeight (10);
  rect (width/2, height/2, width-30, height-30);
  stroke (150,47,52);
  rect (width/2, height/2, width-50, height-50);

stroke (0);
for (int i = 60; i <=660; i +=20) {
//draw left inner edge
rect (170, i, 5, 2);
//draw right inner edge
rect (310, i, 5, 2);
}



//up cross
  stroke (150,47,52);
fill(255);
rect (width/2, height/4, 60,250);
rect (width/2, height/4,250,60);

  //white rectangle
  noStroke ();
  rect (width/2, height/4, 50,80);
  rect (width/2, height/4, 80,50);

//down cross
stroke (150,47,52);
strokeWeight (10);
rect (width/2, height-height/4,60,250);
rect (width/2, height-height/4,250,60);

  //white rectangle
  noStroke ();
  fill(255);
  rect (width/2, height-height/4, 50,80);
  rect (width/2, height-height/4, 80,50);

//thin crosses
stroke (0);
strokeWeight (8);
line (width/2, height/4-95, width/2, height/4+95);
line (width/2-95, height/4, width/2+95, height/4);  
line (width/2, height-height/4-95, width/2, height-height/4+95);
line (width/2-95, height-height/4, width/2+95, height-height/4);    



  
//squares
for (int i = 60; i <=680; i +=50) {
noStroke();
fill(145,102,31);
//draw left inner edge
rect (70, i, 40, 40);
//draw right inner edge
rect (410, i, 40, 40);
}
  
  
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

