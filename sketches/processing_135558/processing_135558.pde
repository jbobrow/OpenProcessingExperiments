
//
PImage img;//basket
PImage img2;//lid
PImage img3;//mach


float xoo, yoo; //end of short arm meets elbow
float xooo, yooo;//start of long arm conects to elbow
float radians;
float theta;//angle by shoulder
float phi;//angle arm after elbow
float lengthR =50; //radius of arm by shoulder
float lengthR2 =266; //radius of arm post elbow

float speed = 1;  //frequency 
float speed2 = 2.0;
//float a, b, c, d;
final int ANGLE_LIMIT2 = 320;
final int ANGLE_LIMIT = 180;
///boolean direction;
//phi=atan(woo/zoo);
//theta += speed; in draw loop stops arm


void setup() {
  size (800, 600);
  smooth();
  img= loadImage("lid_basket.png");
  img2= loadImage("lid.png");
  img3= loadImage("monsterMach.png");
}


void draw() {
  background(255);
  println(radians(theta));
  image(img3, 0, 0);//mach
  fill(25);
  rect(292, 84, 85, 34); //lid eye

  image(img2, 301, 84); //lid in eye

  noStroke();
  fill(35);              //machine shoulder
  ellipse(500, 119, 40, 30);
  
  //ellipse(450, 119, 20, 20);//test dot
  drawArms();
  image(img, xooo-30, yooo);  //basket png
}

void drawArms() {
  xoo= 500+ sin(radians(theta))*(lengthR);
  yoo= 119+ cos(radians(theta))*(lengthR);
  stroke(2);                 //arm
  strokeWeight(12);          //short arm by machine shoulder
  //strokeCap(SQUARE);      // Square the line endings
  strokeCap(ROUND);
  line(500, 119, xoo, yoo);
  theta-= speed;

  if (theta > ANGLE_LIMIT || theta <0)  //sets limits on angle and reverse
  {
    speed= -speed;
    // theta += speed;
  }
  xooo= xoo+ sin(radians(phi))*(lengthR2);    
  yooo= yoo+ cos(radians(phi))*(lengthR2);
  stroke(2);                 //arm
  strokeWeight(12);          //longer arm by basket 
  //strokeCap(SQUARE);      // Square the line endings
  strokeCap(ROUND);
  line(xoo, yoo, xooo, yooo);
  phi-= speed2;
  if (phi > ANGLE_LIMIT2 || phi <0) //sets limits on angle and reverse
  {
    speed2= -speed2;
    // theta += speed;
  }
}



