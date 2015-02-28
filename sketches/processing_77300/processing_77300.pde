
//Dana Silberberg Sahar
//MidTerm project Oct_29th_2012 
//Defining my images:
PImage Plaid;
PImage Rows;

int brushCol;
int colorDir;
int myColor;
int angle;
float rad;
//int bwBrushCol;
//array:
ColorButton[] kaftor = new ColorButton[19]; //how many buttons+1 here I need 13

void setup() {
  // images for Buttons
  Plaid=loadImage("PlaidButton.png");
  Rows=loadImage("RowButton.png");
  //Defining Variables
  brushCol = 0;
  myColor=0;
  colorDir=myColor+1;
  angle=0;
  rad=0;
  //bwBrushCol=0;

  size(800, 800);
  colorMode (HSB, 360, 100, 100, 100);
  for (int i=0; i < 13; i++) {
    kaftor[i] = new ColorButton(i*40+10, 7, 35, i*27, 360);
  }
  for (int i=13; i < 18; i++) {
    kaftor[i] = new  ColorButton ((i+13)*40, 70, 35, 100, brushCol);
  }
}

void draw() {
  //ellipse button
  if (mouseX>=9 && mouseX<=44 &&mouseY>=105 &&mouseY<=140 ) {
    if (mousePressed) {
      stroke (random(myColor), 100, 100, random (100));
      strokeWeight (random(20));
      myColor++;
      fill (0, 0, 0, 0);
      ellipse (random (800), random (800), 30, 30);
      myColor++;
      myColor+=colorDir++;
      if (myColor>=50) {
        colorDir=-1;
        if (myColor>360) {
          colorDir=-1;
        }
        if (myColor<0) {
          colorDir=1;
        }
      }
      //println("yesellip");
    }
  }
  //star Button
  if (mouseX>=9 && mouseX<=44 &&mouseY>=185 &&mouseY<=220 ) {
    if (mousePressed) {
      //println("yestar");
      stroke (random(myColor), 100, 100, random (100));
      strokeWeight (random(20));
      myColor++;
      fill (0, 0, 0, 0);
      star (5, random (800), random (800), 5, 0.50);
      myColor++;
      myColor+=colorDir++;
      if (myColor>=50) {
        colorDir=-1;
        if (myColor>360) {
          colorDir=-1;
        }
      }
    }
  }
  //Spiral Button
  //if (mouseX>=9 && mouseX<=44 &&mouseY>=225 &&mouseY<=260 ) {
  //if (mousePressed) {
  //println("spira");

  //}
  //}
  //rect button
  if (mouseX>=9 && mouseX<=44 &&mouseY>=145 &&mouseY<=180 ) {
    if (mousePressed) {
      pushMatrix ();
      translate (30+myColor, 20+myColor);
      rotate(radians(myColor+45));
      stroke (myColor, 100, 100, 90);
      strokeWeight (5);
      rect (20, 10, 30, 30);
      myColor+=colorDir;  
      if (myColor>360) {
        colorDir=-1;
      }
      if (myColor<0) {
        colorDir=1;
      }
      println(myColor);
      popMatrix();
    }
  }

  strokeWeight(1);

  if (mousePressed) {
    strokeWeight(20);
    stroke (brushCol, 100, 100);
    line (mouseX, mouseY, pmouseX, pmouseY);
  }
  //  if (mousePressed){
  //   strokeWeight(20);
  //   stroke (0,0,bwBrushCol,100);
  //   line (mouseX,mouseY, pmouseX,pmouseY);
  // }
  //Color buttons toolbar;
  stroke (0, 0, 0, 100);
  strokeWeight (1);
  fill (226, 7, 34, 100);
  rect (0, 0, width, 49);
  rect (0, 49, width, 20);
  rect (0, 69, 55, height);
  rect (0, 69, 55, 25);
  // rect (0, 260, 55,25);
  fill (0, 0, 100, 100);
  textSize (15);
  text ("Brush Colors", 12, 65);
  text ("Backgrounds", 550, 65);
  text ("Shapes", 3, 90);
  //text ("Flip",15,280);

  //Shape Buttons
  for (int i=0; i <3; i++) {
    strokeWeight(1);
    stroke (0, 100, 0, 100);
    fill (0, 0, 100, 100);
    rect (9, i*45+100, 35, 35);
  }
  strokeWeight(2);
  ellipse (27.5, 118.5, 30, 30);
  rect (14, 150, 27, 27);
  star(5, 27, 208, 15, .50); 

  //float x=angle/13*cos(radians(angle));  
  //println (angle/17);
  //float y=angle/13*sin(radians(angle));
  //fill (myColor,100,100,random (15));
  //stroke (myColor,100,100,random (15));
  //strokeWeight (random(15));
  //flag+=FlagDir;  
  //ellipse (26.5,252.5,5,5);
  //rad+=.5;
  //angle+=137;

  //for-loops to make the color buttons
  // Color buttons (1st row)
  for (int i=0; i < 13; i++) {
    kaftor[i].display();
  }


  // for-loop to make the Background buttons (2nd row)

  // for-loop to make the greyscale buttons (2nd row)
  //  for (int i=0; i < 13; i++) {
  //  kaftor[i+12].display();
  //  }


  //to check mouse location
  for (int i=0; i < 13; i++) {
    kaftor[i].bLocCk();
  }
  //Background Change buttons

  for (int i=0; i < 5; i++) {
    strokeWeight(1);
    stroke (0, 100, 0, 100);
    fill (0, 0, 100, 100);
    rect (i*40+550, 7, 35, 35);
  }

  //1st Background button: blank page
  if (mouseX>=545 && mouseX<=580 &&mouseY>=7 &&mouseY<=42 ) {
    if (mousePressed) {
      //println("yes! 3rd butt");
      stroke (0, 0, 0, 100);//check!??
      fill(0, 0, 100, 100);
      rect (0, 50, 800, 751);
    }
  }
  //5th Background button: black
  fill(0, 100, 0, 100);
  rect (710.5, 7, 35, 35);
  if (mouseX>=715 && mouseX<=745 &&mouseY>=7 &&mouseY<=42 ) {
    if (mousePressed) {
      println("yes! 3rd butt");
      stroke (0, 0, 0, 100);//check!??
      fill(0, 100, 0, 100);
      rect (0, 50, 800, 751);
    }
  }

  // /2nd Background button:rainbow colors
  //strokeWeight(.6);
  //for(int i=0;i<30;i++){
  //fill ((i+158)*50,100,100,10);
  //rect (590,7,i*2.3-i,i*2.3-i);
  //}
  //for (int i=0;i<10;i++) {
  //fill ((i+80)*22, 100, 100, 10);
  // strokeWeight(random(3));
  //  stroke ((i*36), 100, 100, random(30));
  fill ((myColor), 100, 100, 100);
  myColor++;
  rect (590.5, 7, 35, 35);
  myColor+=colorDir;
  if (myColor>360) {
    colorDir=-1;
  }
  if (myColor<0) {
    colorDir=1;
  }
  //}   

  if (mouseX>=590 && mouseX<=625 &&mouseY>=7 &&mouseY<=42 ) {
    if (mousePressed) {
      //println("yes! 3rd butt");
      stroke (0, 0, 0, 100);//check!??
      fill(myColor, 100, 100, 90);
      rect (0, 50, 800, 751);
    }

    myColor+=colorDir;
    if (myColor>360) {
      colorDir=-1;
    }
    if (myColor<0) {
      colorDir=1;
    }
  }

  //Blue rows (3rd button)
  image (Rows, 631, 8);
  if (mouseX>=635 && mouseX<=670 &&mouseY>=7 &&mouseY<=42 ) {
    if (mousePressed) {
      println("3rd back!");
      strokeWeight (.1);
      for (int y = 0; y < height / 25; y++) {

        //    for (int y = 0; y < height / squSize; y++) {


        stroke (214, 38, 72);
        fill(226, 9, 100);


        rect (0, y* 25, width, y+25 );
      }
      strokeWeight (.1);
      stroke (359, 71, 97);
      line (90, 0, 90, height);
    }
  }

  //yellow plaids (4th button)
  image (Plaid, 672, 8);
  if (mouseX>=670 && mouseX<=715 &&mouseY>=7 &&mouseY<=42 ) {
    if (mousePressed) {
      println("4th back!");
      strokeWeight (.2);
      for (int x = 0; x < width / 15; x++) {
        for (int y = 0; y < height / 15; y++) {
          stroke (116, 88, 78, 60);
          fill (58, 30, 100);
          rect(x * 15, y * 15, 15, 15);
        }
      }
    }
  }
}

