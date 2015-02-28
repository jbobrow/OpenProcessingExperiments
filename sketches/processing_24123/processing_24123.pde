
//import processing.pdf.*;

//////This code was taken and edit from open processing. It was originally written by Ben Jack.
/// Written by Ben Jack, 14th February 2011 
int patternSeperationX = 100;
int patternSeperationY = 100; 
int circNum=4;
int current=0;
int radius=20;
color start=color(113,17,211);
color end= color(174,164,183);


void setup() {
  size(400,800);
  //beginRecord(PDF,"Final.pdf");
  smooth();

  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      design();
      popMatrix();
    }
  }
}
void draw() {
  //This is here so the program keeps running and the screengrab will work
}

/*void circleDesign() {  
  while (current<circNum+1) {
    noFill();
    stroke(0);
    ellipse(50,50,current*radius,current*radius);
    current=current+1;
  }
}*/
  void design() {

    //------YOUR PATTERN GOES IN HERE----- (written by Ben Jack)
   // circleDesign();



    /* while (current<circNum+1){
     noFill();
     ellipse(50,50,current*radius,current*radius);
     current=current+1;
     }
     */
     
     noStroke();
     fill(0);
     rect(0,0,100,100);
     strokeWeight(1);
     stroke(lerpColor (start,end,.25));
     noFill();
     ellipse(50,50,20,20);
     stroke(lerpColor (start,end,.5));
     strokeWeight(2);
     ellipse(50,50,40,40);
     stroke(lerpColor (start,end,.75));
     strokeWeight(3);
     ellipse(50,50,60,60);
     stroke(lerpColor (start,end,.90));
     strokeWeight(4);
     ellipse(50,50,80,80);
     fill(0);
     noStroke();
     triangle(50,50,100,70,50,100);
     stroke(1);
     
  }

  void keyPressed() {
    //Takes PNG screenshots when you push S
    //Careful - doesn't prompt when overwriting files!
    if(key == 's' || key == 'S') {
    //  String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    //  if(filePath != null) {
      //  save(filePath + ".png");
     // }
    // endRecord();
    }
  }


