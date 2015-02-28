
//David Kim
//Creative Programming 2012
//RISD D+M
//assignment #1

size(640, 360);
background(100, 100, 100); //grey
smooth();

//corner shape
strokeWeight(0);
fill(0, 0, 0, 50); //black
beginShape();
//      (640, -20)        (640, -20)        (-40, 0)        (-40, 0)
                                      vertex(640, 0); vertex(620, 0);
  vertex(640, 360); vertex(640, 350); vertex(600, 0); vertex(580, 0);
  vertex(640, 340); vertex(640, 330); vertex(560, 0); vertex(540, 0);
  vertex(640, 320); vertex(640, 310); vertex(520, 0); vertex(500, 0);
  vertex(640, 300); vertex(640, 290); vertex(480, 0); vertex(460, 0);
  vertex(640, 280); vertex(640, 270); vertex(440, 0); vertex(420, 0);
  vertex(640, 260); vertex(640, 250); vertex(400, 0); vertex(380, 0);
  vertex(640, 240); vertex(640, 230); vertex(360, 0); vertex(340, 0);
  vertex(640, 220); vertex(640, 210); vertex(320, 0); vertex(300, 0);
  vertex(640, 200); vertex(640, 190); vertex(280, 0); vertex(260, 0);
  vertex(640, 180); vertex(640, 170); vertex(240, 0); vertex(220, 0);
  vertex(640, 160); vertex(640, 150); vertex(200, 0); vertex(180, 0);
  vertex(640, 140); vertex(640, 130); vertex(160, 0); vertex(140, 0);
  vertex(640, 120); vertex(640, 110); vertex(120, 0); vertex(100, 0);
  vertex(640, 100); vertex(640,  90); vertex( 80, 0); vertex( 60, 0);
  vertex(640,  80); vertex(640,  70); vertex( 40, 0); vertex( 20, 0);
  vertex(640,  60); vertex(640,  50); vertex(  0, 0); vertex(-20, 0);
  vertex(640,  40); vertex(640,  30); vertex(-40, 0); vertex(-60, 0);
  vertex(640,  20); vertex(640,  10); vertex(-80, 0); vertex(-100, 0);
  vertex(640,   0);
endShape();

//planes
strokeWeight(1);
                           // (10, -20,  -60, 350, -15, 230, 500,  -5)
fill(   0, 240,   0, 70); quad(10, 330, 1090, 350, 595, 230, 500, 130); //2
fill(   0, 200,  40, 70); quad(10, 310, 1030, 350, 580, 230, 500, 125); //3
fill(   0, 160,  80, 70); quad(10, 290, 970,  350, 565, 230, 500, 120); //4
fill(   0, 120, 120, 60); quad(10, 270, 910,  350, 550, 230, 500, 115); //5
fill(   0,  80, 160, 60); quad(10, 250, 850,  350, 535, 230, 500, 110); //6
fill(   0,  40, 200, 60); quad(10, 230, 790,  350, 520, 230, 500, 105); //7
fill(   0,   0, 240, 50); quad(10, 210, 730,  350, 505, 230, 500, 100); //8
fill(  40,   0, 200, 50); quad(10, 190, 670,  350, 490, 230, 500,  95); //9
fill(  80,   0, 160, 50); quad(10, 170, 610,  350, 475, 230, 500,  90); //10
fill( 120,   0, 120, 40); quad(10, 150, 550,  350, 460, 230, 500,  85); //11
fill( 160,   0,  80, 40); quad(10, 130, 490,  350, 445, 230, 500,  80); //12
fill( 200,   0,  40, 40); quad(10, 110, 430,  350, 430, 230, 500,  75); //13
fill( 240,   0,   0, 30); quad(10,  90, 370,  350, 415, 230, 500,  70); //14
fill( 200,  40,   0, 30); quad(10,  70, 310,  350, 400, 230, 500,  65); //15
fill( 160,  80,   0, 30); quad(10,  50, 250,  350, 385, 230, 500,  60); //16
fill( 120, 120,   0, 20); quad(10,  30, 190,  350, 370, 230, 500,  55); //17
fill(  80, 160,   0, 20); quad(10,  10, 130,  350, 355, 230, 500,  50); //18
fill(  40, 200,   0, 20); quad(10, -10,  70,  350, 340, 230, 500,  45); //19
