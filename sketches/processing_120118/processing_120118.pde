
PFont largefont;
PFont smallfont;
PImage head;
PImage tail;
int total, heads, tails;

float odds = random(2);

void setup() {
  background(5);
  size(500, 500);
  imageMode (CENTER);
  textAlign(CENTER);
  head = loadImage("heads.jpg");
  tail = loadImage("tails.jpg");
  largefont=createFont ("Stencil", 45);
  smallfont =createFont ("Stencil", 26);
  textFont(largefont);
  fill(255);
  text("Heads or Tails?", width/2, height/2);
}

void draw() {
}

void mousePressed() {

    
  odds=random(2);
  if (odds>1) {
    image(head, width/2, height/2);
    textFont (smallfont);
    text ("Heads!", width/2, 455);
    total+=1;
    heads+=1;
  } 
  else {
    image(tail, width/2, height/2);
    textFont (smallfont);
    text ("Tails!", width/2, 455);
    total+=1;
    tails+=1;
  }
  fill(0);
  text("Total: "+total+",  Heads: "+heads+",  Tails: "+tails, width/2, 50);
}



