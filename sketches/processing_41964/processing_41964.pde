
PImage stars;
PImage sunplanet;

void setup() {
  size(800, 600);
  background(0);
  smooth();
  stars = loadImage("stars.jpg");
  sunplanet = loadImage("sun.gif");
}
//keeping track of the rotation 
int sun =  1; //main rotation
int moon = 1; //radius roatation 
int opp = -1;

void draw() {



  //background(0);
  image(stars, 0, 0);


  //sun
  noStroke();
  fill(242, 131, 12);
  ellipse(400, 300, 15, 15);   

  //neptune
  pushMatrix();
  noStroke();
  image(sunplanet, 0, 0);
  translate(width/2, height/2);  //starting point at the center
  rotate(radians(sun));          //rotating at center// thinking of degrees as radians
  translate(100, 200);           //radius od the planet
  rotate(radians(opp-40));         //rotate the ellipse around the axis
  fill(21, 245, 255);
  ellipse(0, 0, 50, 50);          //draw the ellipse
  popMatrix();

  //moon
  pushMatrix();
  fill(215, 221, 234);
  noStroke();
  translate(width/2, height/2);
  rotate(radians(sun));
  translate(100, 30);
  rotate(radians(moon+45));
  ellipse(0, 0, 20, 20);   
  popMatrix();

  //earth 
  pushMatrix();
  fill(21, 61, 255);
  noStroke();
  translate(width/2, height/2);
  rotate(radians(sun));
  translate(60, 0);
  rotate(radians(moon+55));
  ellipse(0, 0, 30, 30);   
  popMatrix();



  moon+=20;
  sun++;
  opp+=10;
}


