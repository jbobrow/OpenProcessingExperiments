


void setup() 

{
  smooth();
  size (360, 360);
  background(213);
  strokeWeight(2);
  fill(250);
  ellipse (360/2, 360/2, 200, 240);  //head

  strokeWeight(4);
  line (105, 160, 155, 160); //left eye

  line (205, 160, 255, 160); //right eye

  strokeWeight(2);
  bezier (165, 190,
  170, 210,
  190, 210,
  195, 190);  //nose

  fill(103);
  bezier (155, 250,
  150, 220,
  190, 220,
  185, 250);

  bezier (155, 250,
  160, 280,
  230, 280,
  185, 250);
  fill(255);     //mouth

  fill(40);
  bezier (255, 55,
  200, 60,
  50, 40,
  50, 140);  //forehead curl

  triangle(95, 135, 200, 85, 270, 125); //forhead triangle

  bezier (255, 45,
  200, 15,
  95, -15,
  70, 60);  //top of head curl

  bezier (75, 35,
  5, 90,
  -25, 140,
  35, 160); //left curl

  bezier (70, 150,
  35, 150,
  15, 240,
  35, 270);  //left side curl

  bezier (95, 170,
  40, 220,
  35, 240,
  120, 320); //left on face curl

  triangle(215, 85, 255, 65, 275, 120); //right triangle

  bezier (270, 40,
  330, 45,
  330, 130,
  280, 125); //right top curl

  bezier (340, 120,
  390, 165,
  320, 160,
  270, 160); //right side curl

  bezier (290, 180,
  230, 210,
  300, 230,
  360, 230); //lowest right curl

  ellipse (280, 240, 15, 15);
  ellipse (280, 260, 15, 15);
  ellipse (280, 280, 10, 10);
  ellipse (280, 295, 10, 10);
  ellipse (280, 310, 10, 10);

  bezier ( 285, 320,
  270, 320,
  260, 320,
  285, 335);

  fill(225);

}


void draw ()
{


  float x;
  float y;
  float c;

  if (keyPressed)
  {
    x= random (0, 360);
    y= random (0, 360);
    c= random (40, 80);
    fill(255);
    ellipse (x, y, 60, 60);
    strokeWeight(4);
    line (x-15, y-15, x+15, y-15);
    line (x-15, y+15, x+15, y+15);
    line (x+15, y-15, x-15, y+15);
    strokeWeight(2);
    fill(225);
  } 

  if (mousePressed)
  {
    smooth();
    size (360, 360);
    background(213);
    strokeWeight(2);
    fill(250);
    ellipse (360/2, 360/2, 200, 240);  //head

    strokeWeight(4);
    line (105, 160, 155, 160); //left eye
    line (150, 155, 105, 150);
    strokeWeight(8);
    point (130, 155);  //bloodshot pupil
    strokeWeight(2);
    line (150, 165, 125, 180);
    line(150, 165, 115, 170); //bags under eye


    strokeWeight(4);
    line (205, 160, 255, 160); //right eye
    line (210, 155, 255, 150); //eyebrow
    strokeWeight(8);
    point (230, 155); //bloodshot pupil
    strokeWeight(2);
    line (210, 165, 235, 180);
    line (210, 165, 245, 170); //bags under eye

    bezier (165, 190,
    170, 210,
    190, 210,
    195, 190);  //nose

    fill(103);
    bezier (155, 250,
    150, 220,
    190, 220,
    185, 250);

    bezier (155, 250,
    160, 280,
    230, 280,
    185, 250);
    fill(255);     //mouth

    fill(40);
    bezier (255, 55,
    200, 60,
    50, 40,
    50, 140);  //forehead curl

    triangle(95, 135, 200, 85, 270, 125); //forhead triangle

    bezier (255, 45,
    200, 15,
    95, -15,
    70, 60);  //top of head curl

    bezier (75, 35,
    5, 90,
    -25, 140,
    35, 160); //left curl

    bezier (70, 150,
    35, 150,
    15, 240,
    35, 270);  //left side curl

    bezier (95, 170,
    40, 220,
    35, 240,
    120, 320); //left on face curl

    triangle(215, 85, 255, 65, 275, 120); //right triangle

    bezier (270, 40,
    330, 45,
    330, 130,
    280, 125); //right top curl

    bezier (340, 120,
    390, 165,
    320, 160,
    270, 160); //right side curl

    bezier (290, 180,
    230, 210,
    300, 230,
    360, 230); //lowest right curl

    ellipse (280, 240, 15, 15);
    ellipse (280, 260, 15, 15);
    ellipse (280, 280, 10, 10);
    ellipse (280, 295, 10, 10);
    ellipse (280, 310, 10, 10);

    bezier ( 285, 320,
    270, 320,
    260, 320,
    285, 335);

    fill(225);
  }

  if (keyPressed) 
  {
    if(key=='s')
    {
      smooth();
      size (360, 360);
      background(213);
      strokeWeight(2);
      fill(250);
      ellipse (360/2, 360/2, 200, 240);  //head

      strokeWeight(4);
      line (105, 160, 155, 160); //left eye

      line (205, 160, 255, 160); //right eye

      strokeWeight(2);
      bezier (165, 190,
      170, 210,
      190, 210,
      195, 190);  //nose

      fill(103);
      bezier (155, 250,
      150, 220,
      190, 220,
      185, 250);

      bezier (155, 250,
      160, 280,
      230, 280,
      185, 250);
      fill(255);     //mouth

      fill(40);
      bezier (255, 55,
      200, 60,
      50, 40,
      50, 140);  //forehead curl

      triangle(95, 135, 200, 85, 270, 125); //forhead triangle

      bezier (255, 45,
      200, 15,
      95, -15,
      70, 60);  //top of head curl

      bezier (75, 35,
      5, 90,
      -25, 140,
      35, 160); //left curl

      bezier (70, 150,
      35, 150,
      15, 240,
      35, 270);  //left side curl

      bezier (95, 170,
      40, 220,
      35, 240,
      120, 320); //left on face curl

      triangle(215, 85, 255, 65, 275, 120); //right triangle

      bezier (270, 40,
      330, 45,
      330, 130,
      280, 125); //right top curl

      bezier (340, 120,
      390, 165,
      320, 160,
      270, 160); //right side curl

      bezier (290, 180,
      230, 210,
      300, 230,
      360, 230); //lowest right curl

      ellipse (280, 240, 15, 15);
      ellipse (280, 260, 15, 15);
      ellipse (280, 280, 10, 10);
      ellipse (280, 295, 10, 10);
      ellipse (280, 310, 10, 10);

      bezier ( 285, 320,
      270, 320,
      260, 320,
      285, 335);

      fill(225);
    }
  }




}





