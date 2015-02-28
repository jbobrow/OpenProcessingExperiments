
PFont f,f2;

void setup () {
  size ( 1000, 350 );
  background (#000000);
  f = loadFont("text.vlw"); 
  f2 = loadFont("text12.vlw"); 
  textFont(f, 100); 
}

void draw() {
  noStroke();

  fill (#ffffff);
  rect (25, 25, 300, 300);

  rect (350, 25, 300, 300);

  rect (675, 25, 300, 300);

  stroke (#098D93);
  line ( 25, 25, 325, 325);
  line ( 25, 25, 200, 325);
  line ( 25, 25, 250, 325);
  line ( 25, 25, 275, 325);
  line ( 25, 25, 300, 325);
  line ( 25, 25, 225, 325);
  line ( 25, 25, 175, 325);

  stroke (#E5C107);
  line ( 325, 325, 50, 25);
  line ( 325, 325, 75, 25);
  line ( 325, 325, 100, 25);
  line ( 325, 325, 125, 25);
  line ( 325, 325, 150, 25);
  line ( 325, 325, 175, 25);
  line ( 325, 325, 200, 25);

  stroke (#AD052F);
  line ( 250, 140, 325, 25);
  line ( 260, 170, 325, 25);
  line ( 270, 190, 325, 25);
  line ( 280, 210, 325, 25);
  line ( 290, 238, 325, 25);
  line ( 300, 260, 325, 25);
  line ( 310, 290, 325, 25);
  line ( 320, 310, 325, 25);
  
  fill (#585858, 120);
  noStroke();
  ellipse (150, 200, 200, 200);
  fill (#ffffff, 120);
  textFont(f, 100); 
  text ("Q", 150, 200);
  
  fill (#000000);                          //   2
  textFont(f2, 12); 
  rotate(radians(45));
  text ("qoihdoiq", 450, -80);
  text ("jkjjjjjjjjwgwgwgwggggggggggwww", 400, -120);
  text ("jdsfdskjfdjksfkjjkhfskdsdjfh", 490, -180);
  text ("udfhiuueiwfhiuwehfiuhf", 490, -280);
  text ("jkdfhsjuiiuuqqdddbbH", 490, -320);
  text ("dfisdfhjsdoifhsdoufhdsfouhsdufhsdui", 430, -300);
  text ("aaasaaaavmvmmmvv", 480, -270);
  text ("aaasaaaavmvmmmvv", 480, -270);
  
  
    rotate(radians(-45));
  textFont(f, 300); 
  text ("!", 770, 230);
  stroke (#ffffff);
  line ( 730, 220, 870, 220);
  line ( 730, 200, 870, 200);
  line ( 730, 180, 870, 180);
  line ( 730, 160, 870, 160);
  line ( 730, 140, 870, 140);
  line ( 730, 120, 870, 120);
  line ( 730, 100, 870, 100);
  line ( 730, 80, 870, 80);
  line ( 730, 60, 870, 60);
  line ( 730, 40, 870, 40);
  
}


