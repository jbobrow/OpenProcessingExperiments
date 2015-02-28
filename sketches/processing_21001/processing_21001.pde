
//import PDF library

import processing.pdf.*;

//create a boolean to turn recording on/off
boolean record;



int offset = 70;
int toffset = 40;
void setup () {

  size (480, 720);
  background (255);
  smooth();
}

void draw () {

  //use an if statement to start recording
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(PDF, "frame-####.pdf");
  }

  noStroke();
  rectMode (CENTER);


  fill (100, 120, 200);
  rect(width/2, height/2, width, height);

  fill (240, 30, 50);






  noStroke();
  //1st band
  rect (width/2, height/8, width, 80);

  //2nd band
  rect (width/2, height/4, width, 80);

  //3rd band
  rect (width/2, height-height/4, width, 80);

  //4th band
  rect (width/2, height-height/8, width, 80);


  //large triangles top and bottom
  fill (100, 200, 250, 150);
  triangle (0, height/13, width/2, height/9+250, width, height/13);
  triangle (0, height-height/13, width/2, height-height/9-250, width, height-height/13);



//fine lines
  strokeWeight(.5);
  for (int i = 0; i <=height; i +=5) {
   stroke(map(i, 0, height, 0, 255), 150, 255- map(i, 0, height, 0, 255));
    line (0, i, width, i);
  }

  strokeWeight (8);
  for (int i = offset*2; i <= height-offset*2; i +=10) {
    stroke (map(i, offset*2, height-offset*2, 0, 255), 150, 255-map(i, offset*2, height-offset*2, 0, 255));
    line (offset*2, i, width-offset*2, i);
  }

  noStroke();




  //middle triangle

    fill (240, 30, 50);
  triangle (width/2-50, height/2+40, width/2, height/2-50, width/2+50, height/2+40);



  //triangles on edges


  for (int i=0; i <=height+toffset; i +=toffset) {


    fill (200, 200, 10);
    triangle (-toffset+10, i, 10, i+toffset, toffset+10, i);
    triangle (width-toffset-10, i, width-10, i+toffset, width+toffset-10, i);

    fill (200, 100, 235);
    triangle (-toffset, i, 0, i+toffset, toffset, i);
    triangle (width-toffset, i, width, i+toffset, width+toffset, i);
  }



  noFill();

  stroke (225);
  strokeWeight (20);

  //outer rectangle
  rect (width/2, height/2, width, height);



  //draw rectangles
  strokeWeight (10); //thick line
  for (int i = 1; i < 5; i++) {

    rect (width/2, height/2, width -i*offset, height-i*offset);
  }



  strokeWeight (2);
  for (int i = offset*2+10; i <=height-offset*2-10; i +=20) {

    //draw left inner edge
    rect (offset*2+10, i, 5, 2);

    //draw right inner edge
    rect (width-offset*2-10, i, 5, 2);
  }


  //strokeWeight (6);
  for (float i = offset*1.5+10; i <=height-offset*1.5-10; i +=20) {
    //draw left inner edge
    rect (offset*1.5+10, i, 5, 2);
    //draw right inner edge
    rect (width-offset*1.5-10, i, 5, 2);
  }



  //strokeWeight (10);
  for (int i = offset+10; i <=height-offset-10; i +=20) {
    //draw left inner edge
    rect (offset+10, i, 5, 2);
    //draw right inner edge
    rect (width-offset-10, i, 5, 2);
  }




  //centered triangles
  noStroke ();
  for (int i=offset/3; i < height/2-250; i+=7) {
    fill (25,255-map(i, offset/3, height/2-250, 0, 255),map(i, offset/3, height/2-250, 0, 255));
    triangle (width/2-15, i, width/2, i+8, width/2+15, i);
    triangle (width/3-15, i, width/3, i+8, width/3+15, i);
    triangle (width-width/3-15, i, width-width/3, i+8, width-width/3+15, i);

    triangle (width/2-15, height-i, width/2, height-i-8, width/2+15, height-i);
    triangle (width/3-15, height-i, width/3, height-i-8, width/3+15, height-i);
    triangle (width-width/3-15, height-i, width-width/3, height-i-8, width-width/3+15, height-i);
  }


  ellipse (width/2, height/2, 30, 30);

  fill (225, 150, 50);
  ellipse (width/2, height/3.5, 30, 30);
  fill (50, 150, 225);
  ellipse (width/2, height-height/3.5, 30, 30);

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
      
