
int x = 0;
int y = 1;
float i = 0;
int w = 50;
float b = 0;
PFont font;
float d = 0;
float p = -100;
float o = 50;
float L = -200;

float m = 200;

float tf = -300;
float tm = -400;
float tc = -500;
float tcc = -550;
float tp = -600;
float te = -650;
float to = -700;
float tccc = -725;
float tcccc = -750;
float ts = -775;
float tps = -800;
float th = -825;
float tt = -850;
float tee = -875;
float overload1 = -900;
float overload2 = -915;
float overload3 = -930;
float overload4 = -945;
float overload5 = -960;
float bin = -1000;
float gam = -1050;
float yy = -1100;

float tfo = 300;
float tmo = 400;
float tco = 500;
float tcco = 550;
float tpo = 600;
float teo = 650;
float too = 700;
float tccco = 725;
float tcccco = 750;
float tso = 775;
float tpso = 800;
float tho = 825;
float tto = 845;
float teeo = 865;
float overload1o = 875;
float overload2o = 890;
float overload3o = 905;
float overload4o = 920;
float overload5o = 935;
float bino = 950;
float gamo = 1000;
float yyo = 1050;

void setup() {
  size(1080, 720);
  background(0);
  font = loadFont ("Serif-48.vlw");
}

void draw() {

  x = x + 5;
  if ( x >= 1080) {
    x = -x;
  }


  y = y - 1;
  i = i + .1;

  b = b + 1;
  if (b > 25) {
    b = 0;
  }

  w = w + 10;
  if ( w > 300) {
    w = - w;
  }

  d = d + 5;
  if ( d >= 50) {
    d = 0;
  }

  p = p + 1;
  if ( p >= 100) {
    p = p;
  }

  L = L + 1;
  if ( L >= 100) {
    L = L;
  }

  tf = tf + 1;
  tm = tm + 1;
  tc = tc + 1;
  tcc = tcc + 1;
  tp = tp + 1;
  te = te + 1;
  to = to + 1;
  tccc = tccc + 1;
  tcccc = tcccc + 1;
  ts = ts + 1;
  tps = tps + 1;
  th = th + 1;
  tt = tt + 1;
  tee = tee + 1;
  overload1 = overload1 + 1;
  overload2 = overload2 + 1;
  overload3 = overload3 + 1;
  overload4 = overload4 + 1;
  overload5 = overload5 + 1;
  bin = bin + 1;
  gam = gam + 1;
  yy = yy + 1;

  m = m - 1;
  o = o - 2;

  // more words //

  tfo = tfo - 1;
  tmo = tmo - 1;
  tco = tco - 1;
  tcco = tcco - 1;
  tpo = tpo - 1;
  teo = teo - 1;
  too = too - 1;
  tccco = tccco -1;
  tcccco = tcccco -1;
  tso = tso - 1;
  tpso = tpso - 1;
  tho = tho - 1;
  tto = tto - 1;
  teeo = teeo - 1;
  overload1o = overload1o - 1;
  overload2o = overload2o - 1;
  overload3o = overload3o - 1;
  overload4o = overload4o - 1;
  overload5o = overload5o - 1;
  bino = bino - 1;
  gamo = gamo - 1;
  yyo = yy - 1;
  //  




  stroke(0, random(255), 0, random(10, 30));
  line(0 + x, 0, 0 + x, 1080);


  stroke(0, random(255), 0, random(10, 30));
  ellipse(540, 360, x, x);

  fill(0, random(25, 125), 0, random(10, 30));
  textFont(font, w);
  text("Scanning", 540, 360);

  fill(0, random(15, 95), 0, d);
  textFont(font, 35);
  text("Loading Data:", 20, 40);

  fill(0, random(15, 25), 0, p);
  textFont(font, 35);
  text("Technological", 270 - o, 40);

  fill(0, random(15, 25), 0, L);
  textFont(font, 35);
  text("Different", 270, 40 - m);

  //  more words

  fill(0, random(15, 25), 0, tf);
  textFont(font, 35);
  text("Funny", 270 - tfo, 40 - tfo);

  fill(0, random(15, 25), 0, tm);
  textFont(font, 35);
  text("Musical", 270 -tmo, 40);

  fill(0, random(15, 25), 0, tc);
  textFont(font, 35);
  text("Computers", 270, 40 - tco);

  fill(0, random(15, 25), 0, tcc);
  textFont(font, 35);
  text("Caring", 270, 40 - tcco);

  fill(0, random(15, 25), 0, tp);
  textFont(font, 35);
  text("Passonite", 270 - tpo, 40);

  fill(0, random(15, 25), 0, te);
  textFont(font, 35);
  text("ExTreme", 270 - teo, 40 - teo);

  fill(0, random(15, 25), 0, to);
  textFont(font, 35);
  text("Opposite", 270, 40 - too);

  fill(0, random(15, 25), 0, tccc);
  textFont(font, 35);
  text("Couragous", 270 - tccco, 40);

  fill(0, random(15, 25), 0, tcccc);
  textFont(font, 35);
  text("Chill", 270 - tcccco, 40 - tcccco);

  fill(0, random(15, 25), 0, ts);
  textFont(font, 35);
  text("Smart", 270, 40 - tso);

  fill(0, random(15, 25), 0, tps);
  textFont(font, 35);
  text("Problem Solver", 270, 40 - tpso);

  fill(0, random(15, 25), 0, th);
  textFont(font, 35);
  text("Helpful", 270 - tho, 40);

  fill(0, random(15, 25), 0, tt);
  textFont(font, 35);
  text("Thinker", 270 - tto, 40 - tto);

  fill(0, random(15, 25), 0, tee);
  textFont(font, 35);
  text("Electronic", 270 - teeo, 40 - teeo);

  // overload

  fill(0, random(15, 25), 0, overload1);
  textFont(font, 35);
  text("OVERLOAD", 270 - overload1o, 40);

  fill(0, random(15, 25), 0, overload2);
  textFont(font, 35);
  text("OVERLOAD", 270, 40 - overload2o);

  fill(0, random(15, 25), 0, overload3);
  textFont(font, 35);
  text("OVERLOAD", 270 - overload3o, 40 -overload3o);

  fill(0, random(15, 25), 0, overload4);
  textFont(font, 35);
  text("OVERLOAD", 270, 40 - overload4o);

  fill(0, random(15, 25), 0, overload5);
  textFont(font, 35);
  text("OVERLOAD", 270 - overload5o, 40);

  // overload

  // overload

  fill(0, random(15, 25), 0, overload1);
  textFont(font, 35);
  text("OVERLOAD", 270 - overload1o, 40);

  fill(0, random(15, 25), 0, overload2);
  textFont(font, 35);
  text("OVERLOAD", 270, 40 - overload2o);

  fill(0, random(15, 25), 0, overload3);
  textFont(font, 35);
  text("OVERLOAD", 270 - overload3o, 40 -overload3o);

  fill(0, random(15, 25), 0, overload4);
  textFont(font, 35);
  text("OVERLOAD", 270, 40 - overload4o);

  fill(0, random(15, 25), 0, overload5);
  textFont(font, 35);
  text("OVERLOAD", 270 - overload5o, 40);

  // overload

  // overload

  fill(0, random(15, 25), 0, overload1);
  textFont(font, 35);
  text("OVERLOAD", 370 - overload1o, 30);

  fill(0, random(15, 25), 0, overload2);
  textFont(font, 35);
  text("OVERLOAD", 470, 60 - overload2o);

  fill(0, random(15, 25), 0, overload3);
  textFont(font, 35);
  text("OVERLOAD", 570 - overload3o, 80 -overload3o);

  fill(0, random(15, 25), 0, overload4);
  textFont(font, 35);
  text("OVERLOAD", 670, 60 - overload4o);

  fill(0, random(15, 25), 0, overload5);
  textFont(font, 35);
  text("OVERLOAD", 770 - overload5o, 90);

  // overload

  // overload

  fill(0, random(15, 25), 0, overload1);
  textFont(font, 35);
  text("OVERLOAD", 10 - overload1o, 140);

  fill(0, random(15, 25), 0, overload2);
  textFont(font, 35);
  text("OVERLOAD", 150, 80 - overload2o);

  fill(0, random(15, 25), 0, overload3);
  textFont(font, 35);
  text("OVERLOAD", 400 - overload3o, 50 -overload3o);

  fill(0, random(15, 25), 0, overload4);
  textFont(font, 35);
  text("OVERLOAD", 450, 70 - overload4o);

  fill(0, random(15, 25), 0, overload5);
  textFont(font, 35);
  text("OVERLOAD", 525 - overload5o, 90);

  // overload

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("011111000100011011100100101010100001001001011000010100001100100010110110100000010110110100110001011001000110110101111011001100110111110111", -1200 - bino, 40);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("010011100001011100110011011001010100111101011001010111010111000111001000000110001001000000011100110111000110001001011101111110010010110100", 0 + bino, 140);
  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("010100100001000101101111100101011100001001110111000000010000000001110101101100111101110001101111000101110100001111100011110111010101000001", -1200 - bino, 240);
  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("100100100001010010101101011111111101101000101101110001001100111101000100000001010100001111000001110100110100011001111111001100001010101100", 0 + bino, 340);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("111010101010101001110010000011000010101110000011110000011001010101000110110100011110110000011000011101110000111010111011101000101001110101", -1200 - bino, 440);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("111010110100111011111011110010100000001001110010101010010111010100011000110010000000011100110110011111110000100010101000010100010011110110", 0 + bino, 540);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("000010100001111011000100000011010101100100111100100101100110011000111110001000111101010000101010000110101010011100101111101001001111010111", -1200 - bino, 640);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("001000001000010011010010000001100011101110110000001001100011110110011000101101111000001110011101111111001011010011011100110010100111101001", 0 + bino, 90);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("000111000110000111101010100010100101011010101010101010101000101110011100010010100000110000011000100101110101010110110011101010111011100111", -1200 - bino, 190);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("100110000001010011011011010001010110011110000011111011101001000100001101101100100101011110101111001011111000110110000110100000010010010110", 0 + bino, 290);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("100110000001010011011011010001010110011110000011111011101001000100001101101100100101011110101111001011111000110110000110100000010010010110", -1200 - bino, 390);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("111010110100111011111011110010100000001001110010101010010111010100011000110010000000011100110110011111110000100010101000010100010011110110", 0 + bino, 490);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("100100001010010111011111000110001011101100001001101001110010010010000010011111101101101111001001101001011100101001000110000011000011110110", -1200 - bino, 590);

  // bin

  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("110101000110100010010010011010000111001110111010110011110111111001100010001000111010001000001110100000000100101011011110001101110101011001", 0 + bino, 690);


  fill(0, random(15, 25), 0, bin);
  textFont(font, 35);
  text("001010010101001111110100110010100011100100101000100000001011100111101010010111110001010101111001000100011110001010011010100011100011010111", -1200 - bino, 720);

  fill(0, random(15, 25), 0, gam);
  textFont(font, 35 - gamo);
  text("GAME OVER", 140, 320);
  
  fill(0, 155 , 0, yyo);
  ellipse(540,360, yy,yy); 

  fill(0, 0, 0, 1 + b);
  rect(0, 0, 1080, 720);
}


