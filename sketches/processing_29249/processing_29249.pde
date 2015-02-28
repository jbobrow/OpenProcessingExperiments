
int vel = 3 ; // as in velocity

String[] spells = {
  "expelliarmus", "avada kedavra", "peanut butter",
};

int myIndex = int(random(2)) ;

PImage b;
PFont fontA;

int y = 440;
int x = 0 ;


void setup ()
{
  smooth();
  noStroke();
  size(800, 450);
  background(208, 224, 215);




  fontA = loadFont("Lumos-48.vlw");
  textFont(fontA, 32);




 

  b = loadImage("battle.gif");
}

void draw() {
  background(208, 224, 215);
   //ltgrnmountains

  fill(167, 211, 160);
  ellipse( 350, 120, 200, 200);
  ellipse( 400, 150, 200, 200);


  ellipse(250, 55, 300, 80);
  ellipse(260, 60, 300, 80);
  ellipse(290, 75, 300, 80);
  ellipse(330, 95, 300, 80);
  ellipse(350, 115, 300, 80);
  ellipse(380, 135, 300, 80);
  ellipse(400, 155, 300, 80);
  ellipse(420, 175, 300, 80);

  //grnmountains
  fill(135, 188, 127);
  ellipse( 270, 100, 200, 200);
  ellipse( 320, 150, 200, 200);


  ellipse(170, 55, 300, 80);
  ellipse(180, 60, 300, 80);
  ellipse(210, 75, 300, 80);
  ellipse(240, 95, 300, 80);
  ellipse(270, 115, 300, 80);
  ellipse(300, 135, 300, 80);
  ellipse(320, 155, 300, 80);
  ellipse(340, 175, 300, 80);

  //drkgrnmountains
  fill(52, 80, 48);
  ellipse(40, 30, 300, 80);
  ellipse(70, 40, 300, 80);
  ellipse(100, 55, 300, 80);
  ellipse(110, 60, 300, 80);
  ellipse(140, 75, 300, 80);
  ellipse(170, 95, 300, 80);
  ellipse(200, 115, 300, 80);
  ellipse(230, 135, 300, 80);
  ellipse(250, 155, 300, 80);
  ellipse(270, 175, 300, 80);
  rect(110, 175, 300, 150);



  ellipse(15, 95, 300, 80);

  //blkmountains
  fill(12);
  ellipse(0, 225, 200, 450);
  ellipse(0, 255, 355, 250);
  ellipse(10, 130, 200, 200);
  ellipse(0, 305, 400, 250);
  ellipse(0, 120, 300, 80);
  ellipse(10, 130, 300, 80);
  ellipse(30, 160, 300, 80);
  ellipse(45, 180, 300, 80);
  ellipse(70, 200, 300, 80);
  ellipse(85, 210, 300, 80);
  ellipse(110, 230, 300, 80);
  ellipse(130, 250, 300, 80);
  ellipse(150, 270, 300, 80);
  ellipse(160, 290, 300, 80);


  //sidewalk and grass
  fill(80, 124, 100);
  quad(0, 450, 650, 450, 800, 140, 480, 140);

  fill(230);
  quad(20, 450, 200, 450, 650, 100, 640, 100);
  quad(650, 450, 830, 450, 800, 140, 800, 140);

  //other castle
  fill(69, 65, 90);
  triangle(660, 80, 710, 30, 770, 80);
  rect(560, 80, 60, 60);

  //Castle
  fill(156, 150, 183);
  rect(565, 85, 50, 55);
  rect(530, 30, 30, 80);
  rect(520, 60, 40, 80);
  rect(530, 25, 5, 5);
  rect(555, 25, 5, 5);
  triangle(560, 80, 590, 15, 620, 80);
  rect(620, 0, 40, 140);
  rect(660, 80, 150, 60);
  rect(680, 60, 20, 20);
  rect(720, 60, 20, 20);
  rect(770, 30, 30, 80);
  rect(770, 25, 5, 5);
  rect(795, 25, 5, 5);

  //fence
  quad(80, 225, 100, 230, 520, 80, 520, 80);
  rect(80, 225, 25, 180);
  rect(150, 203, 20, 160);
  rect(220, 181, 15, 140);
  rect(290, 157, 10, 120);
  rect(360, 133, 5, 100);
  rect(420, 114, 4, 80);
  rect(466, 97, 3, 70);
  rect(500, 87, 2, 60);

  //windows
  fill(69, 65, 90);
  rect(534, 35, 10, 10);
  rect(547, 35, 10, 10);
  rect(525, 65, 10, 60);
  rect(545, 65, 10, 60);
  rect(625, 0, 8, 80);
  rect(637, 0, 8, 80);
  rect(649, 0, 8, 80);

  rect(628, 100, 10, 10);
  rect(642, 100, 10, 10);
  rect(656, 100, 10, 10);
  rect(670, 100, 10, 10);
  rect(684, 100, 10, 10);
  rect(698, 100, 10, 10);
  rect(712, 100, 10, 10);
  rect(726, 100, 10, 10);
  rect(740, 100, 10, 10);
  rect(754, 100, 10, 10);
  rect(768, 100, 10, 10);
  rect(782, 100, 10, 10);
  rect(796, 100, 10, 10);
  rect(775, 35, 10, 10);
  rect(788, 35, 10, 10);
  //door
  fill(0);
  rect(572.5, 100, 35, 40);
  // Use fill() to change the value or color of the text

frameRate(1);
  myIndex = int(random(2));

  if (random(2)>1) {
    fill(245, 141, 141);
  } 
  else {
    fill(141, 245, 141);
  }

  textFont(fontA, random(64));
  text(spells[myIndex], random(width), random(height));

  smooth(); 
  noStroke();
  fill(255);

frameRate(20) ;
    image(b, 230 + vel, 190);
    vel = -vel ;

frameRate(10) ;
  textFont(fontA, 48);
  fill(90);
  text("Lord Voldemort", x, y);

  fill(100);
  text("vs.", x+400, y);
  
  fill(90);
  text("Harry Potter", x+470, y);
  //y= y + 50;
      x= x - 40;
      if(x<-800){
        x=800;
      }
  if(y>height){
    y=0;

  }
  


}




