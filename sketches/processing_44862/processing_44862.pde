
PFont font;
float offset = 500;
float angleA = 0.0;     // first planet angle
float angleC = 0.0;     // second planet angle
float angleB = 0.0;     // third planet angle
float angleD = 0.0;     // fourth planet angle
float angleMD = 0.0;    // fourth planet Moon angle
float angleMDD = 0.0;   // fourth planet second moon angle
float angleMA = 0.0;    // first planet moon angle
float scalarA = 90;     // first planet distance from sun
float scalarC = 140;    // second planet distance from sun
float scalarB = 180;    // third planet distance from sun
float scalarD = 270;    // fourth planet distance from sun
float scalarMD = 40;    // fourth planet moon distance
float scalarMDD = 79;   // fourth planet second moon distance
float scalarMA = 11;    // first planet moon distance
float speedA = 0.009;  // first planet speed
float speedB = 0.006;  // third planet speed
float speedC = 0.0068; // second planet speed
float speedD = 0.004;  // fourth planet speed
float speedMD = 0.03;  // fourth planet moon speed
float speedMDD = 0.013; // fourth planet second moon speed
float speedMA = 0.03;  // first planet moon speed
float angleStar = 0.0;  // star angle
float angleStarA = 0.0; // star angle (2)
float angleStarB = 0.0; // star angle (3)
float angleStarC = 0.0; // star angle (4)
float angleStarD = 0.0; // star angle (5)
float textFadeB = 0.0; // text fade
float textFadeC = 122; // text fade scale
float scalarStar = 122; // star fade scale
float speedStar = .01;  // star fade speed
float speedStarA = .012;   // star fade speed (2)
float speedStarB = .008;  // star fade speed (3)
float speedStarC = .0199; // star fade speed (4)
float speedStarD = .006;  // star fade speed (5)
float textFadeA = .01;  // text fade
int startX = -400;     // Initial x-coordinate
int stopX = 30;     // Final x-coordinate
int startY = 30;     // Initial y-coordinate
int stopY = 400;      // Final y-coordinate
float aSx = startX;    // Current x-coordinate
float aSy = startY;    // Current y-coordinate
float step = 0.005;  // Size of each step (0.0 to 1.0)
float pct = 0.0;     // Percentage traveled (0.0 to 1.0)
int offScreen = 70;
float sX = -offScreen;
float sSpeed = 0.5;
int asteroidOffScreen = 70;
float asteroidX = -asteroidOffScreen;
float asteroidXSpeed = 1;
float asteroidYSpeed = 1.5;
float asteroidY = -asteroidOffScreen;





void setup() {
  size(1000, 900); //screen size
  smooth();
  font = loadFont("Dialog-25.vlw");
  textFont(font);
}

