
void setup () {
  size (300,500);
  background (0);
  smooth ();
}

void draw () {
  background (255,200,0,175);
  noStroke ();
  fill (202,177,132);
  rect (25,25,250,450);
  fill (240,233,181);
  rect (50,50,200,400);

  //lines rec
  for (int i = 0; i<=450; i+=50) {
    fill (20,100);
    rect (25,i,250,5+map(i,0,375,0,25));
  }

  //lines hor
  for (int j = 0; j<width; j+=20) {
    fill (0,100);
    rect (j,25,5+map(0,j,0,0,25), 450);
  }

  //covers
  fill (206,176,0);
  rect (0,0,width,25); //top
  rect (0,0,25,height); //left
  rect (275,0,25,height);//right
  rect (0,475,width,25); //bottom

  //bottom white rect
  for (int x = 10; x<width; x +=20) {

    noStroke();
    smooth ();
    fill(255);
    rect (x,490,5,5);
  }


  //top white rect
  for (int x = 10; x<width; x +=20) {

    noStroke();
    smooth ();
    fill(255);
    rect (x,10,5,5);
  }
  //left white rect
  for (int y = 10; y<height; y +=20) {

    noStroke();
    smooth ();
    fill(255);
    rect (10,y,5,5);
  }

  //right white rect
  for (int y = 10; y<height; y +=20) {

    noStroke();
    smooth ();
    fill(255);
    rect (290,y,5,5);
  }





  //use an if statement to stop recording and turn recording off
  if (record) {
    endRecord();
    record = false;
  }





  stroke (200);
  strokeWeight (5);




  //horizontal lines 1
  line ( 85,75,100,75);
  line ( 200,75,215,75);

  //Vertical Lines 1
  line (85,75,85,100);
  line (215,75,215,100);

  //vertical lines 2
  line (70,100,70,125);
  line (230,100,230,125);

  //horizontal lines 2
  line ( 70,100,85,100);
  line ( 100,90,115,90);
  line ( 130,90,145,90);
  line ( 155,90,170,90);
  line ( 185,90,200,90);
  line ( 215,100,230,100);

  //horizontal lines 2

  line ( 85,110,100,110);
  line ( 200,110,215,110);

  //vertical lines 3
  line (100,90,100,110);
  line (200,90,200,110);
  line (85,110,85,125);
  line (215,110,215,125);

  // bottom part

  //horizontal lines 
  line ( 70,395,85,395);
  line ( 100,400,115,400);
  line ( 130,400,145,400);
  line ( 155,400,170,400);
  line ( 185,400,200,400);
  line ( 215,395,230,395);


  //vertical lines 3
  line (100,400,100,385);
  line (200,400,200,385);
  line (85,385,85,370);
  line (215,385,215,370);

  //horizontal lines 2

  line ( 85,385,100,385);
  line ( 200,385,215,385);


  //horizontal lines 1
  line ( 85,420,100,420);
  line ( 200,420,215,420);

  //Vertical Lines 1
  line (85,395,85,420);
  line (215,395,215,420);

  //vertical lines 2
  line (70,100,70,125);
  line (230,100,230,125);

  //horizontal lines 2
  line ( 70,100,85,100);
  line ( 100,90,115,90);
  line ( 130,90,145,90);
  line ( 155,90,170,90);
  line ( 185,90,200,90);
  line ( 215,100,230,100);

  //horizontal lines 2

  line ( 85,110,100,110);
  line ( 200,110,215,110);  

  // triangle triangles
  noStroke ();
  fill (255,200,0,175);
  triangle (width/2-50,height/2+50,width/2,height/2-50,width/2+50,height/2+50);

  fill (0,150);
  triangle (width/2-25,height/2, width/2,height/2+50,width/2+25,height/2);
}


                
                
