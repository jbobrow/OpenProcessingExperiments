
//import processing.pdf.*;

//////This code was taken and edit from open processing. It was originally written by Ben Jack.
/// Written by Ben Jack, 14th February 2011 
int patternSeperationX = 100;
int patternSeperationY = 100; 
//color start1= color(123,55,219);
//color end1 = color(182,181,183);
int x = 0;
//color two1 = lerpColor(start1, end1, .33);

void setup() {
  size(400,800);
 // beginRecord(PDF,"myFunPictureYay8.pdf");
  background(0);
  
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
  // fill(lerpColor(start,end,random()));\
  strokeWeight(1);
  stroke (50);
 while (x<400) {
    line(x,0,x,800);
    x=x+2;
  }
  stroke(0);
  strokeWeight(0);
  noStroke();
  fill (29,136,222,random(100,200));
  quad(10,40,40,10,50,20,20,50);//quad1
  quad(10,60,20,50,50,80,40,90);//quad2
  quad(50,20,60,10,90,40,80,50);//quad3
  quad(50,80,80,50,90,60,60,90);//quad4
  stroke(0);
}

void keyPressed() {
  //Takes PNG screenshots when you push S
  //Careful - doesn't prompt when overwriting files!
  if(key == 's' || key == 'S') {
   // String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
   // if(filePath != null) {
     // save(filePath + ".png");
     // endRecord();
   // }
  }
}


