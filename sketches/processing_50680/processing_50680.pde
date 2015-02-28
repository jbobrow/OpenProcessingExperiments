
PShape melt_1;
PShape melt_2;
PShape melt_3;
PImage waffer;

void setup() {
  size(500, 500);
  smooth();
  strokeWeight(2);
  stroke(196, 143, 96, 150);

  melt_1= loadShape("melt_1.svg");
  melt_2 = loadShape("melt_2.svg");
  melt_3 = loadShape("melt_3.svg");
  waffer = loadImage("waffer-01.jpg");
}

void draw() {

  //waffer-bg
  image (waffer, 0, 0, width, height);

  //eyes
  //left
  //outter
  fill(255);
  stroke(0);
  strokeWeight(5);
  float LEX = map(mouseY, 0, height/4, 150, 113.5);
  ellipse(width*.25, height*.33, 150, LEX);

  //inner
  fill(0);
  noStroke();
  float Lex = map(mouseX, 0, width, 115, 150);
  float Ley = map(mouseY, 0, height, 130, 160);
  float Lei = map(mouseY, 0, height*.87, 70, 0);
  ellipse(Lex, Ley, Lei, Lei);

  //right
  //outter
  fill(255);
  stroke(0);
  strokeWeight(5);
  float REX = map(mouseY, 0, height/4, 150, 113.5);
  ellipse(width*.78, height*.33, 150, REX);

  //inner
  fill(0);
  noStroke();
  float Rex = map(mouseX, 0, width, 350, 390);
  float Rey = map(mouseY, 0, height, 120, 175);
  float Rei = map(mouseY, 0, height+8, 20, 0);
  ellipse(Rex, Rey, Rei, Rei);


  //mouth
  fill(0);
  noStroke();

  float amx= map(mouseY, 0, width, width*.5, width*.95);
  float amy= map(mouseY, 0, height, 540, 500);

  arc(width/2, amy, amx, amx, radians(180), radians(360));


  //ice cream
  //melt_3
  float m3x = map(mouseX, 0, 400, 500, 550);
  float m3y = map(mouseY, 0, height, 0, 420); 
  shape(melt_3, -2, -10, m3x, m3y);

  //melt_2
  float m2x = map(mouseX, 500, -10, 510, 540);
  float m2y = map(mouseY, 0, height, 0, 440);
  shape(melt_2, 0, -5, m2x, m2y);

  //melt_2
  float m1x = map(mouseX, 0, 510, 500, 520);
  float m1y = map(mouseY, 0, height, 0, 420); 
  shape(melt_1, 0, -2, m1x, m1y);


  //arcs
  //  float areL = map(mouseY, height/4, height/2, 255, 50);
  //  float areLP = map(mouseY, height/4, height/2, 0, 120);
  //  noFill();
  //  stroke(0, areL);
  //  strokeWeight(5);
  //  strokeCap(ROUND);
  //  arc (145, 140, 140, 127, radians(290), radians(360));
  //
  //  stroke(255, 145, 186, areLP);
  //  arc (145, 140, 140, 127, radians(290), radians(360));

  //  float ta = map(mouseY, height/2,height, 0,150);
  //  stroke(255, ta);
  //  strokeWeight(10);
  //  line(0, 50, width, 50);
}


