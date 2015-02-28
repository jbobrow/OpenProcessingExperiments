
PImage img;

void setup() {
  size(800, 900);
  background(0, 244, 0);


  img = loadImage("potato.jpg");
  //background image.
}

void draw() {

  image(img, 0, 0);
  //image placement

  smooth();
  strokeWeight(6);
  stroke(0);


  fill(0);
  ellipse(400, 700, 590, 1000);

  fill(74, 80, 103);
  ellipse( 130, 1100, 150, 1200);
  ellipse( 670, 1100, 150, 1200);

  fill(250, 215, 169);
  //triangle(150, 400, 100, 400, 105, 240);
  //possible ear

  ellipse(400, 400, 520, 680);
  //main head shape.

  fill(0);
  rect( 250, 12, 300, 120);
  //brimm of hat

  ellipse(400, 125, 350, 110);

  fill(72, 69, 69);
  ellipse(400, 12, 300, 95);

  noStroke();
  fill(242, 206, 161);
  ellipse(400, 400, 190, 300);
  //sides of nose shading

  stroke(0);
  fill(0);
  curve(230, 240, 190, 190, 350, 270, 200, 30);
  curve(460, 480, 190, 190, 350, 270, 200, 35);
  fill(255);
  // left eye brow

  noStroke();
  fill(242, 206, 161);
  ellipse(270, 300, 100, 50);
  //under left eye shadow

  ellipse(540, 300, 100, 50);

  stroke(0);
  fill(255);
  ellipse(270, 285, 100, 50);
  //left eye, outer circle.

  fill(23, 42, 180); //Makes eye blue

  ellipse(270, 285, 45, 45);
  //left eye, inner circle

  fill(0); 
  ellipse(270, 285, 20, 20);

  fill(250, 244, 232);
  ellipse(270, 270, 100, 20);
  //left eye eyelid

  noStroke();
  fill(134, 41, 47);
  triangle(560, 200, 580, 480, 546, 480);
  triangle(560, 570, 580, 480, 546, 480);
  //right eye scar.

  stroke(0);
  fill(255);
  ellipse(540, 285, 100, 50);
  //right eye, outer circle.

  fill(23, 42, 180);
  //Makes eye blue


  ellipse(540, 285, 45, 45);
  //right eye, inner circle


  fill(0);
  ellipse(540, 285, 20, 20);


  fill(242, 137, 137);
  ellipse(405, 562, 60, 25);

  noStroke();
  fill(247, 210, 210);
  ellipse(405, 562, 40, 05);
  //mouth

  fill(0);
  triangle(360, 520, 250, 570, 440, 550);

  triangle(360, 520, 295, 570, 440, 550);

  triangle(360, 520, 320, 570, 440, 550);
  //three above for left mustache hairs

  triangle(440, 520, 490, 570, 360, 540);

  triangle(440, 520, 510, 570, 360, 520);

  triangle(440, 520, 540, 570, 360, 520);
  //three above for right mustache hair


  stroke(0);
  fill(248, 215, 165);
  ellipse(360, 520, 50, 50);
  //left nostril

  ellipse(440, 520, 50, 50);
  //right nostril


  fill(250, 215, 169);
  ellipse(400, 400, 120, 300);
  //nose, main shape

  noStroke();
  fill(242, 206, 161);
  ellipse(400, 650, 270, 120);
  //chin shading, large ellipse.

  fill(242, 206, 161);
  triangle(400, 420, 440, 305, 360, 305);
  //nose shading

  ellipse(400, 305, 80, 90);
  rect(390, 393, 18, 130);
  ellipse(400, 520, 60, 43);
  //more nose shading
}

                
