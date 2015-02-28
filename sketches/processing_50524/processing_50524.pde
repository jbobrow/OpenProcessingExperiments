
float dkX = 0.0;
float dkY = 0.0;
float dkW = 150.0;
float dkH = 100.0;
int numDk = 100;


void setup() {
  size (1000, 400);
  smooth();
  dkX = width/2;
  dkY = height/2;
  noLoop();
  
}

void draw () {
  background (150, 0, 200);
  rectMode(CORNER);
  fill(#EDE0C4);
  rect(0, height/2, width, height/2);
  for (int i = 0; i < numDk; i++) {
    dkX = random(width);
    dkY = random(height);
    dkW = random(18,20);
    dkH = random(25, 30);
    renderdk();
  }
}

void renderdk () {
fill (0, 200, 0);

  // arms and legs
  float x1 = dkX - (dkW / 2);
  float x2 = dkX + (dkW / 2);
  float y1 = dkY - (dkH / 2);
  float y2 = dkY + (dkH / 2);
  line(x1, y1, x2, y2);// left arm and right leg
  line(x2, y1, x1, y2);// right arm and left leg
  
  // body
  triangle (dkX, dkY, dkX/3, dkY/3, dkW/2, dkH/2);

  
  //head 1
  float head1W = dkW * 0.25;
  float head1H = dkH * 0.25;
  float head1X = dkX; 
  float head1Y = dkY - (dkH * 0.375);
  ellipse (head1X, head1Y, head1W, head1H);
  
  //head 2
  /*float head2W = dkW * 0.25;
  float head2H = dkH * 0.25;
  float head2X = dkX * .5; 
  float head2Y = dkY - (dkH * 0.45);
  ellipse (head2X, head2Y, head2W, head2H);
  */
  
  
}

/*
strokeWeight(2);  // Thicken line to outline face 1
ellipse (98, 100, 80, 110); //face dude
ellipse(85, 85, 10, 10); //eye 1
point(85, 85); //pupil 1
ellipse(110, 85, 10, 10); //eye 2
point(110, 85); //pupil 2
ellipse(98, 73, 11, 11); //eye 3
point(98, 73); //pupil 3
strokeWeight(5);  // face 1, mouth thickness
line (90, 125, 106, 125); //mouth

strokeWeight(1);  // Thicken line to outline face 2
ellipse (200, 110, 80, 110);//2nd face
fill (0, 0, 0); //black for eyes
ellipse(183, 85, 5, 10); //2nd face eye 1
ellipse(215, 85, 5, 10); //2nd face eye 2

fill (200, 0, 0); //Red for the gaping maw
strokeWeight(3);  // Thicken line for mouth
ellipse(200, 135, 50, 30); //terrible gaping maw

fill (#FFFFFF);
strokeWeight(1);  // Thicken line for teeth
triangle(186, 122, 190, 131, 192, 122); //upper tooth one
triangle(193, 122, 195, 131, 197, 122); //upper tooth two
triangle(198, 121, 200, 130, 202, 121); //upper tooth three
triangle(203, 122, 205, 131, 207, 122); //upper tooth four
triangle(208, 122, 210, 131, 213, 122); //upper tooth five


triangle(186, 147, 189, 137, 191, 147); //lower tooth #1 combo
triangle(186, 145, 189, 140, 191, 145); //lower tooth #1 combo
triangle(192, 147, 194, 140, 196, 147); //lower tooth #2
triangle(197, 148, 199, 141, 201, 148); //lower tooth #3
triangle(203, 148, 205, 141, 207, 148); //lower tooth #4
triangle(208, 147, 210, 137, 213, 147); //lower tooth #5 combo
triangle(208, 145, 210, 140, 213, 145); //lower tooth #5 combo

/*In the lower jaw I used combo teeth for the first and last tooth to give them
additional menance.*/

/*
fill (0, 0, 0); //black for necks
rect(85, 150, 28, 39);//neck 1
rect(187, 162, 24, 40);//neck 2

fill (0, 200, 0); //green for body to symbolize alienness of body
strokeWeight(5);  // Thick line to outline body
triangle(12, 180, 280, 200, 115, 400); //body

strokeWeight(15);  // Thick line for arm
line(12, 180, 5, 300); //arm 1

strokeWeight(15);  // Thick line
line(280, 200, 283, 300); //arm 2
*/


