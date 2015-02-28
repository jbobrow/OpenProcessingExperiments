
float i;


void setup() {

  size(400, 400);

  smooth();

  strokeWeight(3);

  i=0;
}

void draw() {

  background(255, 255, 255);


  ellipse(width/2, height/2, 360+i+i, 300+i+i);
  ellipse(width/2, height/2, 300+i+i, 240+i+i);
  ellipse(width/2, height/2, 240+i+i, 180+i+i);
  ellipse(width/2, height/2, 180+i+i, 120+i+i);
  fill(0);
  ellipse(width/2, height/2, 90+i, 120+i);
  triangle(70+width/2+i, height/2, width/2-70-i, height/2, width/2, 120+height/2+i); 
  //batbody
  triangle(10+width/2, height/2-20, 140+width/2+i, height/2-20, 10+width/2, 80+height/2+i);
  triangle(width/2-10, height/2-20, width/2-140-i, height/2-20, width/2-10, 80+height/2+i);
  //batwings
  triangle(width/2,height/2, 50+width/2+i, height/2, 20+width/2, height/2-90-i);
  triangle(width/2,height/2, width/2-50-i, height/2, width/2-20, height/2-90-i);
  //batears
 //mouse movement batman signal:

  fill(0);

  quad(115, 100, 285, 100, 300, 375, 100, 375);

  //head:

  

  quad(120, 330, 100, 400, 0, 400, 0, 355); 

  quad(280, 330, 300, 400, 400, 400, 400, 355);

  quad(100, 400, 100, 350, 300, 350, 300, 400);

  //cape:

  

  triangle(115, 100, 120, 30 + mouseY / 20, 140, 100);

  triangle(285, 100, 280, 30 + mouseY / 20, 260, 100);

  //ears:

  

  fill(255);

  triangle(130, 170 + mouseY /20, 130, 190, 190, 190);

  triangle(270, 170 + mouseY /20, 270, 190, 210, 190);

  //eyes:

  

  fill(250, 236, 197);

  noStroke();

  quad(130, 230, 130, 320, 200, 320, 200, 250);

  quad(270, 230, 270, 320, 200, 320, 200, 250);

  //unmasked parts:

  

  stroke(0);

  line(190, 280 + mouseY / 50, 200, 275);

  line(200, 275, 210, 280 + mouseY / 50);

  //mouth:

  

  createFont("Gothic",10 );

  textSize(30);

  fill(255, 255, 36);

  textAlign(CENTER, CENTER);

  text("BATMAN", width/2, 380);

  

  

  if (i > 140) {
    i = 0;
  }

  else {
    i=i+1;

  }

}
