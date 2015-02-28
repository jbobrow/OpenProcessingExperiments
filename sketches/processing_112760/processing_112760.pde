
void setup() {
  size(790, 250);
  background(25, 32, 67);
  smooth();

  noStroke();
}
void draw() {
  background(178, 216, 255);

  for (int c=1; c<300; c+=1) {
frameRate (10);
    stroke(c, 100, 140);
    line(0, c, 1000, c);
  } 
  //céu

  for (int i=1/2; i<1; i+=10) {
    stroke(255);

    smooth();
    point(random(0, 790), random(0, 220)); 
    //estrelas


    fill(28, 147, 144, 255);
    noStroke();
    quad(0, 222, 790, 222, 790, 430, 0, 430);//chão
    fill(255);
    triangle(520, 222, 790, 200, 790, 222); 




    fill(255);
    ellipse(random(0, 790), random(0, 222), 5, 5); //neve caindo
    strokeWeight(7);
    stroke(255);
    line(0, 223, 790, 223);// linha de neve no chão




    noStroke();

    fill(223, 224, 215);

    quad(67, 222, 90, 222, 130, 182, 125, 145);
    quad(130, 182, 125, 145, 185, 148, 155, 180);
    quad(115, 222, 152, 222, 230, 149, 220, 110);
    quad(230, 149, 220, 110, 280, 118, 253, 148);
    quad(188, 222, 230, 222, 325, 130, 303, 90);
    quad(325, 130, 303, 90, 360, 100, 337, 130);
    quad(262, 222, 320, 222, 418, 102, 385, 68);
    quad(418, 102, 385, 68, 447, 82, 432, 105);
    quad(352, 222, 410, 222, 512, 77, 469, 48);
    quad(512, 77, 469, 48, 600, 107, 627, 123);
    
    fill(129, 106, 70, 255); 
    stroke(106,88,59);
    strokeWeight(1);
    quad(443, 222, 540, 222, 562, 100, 515, 90);
    quad(540, 222, 562, 100, 660, 123, 647, 212); 
    //entrada de madeira

    int x;
    int y;

    frameRate (10);


    fill(random(0, 250), mouseX/2, mouseY);
    for (y=100; y<mouseY-60; y=y+30);
    for (x=100; x<mouseX-80; x=x+30); 
    noStroke();
    quad(90, 222, 130, 182, 155, 180, 115, 222);
    quad(152, 222, 230, 149, 253, 148, 188, 222);
    quad(230, 222, 325, 130, 338, 130, 262, 222);
    quad(320, 222, 418, 102, 430, 104, 352, 222);
    quad(410, 222, 512, 77, 515, 90, 443, 222);
    triangle(512, 77, 515, 90, 590, 107);
    stroke(106,88,59);
    quad(570, 219, 620, 215, 635, 145, 585, 132); 

    //luzes
  }
}
