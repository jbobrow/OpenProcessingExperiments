
PImage img1, img2, img3;
PFont font; 
String m = "HAPPY BIRTHDAY";

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  img1 = loadImage("images copy.jpeg");
  img2 = loadImage("BERNITFACE.png");
  img3 = loadImage("DUCK.png");

  font = loadFont("8BITWONDERNominal-48.vlw");
  noCursor();
  textFont(font);
  background(0, 255, 0);
  textAlign(CENTER);
  textSize(20);
  frameRate(10);
}

void draw() {
  

  int ix = int(random(img1.width));
  int iy = int(random(img2.height));
 // color c = color(int(random(255)), int(random(255)), int(random(255)));

 color c = img1.get(ix, iy); 
  // this is to get x and y color values 
  //from x, y coordinates and store it in c value
  fill(c);
  int xgrid = int(random(0, 500))  ;
  int ygrid = int(random(0, 500))  ;
  text(m, width/2, height/2);
  rect(xgrid, ygrid, 5, 5);
  image(img2, mouseX - 50, mouseY + 120, 100 , 100);
  text("RAD MAD DAY'", mouseX, mouseY);
  image(img3, int(random(0, width)), int(random(0, height)), 60, 60);
}


void mousePressed() {
  background(255);
  pushMatrix();
  textSize(35);
  fill(0);
  text("BERNITA!", width/2, height/2 + 60);
  popMatrix();
}



