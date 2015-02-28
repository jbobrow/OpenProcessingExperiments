
//import processing.pdf.*;

//////This code was taken and edit from open processing. It was originally written by Ben Jack.
/// Written by Ben Jack, 14th February 2011 
int patternSeperationX = 100;
int patternSeperationY = 100; 

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


  void design() {

    //------YOUR PATTERN GOES IN HERE----- (written by Ben Jack)
   noStroke();
   fill(0);
   rect(0,0,100,100);
   stroke(0);
    fill(150);
    strokeWeight(4);
    fill(67,203,47);
   triangle(0,0,30,0,0,30);
   triangle(100,0,70,0,100,30);
   triangle(0,70,0,100,30,100);
   triangle(70,100,100,100,100,70);
     
   line(0,0,100,100);



   
     
 
     
  }

  void keyPressed() {
    //Takes PNG screenshots when you push S
    //Careful - doesn't prompt when overwriting files!
    if(key == 's' || key == 'S') {
      //String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
     // if(filePath != null) {
     //   save(filePath + ".png");
    //  }
    //endRecord();
    }
  }


