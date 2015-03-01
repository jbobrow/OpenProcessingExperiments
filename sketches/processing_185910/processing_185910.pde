
float whalex  = 0;
float whaley = 320;

float wavex = 0;
float wavey = 0;

float boatx = - 250;
float boaty = 350;

float scopex = boatx + 250;
float scopey = 305;

float movescopex = 0.1;

float pbx = 620;
float pby = 135;
float bergx = 600;
float bergy = 135;

float sealx = 0;
float sealy = 0;

float downsealy = 0;

float rd = 0;
float rw = -1;

float time = 0;
float sr  = -1;

void setup ()
{
  size (600, 400);
  noStroke ();
  smooth ();
}

//seal
void drawseal (float sealx, float sealy)
{

  translate (sealx, sealy);
  rotate (sr);
  stroke (255);
  strokeWeight (0.5);
  fill (200);
  ellipse ( 0, 0, 20, 50);
  ellipse ( 0 + 3, - 20, 3, 3);
  
    sealy = sealy + downsealy;
  if (sealy < 378)
  {
    sealy = 378;
    downsealy = -downsealy;
  }

  if (sealy > 398)
  {
    sealy = 398;
    downsealy = -downsealy;
  }



  resetMatrix ();
}

//sparkle
void drawsparkle (float sparklex, float sparkley)
{
  translate (sparklex, sparkley);
  stroke (255);
  strokeWeight (random (2, 4));
  line (sparklex, sparkley, sparklex + 5, sparkley + 5); 
  line (sparklex, sparkley, sparklex -5, sparkley - 5);
  line (sparklex, sparkley, sparklex + 5, sparkley - 5); 
  line (sparklex, sparkley, sparklex -5, sparkley + 5);
  noStroke();
}

