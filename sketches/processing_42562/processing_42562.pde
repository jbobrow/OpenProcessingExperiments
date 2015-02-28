
PImage murano, klimt, bimbo, bimnocil, foto;

void setup() {
  size (400, 600);
  murano=loadImage("amurano.png");
  foto= loadImage("afoto.jpg");
  bimbo= loadImage("abimbo.png");
  klimt= loadImage("aklimt.jpg");
  bimnocil= loadImage("abimbo copia.png");
}


void draw() {

  image (bimnocil, 0, 0);
  image (murano, 0, 150);
  image (foto, 0, 450);
  image (bimbo, 0, 0);
  image (klimt, 0, 300);
  noTint();

  //change image
  if ( (mousePressed==true) && (mouseY<=150)) {
    image (bimnocil, 0, 0);
    image (murano, 0, 150);
    image (foto, 0, 450);
    image (klimt, 0, 300);
  }

  //cross color= (mouseX, mouseY)
  if ( (mousePressed==true) && (mouseY<=300)&&(mouseY>150)) {
    color c= get (mouseX, mouseY);
    strokeWeight(4);
    stroke(c);
    line(0, mouseY, width, mouseY);
    line(mouseX, 150, mouseX, 300);
  }

  //copied area
  if ( (mousePressed==true) && (mouseY<=450)&&(mouseY>300)) {
    rectMode(CENTER);
    copy(mouseX, mouseY, 5, 5, mouseX-15, mouseY-15, 30, 30);
  }

  //green tint
  if ( (mousePressed==true) && (mouseY>450)) {
    image (murano, 0, 150);
    image (bimbo, 0, 0);
    image (klimt, 0, 300);
    tint (90, 167, 90);
    image (foto, 0, 450);
  }
}


