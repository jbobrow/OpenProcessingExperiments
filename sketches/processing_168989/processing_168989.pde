
PImage [] pic;

int xPos=10;
int yPos=379;
int cw = 46;
int ch = 59;
int m=58;
int selButton = 0;
boolean drawBagel = false;
boolean drawCupcake = false;

/* @pjs preload="bg0.jpg"; */

/* @pjs preload="b1.gif"; */
/* @pjs preload="b2.gif"; */
/* @pjs preload="b3.gif"; */
/* @pjs preload="b4.gif"; */
/* @pjs preload="b5.gif"; */
/* @pjs preload="b6.gif"; */
/* @pjs preload="b7.gif"; */
/* @pjs preload="b8.gif"; */
/* @pjs preload="b9.gif"; */
/* @pjs preload="b10.gif"; */
/* @pjs preload="b11.gif"; */

void setup() {

  size(600, 600);
  pic = new PImage [12];

  pic[0] = loadImage("bg0.jpg");
  pic[1] = loadImage("b1.gif");
  pic[2] = loadImage("b2.gif");
  pic[3] = loadImage("b3.gif");
  pic[4] = loadImage("b4.gif");
  pic[5] = loadImage("b5.gif");
  pic[6] = loadImage("b6.gif");
  pic[7] = loadImage("b7.gif");
  pic[8] = loadImage("b8.gif");
  pic[9] = loadImage("b9.gif");
  pic[10] = loadImage("b10.gif");
  pic[11] = loadImage("b11.gif");

  image(pic[0], 0, 0);


  //drawingboard
  noStroke();
  fill(0);
  rect(30, 130, 535, 230);


  //eraser
  image(pic[9], xPos+m+m+m+m+m+m+m, yPos, 59, 59);

  //white
  image(pic[1], xPos, yPos, cw, ch);

  //pink
  image(pic[4], xPos+m, yPos, cw, ch);

  //blue
  image(pic[7], xPos+m+m, yPos, cw, ch);

  //green
  image(pic[6], xPos+m+m+m, yPos, cw, ch);

  //yellow
  image(pic[2], xPos+m+m+m+m, yPos, cw, ch);

  //purple
  image(pic[5], xPos+m+m+m+m+m, yPos, cw, ch);

  //aqua
  image(pic[3], xPos+m+m+m+m+m+m, yPos, cw, ch);

  //bagel
  image(pic[10], xPos+m+m+m+m+m+m+m+m+10, yPos+10, 43, 43);

  //cupcake
  image(pic[11], xPos+m+m+m+m+m+m+m+m+m+10, yPos, 53, 51);

  smooth();
}

void draw() {


  println(mouseX, mouseY);

  if (mousePressed) {
    if (mouseX>33 && mouseX<532 && mouseY>133 && 357>mouseY) {
      if (drawBagel) {
        image(pic[10], mouseX, mouseY);
      } else if (drawCupcake) {
        image(pic[11], mouseX, mouseY);
      } else {
        line(pmouseX, pmouseY, mouseX, mouseY);
      }         
    } else {
      //white
      if (mouseX>xPos && mouseX<xPos+m && mouseY>yPos && mouseY<yPos+ch) {
        strokeWeight(4);
        stroke(255);
      }
      //pink   
      if (mouseX>xPos+m && mouseX<xPos+(m*2) && mouseY>yPos && mouseY<yPos+ch) {
        strokeWeight(4);
        stroke(244, 153, 193);
      }
      //blue
      if (mouseX>xPos+(m*2) && mouseX<xPos+(m*3) && mouseY>yPos && mouseY<yPos+ch) {
        strokeWeight(4);
        stroke(0, 174, 239);
      }
      //green
      if (mouseX>xPos+(m*3) && mouseX<xPos+(m*4) && mouseY>yPos && mouseY<yPos+ch) {
        strokeWeight(4);
        stroke(141, 198, 63);
      }
      //yellow
      if (mouseX>xPos+(m*4) && mouseX<xPos+(m*5) && mouseY>yPos && mouseY<yPos+ch) {
        strokeWeight(4);
        stroke(255, 242, 86);
      }
      //purple
      if (mouseX>xPos+(m*5)&& mouseX<xPos+(m*6) && mouseY>yPos && mouseY<yPos+ch) {
        strokeWeight(4);
        stroke(154, 45, 145);
      }
      //Aqua
      if (mouseX>xPos+(m*6) && mouseX<xPos+(m*7) && mouseY>yPos && mouseY<yPos+ch) {
        strokeWeight(4);
        stroke(43, 182, 115);
      }
      //eraser
      if (mouseX>xPos+(m*7) && mouseX<xPos+(m*8) && mouseY>yPos && mouseY<yPos+ch) {
        strokeWeight(30);
        stroke(0);
      }
      //bagel
      if (mouseX>xPos+(m*8)+10 && mouseX<xPos+10+(m*9) && mouseY>yPos+10 && mouseY<yPos+43) {
        drawBagel = true;      
      } else {
        drawBagel = false;
      }    
      //cupcake
      if(mouseX>xPos+10+(m*9) && mouseX<xPos+10+(m*10) && mouseY>yPos && mouseY<yPos+51) {
        drawCupcake = true;      
      } else {
        drawCupcake = false;
      }
    }
  }
}



