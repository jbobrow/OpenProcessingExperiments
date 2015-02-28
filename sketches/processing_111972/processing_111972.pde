


PImage myImage;
PImage myImage2;
boolean alreadyInverted = false;

void setup()
{
size(400,600);

myImage = requestImage("craig.png");
myImage2 = requestImage("cloud.png");
}
void draw()
{
   if (myImage.width > 0)
  {
    if (alreadyInverted == false)
    {
      myImage.filter(INVERT);
      alreadyInverted = true;
    }
   image(myImage, 0, 0, width, height);
    tint(255, 128);
   image(myImage2,200,0,200,200);
    tint(255, 128);
   image(myImage2,10,0,200,200);
}

noStroke();
//Hat
fill(0);
ellipse(187,370,230,70);
fill(#4D2525);
ellipse(176, 265,90,104);
//Main Body
fill(0);
ellipse(280,400,99,99);
ellipse(292,410,99,99);
ellipse(292,420,99,99);
ellipse(296,420,99,99);
ellipse(304,440,99,99);
ellipse(306,450,99,99);
ellipse(310,460,99,99);
ellipse(315,470,99,99);
ellipse(320,480,99,99);
ellipse(323,490,99,99);
ellipse(320,500,99,99);
ellipse(320,505,99,99);
ellipse(270,550,100,400);
fill(0);
ellipse (198,240,100,118);
fill(0);
rect(100,350,200,400);
ellipse(100,470,100,240);
//Head, Neck
noStroke();
fill(#f9b53d);
ellipse (200,280,95,105);
rect(164,300,68,40);
ellipse(198,335,70,25);
ellipse(155,282,19,29);
//Eyes
fill(#FFFFFF);
ellipse(198,265,17,10);
ellipse(228,265,17,10);
fill(0);
ellipse(201,264,9,9);
ellipse(231,264,9,9);
//Lips
stroke(0);
strokeWeight(1);
fill(#AAAAAA);
ellipse(220,296,20,4);
fill(#A7A7A7);
ellipse(220,299,20,4);
//Nose
fill(0);
ellipse(214,282,6,3);
fill(0);
ellipse(223,282,6,3);
noFill();
stroke(0);
strokeWeight(1);
arc(213,280,10,12,PI/1.75,PI);
arc(221,282,10,12, TWO_PI-PI/2,TWO_PI);
//Chin
noFill();
stroke(#311F00);
strokeWeight(.5);
arc(215,317,35,15, 0, PI/1.5);
//Eyelids
noFill();
stroke(0);
strokeWeight(3);
arc(200,265,20,10,PI, TWO_PI-PI/2);
noFill();
stroke(0);
strokeWeight(3);
arc(230,265,20,10,PI, TWO_PI-PI/2);
//Hair
stroke(0);
strokeWeight(1.75);
arc(218,227.5,9,9, 0,PI/.5);
arc(215,227.5,9,9, 0,PI/.5);
arc(212,227.5,9,9, 0,PI/.5);
arc(209,227.5,9,9, 0,PI/.5);
arc(206,227.5,9,9, 0,PI/.5);
arc(203,227.5,9,9, 0,PI/.5);
arc(200,227.5,9,9, 0,PI/.5);
arc(197,228,9,9,0,PI/.5);
arc(193,229,9,9,0,PI/.5);
arc(191,230,9,9,0,PI/.5);
arc(188,230,9,9,0,PI/.5);
arc(185,230,9,9,0,PI/.5);
arc(182,230,9,9,0,PI/.5);
arc(179,230,9,9,0,PI/.5);
//Eyebrows
noFill();
stroke(0);
strokeWeight(2);
arc(200,260,25,10,PI,TWO_PI-PI/2);
arc(230,260,25,10,PI,TWO_PI-PI/2);
//Hand
fill(#f9b53d);
noStroke();
ellipse(250,435,50,50);
stroke(#FFFFFF);
strokeWeight(5);
line(220,430,240,465);
stroke(0);
line(247,422,292,392);
line(255,430,300,400);
line(264,438,308,408);





    //Lightning
        stroke(#EEFF05);
    strokeWeight(5);
    float ly = 120.0;
    float lx = 0.0;
    while (lx < 400)
    {
      float nextX = lx + 10;
      float nextY = ly + random(-5, 5);
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
    strokeWeight(1);
    
}


