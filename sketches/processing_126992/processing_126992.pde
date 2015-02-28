
/*@pjs preload="ao-4.gif;*/
/*@pjs preload="zppafeey.gif;*/
PImage photo;
PImage photo1;
int x, y;


void setup() { 

  size(450, 450); 

  colorMode(HSB, 200, 50, 50);



  photo = loadImage( "ao-4.gif" );

  photo1 = loadImage("zppafeey.gif");
} 

void mousePressed() {
  image(photo, mouseX, mouseY);
}

void mouseReleased() {
  image(photo,mouseY, mouseX );
}



void draw() { 

  background(#7afaff);

  image( photo, mouseX, mouseY, 200, 200 );

  image( photo1, mouseX, mouseY, 200, 200);

  noCursor();

  noStroke(); 

  for ( int x=0; x<=700; x=x+50 ) { 

    float y=sin(radians(x+frameCount))*0.8*100+20; 

    fill(random(255, 255), 255); 

    ellipse(x+0, 80, y, y);
  }



  fill(#7e8c8d);
  rect(0, 300, 450, 200);

  //sotogawa
  fill(#c8d968);
  rect(330, 285, 13, 70);

  fill(#c8d968);
  rect(341, 285, 13, 70);

  fill(#c8d968);
  rect(351, 285, 13, 70);

  fill(#c8d968);
  rect(361, 285, 13, 70);

  fill(#c8d968);
  rect(371, 285, 13, 70);

  fill(#c8d968);
  rect(381, 285, 13, 70);

  fill(#c8d968);
  rect(391, 285, 13, 70);

  fill(#c8d968);
  rect(401, 285, 13, 70);

  //--------------------------------
  //soko
  fill(#ceae3e);
  rect(320, 345, 10, 10);

  fill(#ceae3e);
  rect(330, 345, 10, 10);

  fill(#ceae3e);
  rect(340, 345, 10, 10);

  fill(#ceae3e);
  rect(350, 345, 10, 10);

  fill(#ceae3e);
  rect(360, 345, 10, 10);

  fill(#ceae3e);
  rect(370, 345, 10, 10);

  fill(#ceae3e);
  rect(380, 345, 10, 10);

  fill(#ceae3e);
  rect(390, 345, 10, 10);

  fill(#ceae3e);
  rect(400, 345, 10, 10);

  fill(#ceae3e);
  rect(410, 345, 10, 10);

  //-------------------------------
  //himo
  fill(55, 57, 8);
  rect(325, 315, 95, 5);

  //---------------------------------
  //take
  fill(#00e26f);
  rect(360, 130, 25, 130);

  fill(#00e26f);
  rect(335, 190, 25, 80);

  fill(#00e26f);
  rect(385, 190, 25, 80);


  //---------------------------------
  //kusa
  fill(#008742);
  ellipse(320, 285, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(330, 275, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(340, 265, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(350, 260, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(370, 250, 50, 20);
  noStroke();
  //--
  fill(#008742);
  ellipse(390, 260, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(400, 265, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(410, 275, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(417, 285, 50, 20);

  fill(#008742);
  ellipse(380, 280, 50, 20);

  fill(#008742);
  ellipse(380, 275, 50, 20);

  fill(#008742);
  ellipse(367, 282, 50, 20);

  //-----------------------
  //take_sen
  fill(#93820d);
  ellipse(347, 230, 30, 1);

  fill(#93820d);
  ellipse(400, 210, 30, 1);

  fill(#93820d);
  ellipse(372, 150, 30, 1);

  fill(#93820d);
  ellipse(372, 200, 30, 1);

  //-----------------------
  //sankaku
  fill(#00e26f);
  triangle(374, 115, 360, 131, 385, 131);

  fill(#00e26f);
  triangle(397, 175, 386, 191, 410, 191);

  fill(#00e26f);
  triangle(347, 175, 335, 191, 360, 191);

  //------------------------------------
  //naka_sankaku
  fill(#c6ff74);
  triangle(374, 120, 364, 131, 382, 131);

  fill(#c6ff74);
  triangle(397, 180, 389, 191, 407, 191);

  fill(#c6ff74);
  triangle(347, 180, 338, 191, 357, 191);
  //--------------------------------------

  //kami_hidari
  fill(#ffffff);
  rect(356, 300, 10, 10);

  fill(#ffffff);
  rect(345, 309, 15, 15);

  fill(#ffffff);
  rect(335, 318, 20, 20);
  //----------------------------------
  //kami_migi

  fill(#ffffff);
  rect(374, 300, 10, 10);

  fill(#ffffff);
  rect(380, 309, 15, 15);

  fill(#ffffff);
  rect(387, 318, 20, 20);


  //-----------------------------------

  //akamaru
  fill(#e60012);
  ellipse(373, 290, 30, 30);

  //-----------------------------------
  //-----------------------------------

  //sotogawa
  fill(#c8d968);
  rect(30, 285, 13, 70);

  fill(#c8d968);
  rect(41, 285, 13, 70);

  fill(#c8d968);
  rect(51, 285, 13, 70);

  fill(#c8d968);
  rect(61, 285, 13, 70);

  fill(#c8d968);
  rect(71, 285, 13, 70);

  fill(#c8d968);
  rect(81, 285, 13, 70);

  fill(#c8d968);
  rect(91, 285, 13, 70);

  fill(#c8d968);
  rect(101, 285, 13, 70);

  //--------------------------------
  //soko
  fill(#ceae3e);
  rect(20, 345, 10, 10);

  fill(#ceae3e);
  rect(30, 345, 10, 10);

  fill(#ceae3e);
  rect(40, 345, 10, 10);

  fill(#ceae3e);
  rect(50, 345, 10, 10);

  fill(#ceae3e);
  rect(60, 345, 10, 10);

  fill(#ceae3e);
  rect(70, 345, 10, 10);

  fill(#ceae3e);
  rect(80, 345, 10, 10);

  fill(#ceae3e);
  rect(90, 345, 10, 10);

  fill(#ceae3e);
  rect(100, 345, 10, 10);

  fill(#ceae3e);
  rect(110, 345, 10, 10);

  //-------------------------------
  //himo
  fill(55, 57, 8);
  rect(25, 315, 95, 5);

  //---------------------------------
  //take
  fill(#00e26f);
  rect(60, 130, 25, 130);

  fill(#00e26f);
  rect(35, 190, 25, 80);

  fill(#00e26f);
  rect(85, 190, 25, 80);


  //---------------------------------
  //kusa
  fill(#008742);
  ellipse(20, 285, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(30, 275, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(40, 265, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(50, 260, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(70, 250, 50, 20);
  noStroke();
  //--
  fill(#008742);
  ellipse(90, 260, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(100, 265, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(110, 275, 50, 20);
  noStroke();

  fill(#008742);
  ellipse(117, 285, 50, 20);

  fill(#008742);
  ellipse(80, 280, 50, 20);

  fill(#008742);
  ellipse(80, 275, 50, 20);

  fill(#008742);
  ellipse(67, 282, 50, 20);

  //-----------------------
  //take_sen
  fill(#93820d);
  ellipse(47, 230, 30, 1);

  fill(#93820d);
  ellipse(100, 210, 30, 1);

  fill(#93820d);
  ellipse(72, 150, 30, 1);

  fill(#93820d);
  ellipse(72, 200, 30, 1);

  //-----------------------
  //sankaku
  fill(#00e26f);
  triangle(74, 115, 60, 131, 85, 131);

  fill(#00e26f);
  triangle(97, 175, 86, 191, 110, 191);

  fill(#00e26f);
  triangle(47, 175, 35, 191, 60, 191);

  //------------------------------------
  //naka_sankaku
  fill(#c6ff74);
  triangle(74, 120, 64, 131, 82, 131);

  fill(#c6ff74);
  triangle(97, 180, 89, 191, 107, 191);

  fill(#c6ff74);
  triangle(47, 180, 38, 191, 57, 191);
  //--------------------------------------

  //kami_hidari
  fill(#ffffff);
  rect(56, 300, 10, 10);

  fill(#ffffff);
  rect(45, 309, 15, 15);

  fill(#ffffff);
  rect(35, 318, 20, 20);
  //----------------------------------
  //kami_migi

  fill(#ffffff);
  rect(74, 300, 10, 10);

  fill(#ffffff);
  rect(80, 309, 15, 15);

  fill(#ffffff);
  rect(87, 318, 20, 20);


  //-----------------------------------

  //akamaru
  fill(#e60012);
  ellipse(70, 290, 30, 30);
}




