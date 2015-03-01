
//code_04
//working bounsing ball

float circleX;                    // declare: circleX
float circleY;                    // declare: circleY
float xspeed;                     // declare: xspeed
float yspeed;                     // declare: Yspeed

//========================================================= void setup
void setup() {
  size (500, 600);
  circleX = 120;                     // initialise: circleX
  circleY = 138;                     // initialise: circleY
  xspeed = 1.5;                    // initialise: xspeed
  yspeed = 0.5;                    // initialise: yspeed
}

//========================================================= void draw

void draw() {

  background(0);

  noFill();
  stroke(150, 150, 150);
  rect(39, 16, 454, 578); // 01_Biggest rect angle

  fill(32, 30, 30);
  stroke(50, 50, 50);
  rect(75, 41, 402, 503); // 02_next big rect angle

  fill(32, 30, 30);
  stroke(65, 65, 65);
  rect(104, 91, 300, 31); // 03_rect angle above mandala

  fill(32, 30, 30);
  stroke(65, 65, 65);
  rect(104, 130, 300, 300); // 05_mandala rect angle

  fill(32, 30, 30);
  stroke(65, 65, 65);
  rect(104, 438, 300, 31); // 06_rect angle underneath mandala

  //line(104, 274, 403, 274 ); // line vertical mandala

  //line(255, 130, 255, 428 ); // line horizontal mandala

  //================================================ b/w swatches

  strokeWeight(0.7);       // stroke weight - "b/w swatches"
  stroke(10, 10, 10);      // stroke color - "b/w swatches"

  fill(0);
  rect(2, 55, 15, 30);     // 01_swatch color - black: 0

    fill(31);
  rect(2, 85, 15, 30);     // 02_swatch color - gray: 31

  fill(62);
  rect(2, 115, 15, 30);     // 03_swatch color - gray: 62

  fill(94);
  rect(2, 145, 15, 30);     // 04_swatch color - gray: 94

  fill(128);
  rect(2, 175, 15, 30);     // 05_swatch color - gray: 128

  fill(159);
  rect(2, 205, 15, 30);     // 06_swatch color - gray: 159

  fill(190);
  rect(2, 235, 15, 30);     // 07_swatch color - gray: 190

    fill(221);
  rect(2, 265, 15, 30);     // 08_swatch color - gray: 221

  fill(255);
  rect(2, 295, 15, 30);     // 09_swatch color - gray: 255
  
  //================================================ numbers-text


  //================================================ color swatches

  strokeWeight(0.7);       // stroke weight - "color swatches"
  stroke(65, 65, 65);      // stroke color - "color swatches"

  fill(0, 0, 0);
  rect(250, 560, 25, 20);     // 01_swatch color - black

  fill(51, 0, 0);
  rect(275, 560, 25, 20);     // 02_swatch color - brown

  fill(255, 255, 255);
  rect(300, 560, 25, 20);     // 03_swatch color - white

  fill(255, 51, 0);
  rect(325, 560, 25, 20);     // 04_swatch color - red

  fill(255, 153, 0);
  rect(350, 560, 25, 20);     // 05_swatch color - orange

  fill(255, 204, 0);
  rect(375, 560, 25, 20);     // 06_swatch color - yellow

  fill(51, 102, 0);
  rect(400, 560, 25, 20);     // 07_swatch color - green

  fill(51, 153, 255);
  rect(425, 560, 25, 20);     // 08_swatch color - light blue

  fill(102, 0, 204);
  rect(450, 560, 25, 20);     // 09_swatch color - violet

  //---------------------------------- rect under color swatches

  fill(35, 35, 35);
  rect(250, 580, 225, 7);     // 09_swatch color - brown

  //====================================== circle follow mouse-XY

  //fill(150);
  //stroke(255);
  //ellipse(mouseX, mouseY, 10, 10); //mouseX, hight-mouseY
  
  //====================================== two - Circle animations

  fill(200, 133, 10);
  stroke(255);
  ellipse(circleX, height/2, 32, 32);

  fill(130, 133, 10);
  stroke(0);
  ellipse(width/2, circleY, 16, 16);

  circleX = circleX + xspeed; //circleX + xspeed = 2pix
  circleY = circleY + yspeed; //circleY + yspeed = 2pix

  if (circleX > 388) {   //hit the right side; width = 640pix
    xspeed = -2;         // turn around
  }

  if (circleX < 120) {   //hit the left side/wall
    xspeed = 2.5;       // turn around
  }
  
    if (circleY > 422) {   //hit the bottom side; height = 360pix
    yspeed = -4;
  }
  
  if (circleY < 138) {   //hit the top side/wall
    yspeed = 2;       // turn around
  }
}

//========================================================= CODE END