void draw() {
  imageMode(CENTER);
  background(0);
  noStroke();
  float x = offset + cos(angleA) * scalarA;
  float y = offset + sin(angleA) * scalarA;
  float a = offset + cos(angleB) * scalarB;
  float b = offset + sin(angleB) * scalarB;
  float w = offset + cos(angleC) * scalarC;
  float z = offset + sin(angleC) * scalarC;
  float s = offset + cos(angleD) * scalarD;
  float t = offset + sin(angleD) * scalarD;
  float sm = s + cos(angleMD) * scalarMD;
  float tm = t + sin(angleMD) * scalarMD;
  float smm = s + cos(angleMDD) * scalarMDD;
  float tmm = t + sin(angleMDD) * scalarMDD;
  float xm = x + cos(angleMA) * scalarMA;
  float ym = y + sin(angleMA) * scalarMA;
  float fadeS = 122-cos(angleStar) * scalarStar;
  float fadeSA = 122-cos(angleStarA) * scalarStar;
  float fadeSB = 122-cos(angleStarB) * scalarStar;
  float fadeSC = 122-cos(angleStarC) * scalarStar;
  float fadeSD = 122-cos(angleStarD) * scalarStar;
  float textFade = 122-cos(textFadeB) * textFadeC;
  //stars
  fill(fadeS);
  angleStar += speedStar;
  ellipse(50,50,5,5); // star 1
  fill(fadeSA);
  angleStarA += speedStarA;
  ellipse(150,150,6,6); // star 2
  fill(fadeSB);
  angleStarB += speedStarB;
  ellipse(250,50,3,3); // star 3
  fill(fadeSC);
  angleStarC += speedStarC;
  ellipse(250,450,4,4); // star 4
   fill(fadeSD);
  angleStarD += speedStarD;
  ellipse(50,170,5,5); // star 5
    fill(fadeS);
  angleStar += speedStar;
  ellipse(50,650,2,2); // star 6
  fill(fadeSA);
  angleStarA += speedStarA;
  ellipse(170,450,5,5); // star 7
  fill(fadeSB);
  angleStarB += speedStarB;
  ellipse(260,850,4,4); // star 8
  fill(fadeSC);
  angleStarC += speedStarC;
  ellipse(750,80,3,3); // star 9
   fill(fadeSD);
  angleStarD += speedStarD;
  ellipse(750,770,5,5); // star 10
     fill(fadeS);
  angleStar += speedStar;
  ellipse(750,650,4,4); // star 11
   fill(fadeSA);
  angleStarA += speedStarA;
  ellipse(770,410,3,3); // star 12
  fill(fadeSB);
  angleStarB += speedStarB;
  ellipse(260,350,5,5); // star 13
  fill(fadeSC);
  angleStarC += speedStarC;
  ellipse(850,320,6,6); // star 14
   fill(fadeSD);
  angleStarD += speedStarD;
  ellipse(550,870,4,4); // star 15
  fill(fadeSB);
  angleStarB += speedStarC;
  ellipse(400,100,4,4); //star 16
  fill(fadeSD);
  angleStarD += speedStarD;
  ellipse(500,200, 5,5); //star 17
  fill(fadeSC);
  angleStarC += speedStarC;
  ellipse(79, 790, 3,3);
  fill(fadeSB);
  angleStarB += speedStarA;
  ellipse(100, 850, 2,2);
  fill(fadeSA);
  angleStarA += speedStarD;
  
  //end stars
  //planet 1 or known as earthy
     PImage earthy; //earthy image 
    earthy = loadImage("Earthy planet.jpg"); //earthy image
    image(earthy, x, y); // earthy image
    angleA += speedA;
    fill(100);
    ellipse( xm, ym, 5, 5); //planet 1 moon
    angleMA += speedMA;
  //planet 1 end
  //sun
    PImage sun; //sun image
    sun = loadImage("Sunv1.jpg"); //sun image
    image(sun, 500, 500); // sun image
  //sun end
  //Greeny / planet 3 
    PImage greeny; //greeny image
    greeny = loadImage("Green planet.jpg"); //greeny image
    image(greeny, a,b);
    angleB += speedB;
  //end greeny / planet 3
  //browny / planet 2
    PImage browny; // brown planet
     browny = loadImage("Brown planet.jpg");
    image(browny, w,z);
    angleC += speedC;
  //end browny
  //red planet or planet 4
    PImage redy; //red image
    redy = loadImage("Red planet.jpg");
    image(redy, s,t);
    angleD += speedD;
    fill(100);
    ellipse(sm, tm, 5,5); // Planet 4 Moon
    angleMD += speedMD;
    fill(130);
    ellipse(smm, tmm, 6, 6); //planet 4 moon 2
    angleMDD += speedMDD;
  //end red planet or planet 4
  
    
  if (mousePressed == true) {
    textSize(36);
    fill(textFade);
  text("Space...", 25, 60);
  textFadeB += textFadeA;
  }
  if (keyPressed == true) {
    textSize(33);
    fill(textFade);
    text("The Final Frontier...", 300, 100);
    textFadeB += textFadeA;
  }
   sX += sSpeed;  
  if (sX > width+offScreen) { 
    sX = -offScreen;  
  }
  PImage ship; //ship image
    ship = loadImage("Ship.jpg");
    image(ship, sX,150);
    
    asteroidX += asteroidXSpeed; // increase
    asteroidY += asteroidYSpeed;
    if (asteroidX > 1800) {
      asteroidX = -asteroidOffScreen;
    }
    fill(150,20,20);
    ellipse(asteroidX, asteroidY, 10,10);
}

