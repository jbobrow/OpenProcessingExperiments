
int xpos, ypos;
int xpos1, ypos1;
int xhradi, yhradi;
int xstefna, ystefna;
int xstefna1, ystefna1;

void setup() {
  size (600, 600) ;

frameRate(50);
  xpos = 111;
  ypos = 111;
  xpos1 = 300;
  ypos1 = 300;
  xhradi = 3;
  yhradi = 3;
  xstefna = 1;
  ystefna = 1;
  xstefna1 = 3;
  xstefna1 = 3;
}

void draw() {
  background(255, 0, 23);
  andlit(xpos, ypos);
  xpos = xpos + xhradi * xstefna;
  ypos = ypos + yhradi * ystefna;

  if (xpos>width-22 || xpos < 22 ) xstefna = xstefna * -1;
  if (ypos>height-33 || ypos < 33 ) ystefna = ystefna * -1;


  andlit2(xpos1, ypos1);
    xpos1 = xpos1 + xhradi * xstefna1;
    ypos1 = ypos1 + yhradi * ystefna1;
    
    if (xpos1>width-22 || xpos1 < 22 ) xstefna1 = xstefna1 * -1;
  if (ypos1>height-33 || ypos1 < 33 ) ystefna1 = ystefna1 * -1;
 
}

void andlit(int x, int y) 

{
  
  
  //band1
noStroke();
fill(26,14,2);
ellipse ( x, y, 200, 190) ;

//band2
noStroke();
fill(255,0,23);
ellipse ( x, y-5, 170, 190) ;

//face
fill(255,242,118);
ellipse ( x, y, 150, 180) ;

//hjalmur
fill(70,126,54);
arc(x, y, 200, 200, PI, PI*2);
noStroke();

//munnur
fill(0, 0, 0);
arc(x, y+50, 50, 50, PI, PI*2);

//merki
fill(255,242,0);
ellipse (x, y-40, 40, 40);
fill(255,242,118);
ellipse (x, y-40, 20, 20);

//nef
fill(0,0,0);
ellipse(x+5,y+15,2,2);
ellipse(x-5,y+15,2,2);
}


void andlit2(int x, int y) {


//kona 

  //har
  fill(243, 243, 21);
  rect(x-75, y, 150, 100);

  //haus
  stroke(1);
  fill(250, 225, 187);
  ellipse(x, y, 150, 180);


  //sol
  noStroke();
  fill(243, 243, 21);
  arc(x, y, 150, 180, PI, PI*2 );

  //munnur
  fill(255, 0, 0);
  arc(x, y+50, 50, 50, 0 );

  //tennur
  fill(255, 255, 255);
  rect(x+5, y+50, 8, 8);
  rect(x-10, y+50, 8, 8);

  //nef
  fill(0, 0, 0);
  ellipse(x-4, y+40, 2, 2);
  ellipse(x+6, y+40, 2, 2);

  //augu
  fill(random (255), random(255), random(255));
  ellipse(x-25, y+20, 20, 20);
  ellipse(x+25, y+20, 20, 20);
  fill(0, 0, 0);
  ellipse(x-25, y+20, 5, 5);
  ellipse(x+25, y+20, 5, 5);
  stroke (10);
  strokeWeight(3);
  line(x-35, y+5, x-20, y+5);
  line(x+35, y+5, x+20, y+5);
  strokeWeight(1);
}

