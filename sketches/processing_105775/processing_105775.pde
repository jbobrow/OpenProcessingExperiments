
int xPos; //xPosition
int yPos; //yPosition
int radius=20;
int sx; //speed of x
int sy; //speed of y

int axPos;
int ayPos;

int bxPos;
int byPos;

PFont score;
int scorea;
int scoreb;

boolean game;

void setup() {
  size (800, 500);

  xPos=width/2;
  yPos=height/2;

  sx=-5;
  sy=-5;

  axPos=20;
  ayPos=200;
  bxPos=780;
  byPos=200;

  scorea=0;
  scoreb=0;
  score=loadFont("Courier.vlw");

  game = true;
}

void draw() {

  if ((scorea==10) || (scoreb==10)) {
    game = false;
    background(0, 0, 0);
    fill(255);
    stroke(255);
    rect(axPos, ayPos, 10, 50);
    rect(bxPos, byPos, 10, 50);

    text(scorea, width/4, height/8);
    text(scoreb, width*0.75, height/8);

    if (scorea==10) {

      noFill();
      rect((width/2)-40, (height/2)-10, 80, 20);
      fill(255);
      text("Play Again", (width/2)-30, (height/2)+5);
      text("Player One Wins!!!", (width/2)-55, (height/2)-15);
    }
    else {
      noFill();
      rect((width/2)-40, (height/2)-10, 80, 20);
      fill(255);
      text("Play Again", (width/2)-30, (height/2)+5);
      text("Player Two Wins!!!", (width/2)-55, (height/2)-15);
    }
  }

  else {
    background(0, 0, 0);
    fill(255);
    stroke(255);
    line(width/2, 0, width/2, height);
    rect(axPos, ayPos, 10, 50);
    rect(bxPos, byPos, 10, 50);
    ellipse(xPos+=sx, yPos+=sy, radius, radius);

    text(scorea, width/4, height/8);
    text(scoreb, width*0.75, height/8);

    //player one

    if (keyPressed) {
      if (keyCode==UP) {
        ayPos=ayPos-10;
      }
      if (keyCode==DOWN) {
        ayPos=ayPos+10;
      }
    }
    if (ayPos<0) {
      ayPos=1;
    }
    if (ayPos>height-50) {
      ayPos=height-49;
    }

    //player two

    if (mouseY<byPos) {
      byPos=byPos-10;
    }
    if (mouseY>byPos) {
      byPos=byPos+10;
    }
    if (byPos<0) {
      byPos=1;
    }
    if (byPos>height-50) {
      byPos=height-49;
    }

    // player one 
    if ((yPos>ayPos-5) && (yPos<ayPos+55) && (xPos-20<axPos+5)) {
      sx=sx*-1;
    }

    //player two
    if ((yPos>byPos-5) && (yPos<byPos+55) && (xPos+20>bxPos-5)) {
      sx=sx*-1;
    }

    //score  
    if (xPos>=width-radius/2) {
      xPos=width/2;
      yPos=height/2;
      scorea=scorea+1;
    }
    if (xPos<=0+radius/2) {
      xPos=width/2;
      yPos=height/2;
      scoreb=scoreb+1;
    }
    // y-axis bounds 
    if ((yPos>=height-radius/2) || (yPos<=0+radius/2)) {
      sy=sy*-1;
    }
  }
}


//rect((width/2)-40, (height/2)-10, 80, 20);

void mouseClicked() {
  if ((mouseX<width/2) && (mouseX>(width/2+80)) && (mouseY<height/2) && (mouseY>(height/2+20))) {
    if (game=false) {   
      scorea=0;
      scoreb=0; 
      game=true;
    }
  }
}



