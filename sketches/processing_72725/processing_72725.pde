
float[] offset = new float[1000];

// for mousePressed
float mx = 217;
float my = 217;
float ms = 398;
float ma = 416;
float mt = 274;
float mp = 217;
float mb = 416;

//PFont font;

///////////////////////////////////////////////////////////////////////////////


void setup () {
  size(640, 360);
  smooth();
  stroke(255);


  //font = loadFont("Futura-CondensedMedium-14.vlw");
  //textFont(font);


  for (int i=0; i<1000; i++) {
    offset[i] = random(-80, 80);
  }
}


///////////////////////////////////////////////////////////////////////////////


void draw() {

  background(255);



  //PATTERN
  for (int x=0; x< width; x+=37) {
    for (int y=0;   y < height+180;   y+=200) {

      //offset += random(-4, 4);
      //offset2 += random(-4, 4);

      int h = 130;

      strokeWeight(24);
      line(x, y + offset[x], x, y+h + offset[x]);

      strokeWeight(1);
      ellipse(x, y-30 + offset[x], 27, 27);
    }
  }

  for (int x=0; x>360 && x< 480; x+=27) {
    for (int y=0;   y < height+180;   y+=200) {

      int h = 130;

      strokeWeight(24);
      line(x, y + offset[x], x, y+h + offset[x]);

      strokeWeight(1);
      ellipse(x, y-30 + offset[x], 27, 27);
    }
  }


  //REC BACKGROUND

  fill(255);
  stroke(255);
  rect(175-5, 0, 260+27, 360);

  //URINAL
  strokeWeight(24);
  stroke(0);
  line(285, 208, 285, 338);


  //Urinal triangle. stroke issue.
  strokeWeight(0);
  noStroke();
  fill(255);
  triangle(268, 230-5, mt, 259-5, 268, 259-5);


  //Urinal P
  noFill();
  strokeWeight(2);
  if (mousePressed) {
    if (mouseButton == LEFT) {
      stroke(251, 176, 64);
    }
  }
  else {
    stroke(255);
  }
  arc(246, 224+35, 60, 60, radians(270), radians(325));


  //FIXED LINES   

  int l = 130;
  int e = 32;

  stroke(0);
  strokeWeight(24);
  line(217, 0, 217, 139-65);
  line(217, 340, 217, 370);
  line(182, 272, 182, 360);
  line(252, 45, 252, 175);
  line(252, 285+10, 252, 360);
  line(285, -20, 285, -40+l);
  line(318, 100, 318, 100+l);
  line(318, 289, 318, 360);
  line(351, 48, 318+33, 48+l);
  line(370, 279+e, 370, 360);
  line(416, 0, 416, 75);
  line(416+33, 55, 416+33, 55+l);


  //FIXED CIRCLES
  int r = 27;
  fill(0);
  strokeWeight(1);
  ellipse(182, 0, r, r);
  ellipse(182, 240, r, r);
  ellipse(252, 253+10, r, r);
  ellipse(252, 45-e, r, r);
  ellipse(285, 176, r, r);
  ellipse(285+33, 100-e, r, r);
  ellipse(351, 48-e, r, r);
  ellipse(416+33, 299+e, r, r);
  ellipse(416+33, 55-e, r, r);


  //TOILET

  //bowl
  stroke(0);
  strokeWeight(1);
  fill(0);
  ellipse (370, 272+7, 27, 27);

  //hole single object moving
  noStroke();
  fill(255);
  //float ms = map(mouseX, 0, width, 366, 398);
  rect(ms, 260, 20, 20);

  // toilet P
  strokeWeight(2);

  if (mousePressed) {
    if (mouseButton == LEFT) {
      stroke(251, 176, 64);
    }
  }
  else {
    stroke(255);
  }

  line(367+13, 275-6, 388, 250);


  //MALE BODY

  int a = 217;
  int b = 169;

  //movement of male body
  stroke(0);
  strokeWeight(22);
  line(a, b, mx, 190); // Upper Arm
  line(mx, 190, a, 235); // Lower Arm

  strokeWeight(24);
  line(my, 230, a, 299); // Lower Body
  line(a, b, my, 225); // Upper Body

  //head
  fill(0);
  strokeWeight(1);
  ellipse(a, b-30, 27, 27);

  //male part
  strokeWeight(0);
  fill(0);
  //float mp = map(mouseX, 0, width, 241, 217);
  ellipse(mp, 230, 10, 7); 


  //FEMALE BODY

  //movement of female body
  strokeWeight(24);
  line(416, 267, 416, 299);

  //float ma = map(mouseX, 0, width, 389, 416);
  line(416, 193, ma, 247); // Upper body
  line(ma, 244, 416, 270); // Mid body

  //head
  fill(0);
  strokeWeight(1);
  ellipse(416, 193-31, 27, 27);

  //female part
  strokeWeight(0);
  fill(0);
  //float mb = map(mouseX, 0, width, 421, 416);
  ellipse(mb, 211, 12, 12);  
  
}


//CONTROL MOVEMENT

void mouseMoved() {

  mx = map(mouseX, 0, width, 185, 217); //male upper arm
  my = map(mouseX, 0, width, 230, 217); // male lower arm
  ms = map(mouseX, 0, width, 366, 398); // rectangle for toilet
  ma = map(mouseX, 0, width, 389, 416); // female body
  mt = map(mouseX, 0, width, 286, 274); // urinal triangle
  mp = map(mouseX, 0, width, 241, 217); // male part
  mb = map(mouseX, 0, width, 421, 416); // female part
}
