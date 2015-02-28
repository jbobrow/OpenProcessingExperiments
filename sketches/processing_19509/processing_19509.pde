
void setup(){
  size(250,250);
  smooth();
  noStroke();
  background(255);
  frameRate(7);
}

void draw(){
  PFont size1;
  size1 = loadFont("Futura-CondensedExtraBold-90.vlw");
  PFont size2;
  size2 = loadFont("Futura-CondensedExtraBold-70.vlw");
  PFont size3;
  size3 = loadFont("Futura-CondensedExtraBold-40.vlw");
  PFont size4;
  size4 = loadFont("Futura-CondensedExtraBold-20.vlw");

  //the rectangle to add transparency to the background
  fill(255,18);
  rect(-1,-1,260,260);

  fill(0,45,random(100),100);
  textFont(size1);
  text("N",random(-10),random(290));
  text("1",random(-10),random(290));
  text("E",random(-10),random(290));
  text("1",random(-10),random(290));
  text("H",random(-10),random(290));
  text("6",random(-10),random(290));
  
  textFont(size2);
  text("N",random(100),random(290));
  text("1",random(70),random(290));
  text("E",random(70),random(290));
  text("1",random(70),random(290));
  text("H",random(100),random(290));
  text("6",random(70),random(290));
  
  textFont(size3);
  text("N",random(150),random(290));
  text("1",random(190),random(290));
  text("E",random(190),random(290));
  text("1",random(150),random(290));
  text("H",random(180),random(290));
  text("6",random(180),random(290));
  
  textFont(size4);
  text("N",random(255),random(290));
  text("1",random(255),random(290));
  text("E",random(255),random(290));
  text("1",random(255),random(290));
  text("H",random(255),random(290));
  text("6",random(255),random(290));
}