void drawwave (float wavex, float wavey)
{
  translate (wavex, wavey);
  rotate (1.5 * rw);
  fill(255);
  ellipse (0, 0, 50, 40);
  fill (#E3FFD3);
  ellipse (- 10, 10, 50, 30);
  resetMatrix ();
}

void drawwhale (float whalex, float whaley)
{
  translate (whalex, whaley);
  rotate (rd);
  //spout
  fill(255,90);
  triangle (-50, 0, -54, random (75, 100), - 46, random (75, 100));
  //fins
  fill (#81B3BF);
  triangle(0, 30, 0, 80, 50, 30);
  triangle(0, 30, 30, 0, 10, 20);

  //body
  fill (#81B3BF);
  ellipse (0, 35, 200, 50);
  //masking
  fill (#E3FFD3);
  ellipse (25, 5, 200, 50);

  //tail
  fill (#81B3BF);
  ellipse (+ 100, 35, 20, 50);
  //masking
  fill (#E3FFD3);
  ellipse (+105, 35, 10, 50);

  //mouth
  stroke (#ED3737);
  strokeWeight (1);
  line (-80, 30, -95, 30);
  noStroke ();

  //eye
  fill (#B8C652);
  ellipse (- 80, 40, 5, 5);
  resetMatrix ();
}

void draw ()
{
  //sky
  background (#B0B7FC);

  noStroke ();
  // sun
  fill (#FFC964);
  ellipse (300, 150, 300, 300);

  //backgroundsea
  fill (#E3FFD3);
  rect ( 0, 100, 600, height);

  //iceberg
  stroke (240);
  strokeWeight (0.9);
  fill (235);
  quad (bergx, bergy, bergx +40, bergy - 20, bergx +60, bergy + 20, bergx + 10, bergy + 40);
  quad (bergx + 10, bergy + 40, bergx + 60, bergy + 20, bergx + 60, bergy + 30, bergx + 10, bergy + 50);
  quad (bergx, bergy, bergx + 10, bergy + 40, bergx + 10, bergy + 45, bergx, bergy + 10);
  noStroke ();

  //bear
  //neck
  fill (255);
  ellipse (pbx, pby +5, 5, 15);
  //head
  fill (255);
  ellipse (pbx, pby, 15, 12);
  //ears
  fill (255);
  ellipse (pbx - 5, pby - 5, 3, 5);
  ellipse (pbx + 5, pby - 5, 3, 5);
  //eyes
  fill (0);
  ellipse (pbx - 3, pby, 2, 2);
  ellipse (pbx + 3, pby, 2, 2);
  //nose
  fill (255);
  stroke (240);
  strokeWeight (0.5);
  ellipse (pbx, pby+ 5, 6, 6);
  noStroke();
  fill (0);
  ellipse (pbx, pby + 5, 2, 2);
  //body
  fill (255);
  ellipse (pbx, pby + 25, 15, 30);
  //frontpaws
  fill (#9D7C05);
  ellipse (pbx - 7, pby + 20, 4, 4);
  ellipse (pbx + 7, pby + 20, 4, 4);
  //bum
  fill (255);
  ellipse (pbx, pby + 35, 20, 10);
  //backpaws
  fill (#9D7C05);
  ellipse (pbx - 9, pby + 37, 5, 3);
  ellipse (pbx + 9, pby + 37, 5, 3);

  bergx = bergx - 0.1;
  pbx = pbx - 0.1;

  drawwhale (80, whaley);
  drawwhale (300, whaley);
  drawwhale (550, whaley);

  //rotate whale
  rd = rd + 0.01;

  //whitewaveforms
  float wavex = 0;
  while (wavex < 650)
  {
    drawwave (wavex, 300);
    wavex = wavex +50;
  }

  //nearsea
  float z = 0;
  while (z < width) 
  {
    stroke (#E3FFD3);
    line(z, 285 + 20 * noise(z / 100, time), z, height);
    noStroke ();
    z = z + 1;
  }

  drawseal (300, 385);
  drawseal (350, 385);
  drawseal (375, 385);

  //sealy = sealy - 0.05;
  //downsealy = downsealy - 0.05;
sealx = sealx + 0.5;

  //nearsea
  noStroke ();
  fill (#E3FFD3);
  rect ( 0, 375, 600, 25);

 // telescope
  stroke (#1A26EA);
  strokeWeight (4);
 line (boatx + 250, boaty - 25, boatx + 270, boaty - 28);

  //watchers
  stroke (200);
  strokeWeight (0.5);
  fill(0);
  ellipse (boatx + 50, boaty, 20, 50);
  fill (#FFDBF2);
  ellipse (boatx + 50, boaty -25, 20, 20);
  fill (#067DA0);
  ellipse (boatx + 100, boaty, 20, 50);
  ellipse (boatx + 100, boaty - 25, 20, 20);
  fill (#7C570C);
  ellipse (boatx + 150, boaty, 20, 50);
  ellipse (boatx + 150, boaty - 25, 20, 20);
  fill (#B7123C);
  ellipse (boatx + 200, boaty, 20, 50);
  ellipse (boatx + 200, boaty - 25, 20, 20);
  fill (#0C7C2B);
  ellipse (boatx + 250, boaty, 20, 50);
  ellipse (boatx + 250, boaty -25, 20, 20);

  //watcherface
  noFill ();
  stroke (0);
  strokeWeight (1.5);
  ellipse (boatx + 50, boaty - 25, 18, 18);
  stroke (200);
  ellipse (boatx + 55, boaty - 25, 3, 3);
  ellipse (boatx + 45, boaty - 25, 3, 3);
  ellipse (boatx + 50, boaty - 20, 3, 3);

  //boat
  fill (190);
  quad (boatx, boaty, boatx + 280, boaty, boatx +230, boaty  + 60, boatx, boaty + 60);
  
boatx = boatx + 0.05;

  if (boatx > 200)
  { boatx = 200;}
  
  //boatfroth
  strokeWeight (1);
  float x = 0;
  while (x < boatx + 240) 
  {
    stroke (#E3F7FC);
    line(x, 390 + 10 * noise(x / 100, time), x, height);
    noStroke ();
    x = x + 1;
  }
  
  time = time + 0.02;
  
  //seasparkle  
  drawsparkle (random (0, width), random (100, height));
  

}

