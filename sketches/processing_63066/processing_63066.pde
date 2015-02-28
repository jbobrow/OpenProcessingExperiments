
//import processing.pdf.*;
//
//size(400,400);
//beginRecord(PDF, "comp6.pdf"); //Keep it up here

size (400, 400);
smooth();
background(#F00999);
noStroke();

for (int y=32; y<=height; y+=8) {
  for (int x= 12; x<=width; x+=15) {



    fill(#05FFFD);
    ellipse(y, x, x/10.0, 30-y/5.0);



    fill(#F7B1DB);
    ellipse(x+y, y, y/10.0, 16-y/10.0);
  }
}
//endRecord();