// Many thanks to Colin Wilson who took the time and had the endless patience to tutor me and walk me through the mystery of objects and arrays
class ColorButton {

  int bSize;
  int locX;
  int locY;
  int bColor;
  int bwColor;

  //builder
  ColorButton (int _locX, int _locY, int _bSize, int _bColor, int _bwColor) {
    bSize = _bSize;
    locX = _locX;
    locY = _locY;
    bColor = _bColor;
    bwColor = _bwColor;
  }

  //Checks if mouse loc is over the button
  void bLocCk() {
    if (mouseX >= locX && mouseX <= (locX + bSize) && mouseY >= locY && mouseY <= (locY + bSize)) {

      //Color Buttons    
      brushCol = bColor;
      //  bwBrushCol=bwColor;
      // println(bColor);
    }
  } 




  void display() {

    strokeWeight(1);
    fill (bColor, 255, bwColor);
    rect (locX, locY, bSize, bSize);
  }
}

//DO NOT DELETE THIS LINE: "void star" taken from processing.org/learning/anatomy/ (Thank you!! their star is much more "star-ish" than mine...)
void star(int n, float cx, float cy, float r, float proportion)
{
  star(n, cx, cy, 2.0 * r, 2.0 * r, 0.0, proportion);
}

void star(int n, float cx, float cy, float w, float h, 
float startAngle, float proportion)
{
  if (n > 2)
  {
    float angle = TWO_PI/ (2 *n);  // twice as many sides
    float dw; // draw width
    float dh; // draw height

    w = w / 2.0;
    h = h / 2.0;

    beginShape();
    for (int i = 0; i < 2 * n; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * proportion;
        dh = h * proportion;
      }
      vertex(cx + dw * cos(startAngle + angle * i), 
      cy + dh * sin(startAngle + angle * i));
    }
    endShape(CLOSE);
  }
}

//class GrySclButton {

//int bSize;
//int locX;
// int locY;
//int bwColor;

//builder
//ColorButton (int _locX, int _locY, int _bSize, int _bwColor) {
//bSize = _bSize;
// locX = _locX;
//locY = _locY;
// bwColor = _bwColor;

//}

//Checks if mouse loc is over the button
//void bLocCk() {
// if (mouseX >= locX && mouseX <= (locX + bSize) && mouseY >= locY && mouseY <= (locY + bSize)) {

//Grey scale buttons    
//brushCol = bColor;
//bwBrushCol=bwColor;
// println(bColor);

//}

//}


