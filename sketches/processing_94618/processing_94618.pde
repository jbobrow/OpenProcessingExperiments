
/* @pjs preload="rainbow_piece.png","gold.png","cloud.png";*/
/* @pjs font="Arial.ttf"; */

PImage img;
PFont font;
float x=0;
float y=0;

void setup() {
  size(600, 600);
  smooth();

  font = loadFont ("JasmineUPC-48.vlw");

  background(#42C8CB);
  fill(#56953E);
  noStroke();
  rect(0, 500, 600, 100);
  stroke(1);


  textAlign(CENTER);
  textFont(font, 35);
  String s = "Follow the rainbow to the pot of gold";
  fill(0);
  text(s, width/2+50, 10, 200, 200);

  //RAINBOW
  img=loadImage("rainbow_piece.png");
  img.loadPixels();
  img.resize(100, 100);
  image(img, 75, 80, 100, 100);

  //CLOUD
  img=loadImage("cloud.png");
  img.loadPixels();
  img.resize(200, 130);
  image(img, 0, 0, 200, 130);
}
void draw() {
  //RAINBOW
  for (int i=0; i<7; i++) {

    if (mouseX >i*30+75 && mouseX <i*30+75+100 && mouseY >i*50 +80
      && mouseY <i*50+80+100) {

      img=loadImage("rainbow_piece.png");
      img.loadPixels();
      img.resize(100, 100);
      image(img, i*30+75+30, i*50+80+50, 100, 100);
      //tint(255,126);
    }
    else {      
      fill(150, 225, 150);
    }

    //POT OF GOLD

    //HOVER
    if (mouseX >300 && mouseX <300+160 && mouseY >500
      && mouseY <500+100) {    


      textAlign(CENTER);
      textFont(font, 25);
      String s = "Click to dig up treasure";
      fill(0);
      text(s, width/2+175, 400, 100, 300);
    }   

    //MOUSEPRESSED
    if (mouseX >300 && mouseX <300+160 && mouseY >500
      && mouseY <500+100 && mousePressed) {

      img=loadImage("gold.png");
      img.loadPixels();
      img.resize(160, 100);
      image(img, 300, 500, 160, 100);



      textFont (font, 48);
      String s = "Happy St. Patrick's Day";
      fill(#0A8111);
      textAlign(CENTER);
      text(s, width/2, height/2);

      //CLOVER
      fill(0, 158, 96);
      int cx=50;
      int cy=40;

      pushMatrix(); 
      translate(cx+100, cy+450);
      strokeWeight(3);
      line(0, 0, -25, 50);
      strokeWeight(1);
      rotate(radians(70));
      translate(-cx, -cy);
      for (int h=0; h<3; h++) {
        beginShape();
        vertex(50+x, 15+y);
        bezierVertex(50+x, -5+y, 90+x, 5+y, 50+x, 40+y);
        vertex(50+x, 15+y);
        bezierVertex(50+x, -5+y, 10+x, 5+y, 50+x, 40+y);
        endShape();
      }
      popMatrix();

      pushMatrix(); 
      translate(cx+100, cy+450);
      rotate(radians(160));
      translate(-cx, -cy);
      for (int h=0; h<3; h++) {
        beginShape();
        vertex(50+x, 15+y);
        bezierVertex(50+x, -5+y, 90+x, 5+y, 50+x, 40+y);
        vertex(50+x, 15+y);
        bezierVertex(50+x, -5+y, 10+x, 5+y, 50+x, 40+y);
        endShape();
      }
      popMatrix();

      pushMatrix(); 
      translate(cx+100, cy+450);
      rotate(radians(250));
      translate(-cx, -cy);
      for (int h=0; h<3; h++) {
        beginShape();
        vertex(50+x, 15+y);
        bezierVertex(50+x, -5+y, 90+x, 5+y, 50+x, 40+y);
        vertex(50+x, 15+y);
        bezierVertex(50+x, -5+y, 10+x, 5+y, 50+x, 40+y);
        endShape();
      }
      popMatrix();

      pushMatrix(); 
      translate(cx+100, cy+450);
      rotate(radians(340));
      translate(-cx, -cy);
      for (int h=0; h<3; h++) {
        beginShape();
        vertex(50+x, 15+y);
        bezierVertex(50+x, -5+y, 90+x, 5+y, 50+x, 40+y);
        vertex(50+x, 15+y);
        bezierVertex(50+x, -5+y, 10+x, 5+y, 50+x, 40+y);
        endShape();
      }
      popMatrix();
    }
  }
}

void mouseReleased() {
  background(#42C8CB);
  fill(#56953E);
  noStroke();
  rect(0, 500, 600, 100);
  stroke(1);


  //RAINBOW
  img=loadImage("rainbow_piece.png");
  img.loadPixels();
  img.resize(100, 100);
  image(img, 75, 80, 100, 100);

  //CLOUD
  img=loadImage("cloud.png");
  img.loadPixels();
  img.resize(200, 130);
  image(img, 0, 0, 200, 130);

  textAlign(CENTER);
  textFont(font, 35);
  String s = "Follow the rainbow to the pot of gold";
  fill(0);
  text(s, width/2+50, 10, 200, 200);
}


