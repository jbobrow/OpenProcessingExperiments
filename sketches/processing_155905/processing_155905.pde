
float sunX;
float sunY;
float moonGlowSizeX;
float moonGlowAlpha;
float rippleWidth;
float rippleWidthAlt;

int cloudACenterX;
int cloudACenterY;
int cloudBCenterX;
int cloudBCenterY;
int cloudCCenterX;
int cloudCCenterY;

float rayX;
float rayY;


void setup() {
  size (1200, 600);
}

void draw() {

  background (220, 240, 255);



  noStroke();

  //70+sin(frameCount * 0.2) * 60

  //sunrays

  rayX = rayX + 10;
  rayY = rayY + 7;


  fill(255, 255, 255, 80+sin(frameCount * 0.2) * 15);
  triangle((rayX-50) % 1250, 0, rayX % 1250, 0, sunX, sunY);
  triangle((rayX+150) % 1250, 0, (rayX+200) % 1250, 0, sunX, sunY);
  triangle((rayX+350) % 1250, 0, (rayX+400) % 1250, 0, sunX, sunY);
  triangle((rayX+550) % 1250, 0, (rayX+650) % 1250, 0, sunX, sunY);
  triangle((rayX+750) % 1250, 0, (rayX+800) % 1250, 0, sunX, sunY);
  triangle((rayX+950) % 1250, 0, (rayX+1050) % 1250, 0, sunX, sunY);
  triangle(1200, (rayY-50) % 650, 1200, rayY % 650, sunX, sunY);
  triangle(1200, (rayY+150) % 650, 1200, (rayY+200) % 650, sunX, sunY);
  triangle(1200, (rayY+350) % 650, 1200, (rayY+400) % 650, sunX, sunY);
  triangle(abs(1200-rayX % 1250), 600, abs(1250-rayX % 1250), 600, sunX, sunY);
  triangle(abs(1000-rayX % 1250), 600, abs(1050-rayX % 1250), 600, sunX, sunY);
  triangle(abs(800-rayX % 1250), 600, abs(850-rayX % 1250), 600, sunX, sunY);
  triangle(abs(600-rayX % 1250), 600, abs(650-rayX % 1250), 600, sunX, sunY);
  triangle(abs(400-rayX % 1250), 600, abs(450-rayX % 1250), 600, sunX, sunY);
  triangle(abs(200-rayX % 1250), 600, abs(200-rayX % 1250), 600, sunX, sunY);
  triangle(0, abs(600-rayY % 650), 0, abs(650-rayY % 650), sunX, sunY);
  triangle(0, abs(400-rayY % 650), 0, abs(450-rayY % 650), sunX, sunY);
  triangle(0, abs(200-rayY % 650), 0, abs(250-rayY % 650), sunX, sunY);

  //sky

  fill (0, 60, 120, sunY - 20);
  rect(0, 0, 1200, 600);

  //sun position varibles
  sunX = 600 + sin(frameCount*.01)*500;
  sunY = 300 + cos(frameCount*.01)*300;

  // white sun
  fill(255);
  ellipse(sunX, sunY, 120, 120);

  // red sun
  fill(255, 0, 0, sunY - 20);
  ellipse(sunX, sunY, 120, 120);

  // yellow sun
  fill(255, 255, 0, 50);
  ellipse(sunX, sunY, 120, 120);

  /*
// mountains  
   fill(170,80,0,abs(sunY+100));
   triangle(900,300,970,260,1000,300);
   triangle(930,300,1030,240,1080,300);
   */

  //moon

  moonGlowSizeX = (moonGlowSizeX + 1) % 60;
  moonGlowAlpha = map(moonGlowSizeX, 0, 60, 80, -10);

  //glow
  fill(255, moonGlowAlpha);
  ellipse(1200-(sunX-5), 600-sunY, 90 + moonGlowSizeX, 90 + moonGlowSizeX);

  fill(180);
  ellipse(1200-(sunX-5), 600-sunY, 90, 90);

  fill(255, 255, 255);
  ellipse(1200-sunX, 600-sunY, 80, 80);

  //craters
  fill(225);
  ellipse(1200-(sunX+15), 600-(sunY+12), 20, 20);
  ellipse(1200-(sunX-15), 600-(sunY+8), 17, 17);
  ellipse(1200-(sunX+10), 600-(sunY-17), 8, 8);

  // clouds

  cloudACenterX = 200;
  cloudACenterY = 200;
  cloudBCenterX = 700;
  cloudBCenterY = 130;
  cloudCCenterX = 1100;
  cloudCCenterY = 220;


  //cloudA

  fill(abs(sunY-255), abs(sunY-255), (abs(sunY-255)+80));
  ellipse(cloudACenterX-75, cloudACenterY, 40, 40);
  ellipse(cloudACenterX-13, cloudACenterY, 35, 35);
  ellipse(cloudACenterX-45, cloudACenterY-5, 55, 55);
  ellipse(cloudACenterX, cloudACenterY, 30, 30);
  ellipse(cloudACenterX+22, cloudACenterY-5, 50, 50);
  ellipse(cloudACenterX+50, cloudACenterY-15, 65, 65);
  ellipse(cloudACenterX+75, cloudACenterY-10, 45, 45);
  ellipse(cloudACenterX+100, cloudACenterY-5, 30, 30);

  //cloudB

  fill(abs(sunY-255), abs(sunY-255), (abs(sunY-255)+80));
  ellipse(cloudBCenterX-75, cloudBCenterY, 40, 40);
  ellipse(cloudBCenterX-13, cloudBCenterY, 35, 35);
  ellipse(cloudBCenterX-45, cloudBCenterY-5, 55, 55);
  ellipse(cloudBCenterX, cloudBCenterY, 30, 30);
  ellipse(cloudBCenterX+22, cloudBCenterY-5, 50, 50);
  ellipse(cloudBCenterX+50, cloudBCenterY-15, 65, 65);
  ellipse(cloudBCenterX+75, cloudBCenterY-10, 45, 45);
  ellipse(cloudBCenterX+100, cloudBCenterY-5, 30, 30);


  //cloudC

  fill(abs(sunY-255), abs(sunY-255), (abs(sunY-255)+80));
  ellipse(cloudCCenterX-75, cloudCCenterY, 40, 40);
  ellipse(cloudCCenterX-13, cloudCCenterY, 35, 35);
  ellipse(cloudCCenterX-45, cloudCCenterY-5, 55, 55);
  ellipse(cloudCCenterX, cloudCCenterY, 30, 30);
  ellipse(cloudCCenterX+22, cloudCCenterY-5, 50, 50);
  ellipse(cloudCCenterX+50, cloudCCenterY-15, 65, 65);
  ellipse(cloudCCenterX+75, cloudCCenterY-10, 45, 45);
  ellipse(cloudCCenterX+100, cloudCCenterY-5, 30, 30);

  // clouds
  /* fill(abs(sunY-255), abs(sunY-255), (abs(sunY-255)+80));
   ellipse(625, 130, 40, 40);
   ellipse(687, 130, 35, 35);
   ellipse(655, 125, 55, 55);
   ellipse(700, 130, 30, 30);
   ellipse(722, 125, 50, 50);
   ellipse(750, 115, 65, 65);
   ellipse(775, 120, 45, 45);
   ellipse(800, 125, 30, 30); 
   
   // clouds
   fill(abs(sunY-255), abs(sunY-255), (abs(sunY-255)+80));
   ellipse(1025, 220, 40, 40);
   ellipse(1087, 220, 35, 35);
   ellipse(1055, 215, 55, 55);
   ellipse(1100, 220, 30, 30);
   ellipse(1122, 215, 50, 50);
   ellipse(1150, 205, 65, 65);
   ellipse(1175, 210, 45, 45);
   ellipse(1200, 215, 30, 30); */



  /*     // cloud blue
   fill(0, 0, 80, (sunY*2));
   ellipse(125,200,40,40);
   ellipse(187,200,35,35);
   ellipse(155,195,55,55);
   ellipse(200,200,30,30);
   ellipse(222,195,50,50);
   ellipse(250,185,65,65);
   ellipse(275,190,45,45);
   ellipse(300,195,30,30);
   */

  // clouds
  /* fill(255, abs(sunY-100));
   ellipse(125,200,40,40);
   ellipse(187,200,35,35);
   ellipse(155,195,55,55);
   ellipse(200,200,30,30);
   ellipse(222,195,50,50);
   ellipse(250,185,65,65);
   ellipse(275,190,45,45);
   ellipse(300,195,30,30);
   */



  // Water
  fill(0, 0, 180);
  rect(0, 300, 1200, 600);

  // sun reflection

  // white
  fill(255);
  ellipse(sunX, 350, 120, 25);

  // red sun
  fill(255, 0, 0, sunY);
  ellipse(sunX, 350, 120, 25);

  // yellow sun
  fill(255, 255, 0, 60+sin(frameCount * 0.2) * 40);
  ellipse(sunX, 350, 120, 25);

  //reflection 2
  // white
  fill(255);
  ellipse(sunX, 370, 90, 20);

  // red sun
  fill(255, 0, 0, sunY);
  ellipse(sunX, 370, 90, 20);

  // yellow sun
  fill(255, 255, 0, 60+sin((frameCount+8) * 0.2) * 40);
  ellipse(sunX, 370, 90, 20);

  //reflection 3
  // white
  fill(255);
  ellipse(sunX, 400, 75, 17);

  // red sun
  fill(255, 0, 0, sunY);
  ellipse(sunX, 400, 75, 17);

  // yellow sun
  fill(255, 255, 0, 60+sin((frameCount+20) * 0.2) * 40);
  ellipse(sunX, 400, 75, 17);


  // Water alpha
  fill(0, 0, 80, sunY);
  rect(0, 300, 1200, 600);

  rippleWidth = 70+sin(frameCount*.15) * 30;
  rippleWidthAlt = 50;

  // watery stuff
  fill(0, 0, 230, 60+sin((frameCount+16) * 0.2) * 40);
  ellipse(500, 330, rippleWidth, 8);
  ellipse(200, 325, rippleWidth, 8);
  ellipse(320, 320, (rippleWidthAlt++) % 80, 8);
  ellipse(410, 322, rippleWidth, 8);
  ellipse(900, 330, rippleWidth, 8);
  ellipse(840, 325, (rippleWidthAlt++) % 80, 8);
  ellipse(1017, 320, 60, 8);
  ellipse(734, 322, 60, 8);

  fill(0, 0, 230, 60+sin((frameCount+8) * 0.2) * 40);
  ellipse(234, 320, rippleWidth, 8);
  ellipse(654, 317, (rippleWidthAlt++) % 80, 8);
  ellipse(450, 319, rippleWidth, 8);
  ellipse(800, 314, 60, 8);
  ellipse(760, 323, rippleWidth, 8);
  ellipse(1110, 308, (rippleWidthAlt++) % 80, 8);
  ellipse(690, 312, rippleWidth, 8);
  ellipse(130, 320, (rippleWidthAlt++) % 80, 8);
  ellipse(545, 318, (rippleWidthAlt++) % 80, 8);
  
  
    println("Sunray bottom value is " + (abs(1200-rayX % 1250)));

  if (keyPressed) {
    if (key == 's') {
      saveFrame();
    }
  }


}



