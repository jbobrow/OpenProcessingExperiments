
float boatxPos = 50;
float cloudxPos = 120;
float sunxPos = 375;

void setup ()
{
  size (500, 400);
  rectMode (CENTER);
  frameRate (6);
}

void draw ()  
{
  background (#380DBC);

  strokeWeight (8);
  text ("Oh, Oh.", 125, 77);

  //sun
  noStroke ();
  fill(#F7E511);
  //rect (sunxPos,75,90,90);
  ellipse (sunxPos, 75, 90, 90);

  //cloud
  noStroke();
  fill (255);
  ellipse(cloudxPos, 65, 150, 60);
  ellipse(cloudxPos - 60, 75, 150, 60);
  ellipse(cloudxPos + 30, 85, 150, 60);

  //steam
  fill (200);
  ellipse (boatxPos, 150, 30, 30);
  ellipse(boatxPos - 50, 130, 25, 25);
  ellipse(boatxPos - 100, 110, 20, 20);

  //funnel
  fill (#F03C2C); 
  rect (boatxPos +15, 200, 30, 75);

  //super
  fill (#F02C53);
  rect (boatxPos, 250, 100, 50);

  //portholes
  fill (#0FF5C5);
  ellipse (boatxPos, 250, 15, 15);
  ellipse (boatxPos -30, 250, 15, 15);
  ellipse (boatxPos +30, 250, 15, 15);

  //hull
  fill (#A436C6);
  rect (boatxPos, 280, 150, 50);
  triangle (boatxPos, 300, boatxPos +150, 250, boatxPos + 50, 250);

  //flag
  stroke  (0);
  strokeWeight (3);
  line (boatxPos  - 70, 250, boatxPos  -80, 200);
  line (boatxPos +60, 250, boatxPos +60, 200);

  fill (#0FF546);
  rect (boatxPos -90, 200, 20, 20);

  //sea
  noStroke ();
  fill (#259B86);
  rect (200, 350, 400, 130);
 
  ellipse (25, 300, 50, 40);
  ellipse (50, 300, 50, 40);
  ellipse (75, 300, 50, 40);
  ellipse (100, 300, 50, 40);
  ellipse (120, 300, 50, 60);
  ellipse (150, 300, 60, 50);
  ellipse (200, 300, 60, 50);
  ellipse (250, 300, 70, 40);
  ellipse (275, 300, 60, 40);
  ellipse (300, 300, 60, 40);
  ellipse (325, 300, 50, 40);
  ellipse (350, 300, 50, 40);
  ellipse (400, 300, 50, 40);
  
     strokeWeight (8);
  stroke (#F50F17);
  text ("what happens next ?.......", 100, 380);

  //bird
  stroke (255);
  strokeWeight (4);

  noFill();
  arc(95, 35, 50, 40, -PI, 0);  
  arc(145, 35, 50, 40, -PI, 0); 

  //head
  fill (255);
  ellipse (130, 35, 20, 15);
  //body 
  ellipse (110, 35, 40, 12);
  //tail
  triangle (90,35,70,30,70,35);

  //eyes
  stroke (0);
  strokeWeight (2);
  point (125, 35);
  point (135, 35);

  //beak
  stroke (#F5E20F);
  strokeWeight (5);
  point (130, 35);

  boatxPos = boatxPos + 2;
  sunxPos = sunxPos +1;
  cloudxPos = cloudxPos -  2;

  if  (boatxPos > 395)
{
    boatxPos = 393;
}

}
