
PImage biebz;
PImage miley;
PImage minaj;
PImage boob1;
PImage boob2;
PImage boob3;
PImage boob4;
boolean MouseClicked = false;
int selected = 0;

void setup()
{
  size(1200, 720);
  biebz = loadImage("justinbieber.jpg");
  miley = loadImage("MileyCyrus.jpg");
  minaj = loadImage("NickiMinaj.jpg");
  boob1 = loadImage("boob1.png");
  boob2 = loadImage("boob2.png");
  boob3 = loadImage("boob3.png");
  boob4 = loadImage("boob4.png");
}

void draw()
{
  if(selected==0)
    Biebz();
  else if(selected ==1)
    Minaj();
  else
    Miley();
  

}

void mouseClicked()
{
   selected=(selected+1)%3; 
}

void Miley()
{
  float xPos;
  float yPos;
  xPos = random((mouseY/3)/90);
  yPos = random((mouseY/3)/90);
  
  image(miley, 0, 0);
  
   //pussy
  fill(254, 206, 131);
  noStroke();
  ellipse(550, 850, 400, 600);
  ellipse(750, 850, 400, 600);
  fill(242, 164, 164);
  stroke(129, 41, 41);
  strokeWeight(5);
  ellipse(650, 680, 60, 150);
  
  noStroke();
  fill(142, 30, 30);
  quad(635, 710, 670, 710, 660, 620, 640, 620);
  
  strokeWeight(10);
  stroke(193, 105, 105);
  noFill();
  ellipse(650, 680, 30, 130);
  
  //Tongue <3
  strokeWeight(2);
  stroke(0);
  fill(243, 115, 120);
  bezier(620, 490, mouseX-15, mouseY, mouseX+15, mouseY, 720, 490);
  
  fill(142, 30, 30);
  noStroke();
  quad(642, 655, 658, 655, 660, 710, 640, 710);
  fill(214, 91, 91);
  noStroke();
  //ellipse(650, 710, 40, 40);
  ellipse(650+xPos, 710+yPos, 40, 40);
}

void Biebz()
{
   //movingDICK
  image(biebz, 0, 0);
  strokeWeight(68);
  stroke(255, 201, 147);
  line(500, 265, mouseX, mouseY);
  strokeWeight(1);
  stroke(0);
  fill(255, 201, 147);
  ellipse(mouseX+30, mouseY+30, 80, 80);
  ellipse(mouseX-10, mouseY-10, 80, 80);
}

void Minaj()
{
    image(minaj, 0, 0);
  image(boob2, 0, 0);
  image(boob1, 0, 0);
  image(boob4, 50, 0);
  image(boob3, 50, 0);
 
  
  float xPos;
  float yPos;
  float xPos2;
  float yPos2;
  
      xPos = random(mouseX/40);
      yPos = random(mouseX/40);
      xPos2 = random(mouseX/40);
      yPos2 = random(mouseX/40);

      image(boob2, xPos2, yPos2);
      image(boob1, xPos, yPos); 
      image(boob4, xPos2, yPos2);
      image(boob3, xPos, yPos);
}



