
PImage sunnybg; // SUNNY BG
PImage bg2; // Sky
PImage nightbg; // night
PImage wallpaper2; // Wallpaper
PImage drop2; // Small rain drop
PImage drop3; // Big rain drop
PImage snow; // snow
PImage scarf; // scarf
PImage hat; // hat
PImage girl3; // Girl SUNNY
PImage cloud1; // left cloud
PImage cloud2; // Big cloud
PImage cloud3; // Small cloud
PImage suntn; // Small cloud
PImage cloudtn; // Small cloud
PImage startn; // Small cloud

PFont font;

float c1;
float c2;
float c3;

/////// WHERE THE RAINDROPS START
float x = 50.0; // Initial x-coordinate
float y = 5.0; // Initial y-coordinate
float x2 = 50.0; // Initial x2-coordinate
float y2 = 5.0; // Initial y2-coordinate
float x3 = 50.0; // Initial x3-coordinate
float y3 = 0.0; // Initial y3-coordinate
float x4 = 50.0; // Initial x3-coordinate
float y4 = 0.0; // Initial y3-coordinate

float targetX = 50.0; // Destination x-coordinate
float targetY = 400.0; // Destination y-coordinate

float easing = 0.01; // Size of each step along the path
float easing2 = 0.02; // Size of each step along the path
float easing3 = 0.03; // Size of each step along the path
float easing4 = 0.04; // Size of each step along the path


void setup() {
  size(520, 400);
  noStroke();
  smooth();
  font = loadFont("OratorStd-16.vlw");

////// LOADING IMAGES ///////
  sunnybg = loadImage("sunny.jpg");
  bg2 = loadImage("bg2.png"); // sky
  nightbg = loadImage("night.png");
  wallpaper2 = loadImage("wallpaper2.jpg"); // wallpaper
  drop2 = loadImage("drop2.png"); // small droplet
  drop3 = loadImage("drop3.png"); // big droplet
   snow = loadImage("snow.png"); // big droplet
  scarf = loadImage("scarf.png"); // scarf
  hat = loadImage("hat.png"); // hat
  girl3 = loadImage("girl3.png"); // girl SUNNY
  cloud1 = loadImage("cloud1.png"); // left cloud
  cloud2 = loadImage("cloud2.png"); // big cloud
  cloud3 = loadImage("cloud3.png"); // small cloud
  suntn = loadImage("suntn.png"); // small cloud
  cloudtn = loadImage("cloudtn.png"); // small cloud
  startn = loadImage("startn.png"); // small cloud
}


void draw()
{
  
  
  
 //////// SUNNY TEST !!!!!!!! 
  // if (mouseButton == LEFT) {
  //  background(0);
 // }
 // else {
   
    if ((mouseX > 440) && (mouseX < 480) && (mouseY > 30) && (mouseY < 70)) {
   image(sunnybg,0,0);
    }
    
    else if ((mouseX > 440) && (mouseX < 480) && (mouseY > 100) && (mouseY < 140)) {
   image(bg2,0,0);
  
    }
    
    else if  ((mouseX > 440) && (mouseX < 480) && (mouseY > 170) && (mouseY < 210)) {
    image(nightbg,0,0);
    
    } else {
      background(255); 
      
    }
    
//     if ((mouseX > 430) && (mouseX < 460) && (mouseY > 110) && (mouseY < 170)) {
  // image(bg2,0,0);
    //} else {
      //background(255); 
   // }
    
  // image(bg2, 0, 0); // <--- outside sky
  //noTint();
  //}
  
  
  float d = dist(x, y, targetX, targetY);


  /////////////////////////// RAINDROPS ///////////////////////
 
 
  
// TEST  
if (mousePressed) {
  if (mouseButton == LEFT) {
    
    if (d > 1.0) {
    x += (targetX - x) * easing;
    y += (targetY - y) * easing;
  }
  
 // 1st rain drops
  image(drop2, x, y); // small droplet
  image(drop2, x + 200, y - 20); // small droplet
  image(drop2, x + 320, y); // small droplet
   image(drop3, x + 300, y - 50); // big droplet
  noTint();

  // Return motion 
  if (y > 370)
  {
    y = 0.0;
  }
  
 //// REPLACE HEREKEFKSFNKJSDNFJDNKJDFNG //
  
   // 2nd rain drops

  d = dist(x2, y2, targetX, targetY);
  if (d > 1.0) {
    x2 += (targetX - x2) * easing2;
    y2 += (targetY - y2) * easing2;
  }
  image(drop3, x2 + 20, y2); // big droplet
  image(drop2, x2 + 100, y2); // small droplet
  image(drop3, x2 + 250, y2); // big droplet
  noTint();

  // Return motion 2
  if (y2 > 350)
  {
    y2 = 0.0;
  }

  // 3rd rain drops
  d = dist(x3, y3, targetX, targetY);
  if (d > 1.0) {
    x3 += (targetX - x3 ) * easing3;
    y3 += (targetY - y3 ) * easing3 ;
  }
  image(drop2, x3 + 200, y3); // small droplet
  image(drop2, x3 + 50, y3 - 100); // small droplet
  noTint();

  // Return motion 3
  if (y3 > 390)
  {
    y3 = 0.0;
  }

// 4th rain drops

  d = dist(x4, y4, targetX, targetY);
  if (d > 1.0) {
    x4 += (targetX - x4) * easing2;
    y4 += (targetY - y4) * easing2;
  }
  image(drop2, x2 + 90, y4 + 50); // small droplet
  noTint();
  image(drop3, x2 + 250, y4 - 100); // big droplet
  noTint();

  // Return motion 4
  if (y4 > 390)
  {
    y4 = 0.0;
  }
  
  }
  }
  
  
   /////////////////////////// SNOW ///////////////////////
 
 
  
// TEST  
if (mousePressed) {
  if (mouseButton == RIGHT) {
    
    if (d > 1.0) {
    x += (targetX - x) * easing;
    y += (targetY - y) * easing;
  }
  
 // 1st rain drops
  image(snow, x, y); // small droplet
  image(snow, x + 200, y - 20); // small droplet
  image(snow, x + 320, y); // small droplet
   image(snow, x + 300, y - 50); // big droplet
  noTint();

  // Return motion 
  if (y > 370)
  {
    y = 0.0;
  }
  
 //// REPLACE HEREKEFKSFNKJSDNFJDNKJDFNG //
  
   // 2nd rain drops

  d = dist(x2, y2, targetX, targetY);
  if (d > 1.0) {
    x2 += (targetX - x2) * easing2;
    y2 += (targetY - y2) * easing2;
  }
  image(snow, x2 + 20, y2); // big droplet
  image(snow, x2 + 100, y2); // small droplet
  image(snow, x2 + 250, y2); // big droplet
  noTint();

  // Return motion 2
  if (y2 > 350)
  {
    y2 = 0.0;
  }

  // 3rd rain drops
  d = dist(x3, y3, targetX, targetY);
  if (d > 1.0) {
    x3 += (targetX - x3 ) * easing3;
    y3 += (targetY - y3 ) * easing3 ;
  }
  image(snow, x3 + 200, y3); // small droplet
  image(snow, x3 + 50, y3 - 100); // small droplet
  noTint();

  // Return motion 3
  if (y3 > 390)
  {
    y3 = 0.0;
  }

// 4th rain drops

  d = dist(x4, y4, targetX, targetY);
  if (d > 1.0) {
    x4 += (targetX - x4) * easing2;
    y4 += (targetY - y4) * easing2;
  }
  image(snow, x2 + 90, y4 + 50); // small droplet
  noTint();
  image(snow, x2 + 250, y4 - 100); // big droplet
  noTint();

  // Return motion 4
  if (y4 > 390)
  {
    y4 = 0.0;
  }
  
  }
  }
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///////////////////////// CLOUDS ///////////////////////////

c1 += 0.1; // Slow
if (c1 > width - 100)
{
  c1 = -width;
}
image(cloud1, c1 , 0); // Left cloud

c2 += 0.2; // Normal
if (c2 > width - 50)
{
  c2 = -width;
}

image(cloud2, c2 +100, -10); // Big cloud

c3 += 0.5; // Fast
if (c3 > width)
{
  c3 = -width;
}

image(cloud3, c3 +120, 20); // Small cloud

  

////////////////////////// WINDOW ///////////////////////////
  
  fill (70, 61, 55); // Brown
  rect (0, 0, 400, 15); // Top window
  rect (0, 0, 15, 330); // Left window
  rect (0, 320, 400, 15); // Bottom window
  rect (385, 0, 15, 330); // Right window
  rect (0, 175, 400, 10); // Middle

  // Wallpaper
  image(wallpaper2, 0, 335);

  ////////////////////// CURTAIN (LEFT) ////////////////////////
 
  // Left curtain top
  fill (86, 148, 170); // Light Blue
  beginShape (); 
  vertex (0, 0); 
  bezierVertex (0, 0, 0, 0, 60, 0); 
  bezierVertex (100, 15, 50, 190, 30, 240);
  endShape ();

  // Left curtain bottom
  fill (86, 148, 170); // Light blue
  beginShape (); 
  vertex (70, 400); 
  bezierVertex (80, 340, 20, 280, 30, 250);
  bezierVertex (0, 0, 50, 280, 0, 400);
  endShape ();
  
  rect (0, 0, 30, 400);

  // Left curtain tie
  fill (77, 77, 77); // Grey
  rect (0, 242, 30, 20);
  ellipse (27, 252, 20, 20);

  // Left curtain polka dots
  fill (63, 139, 165); // Dark blue
  ellipse (20, 20, 25, 25);
  ellipse (20, 80, 15, 15);
  ellipse (60, 50, 25, 25);
  ellipse (50, 120, 15, 15);
  ellipse (10, 150, 25, 25);
  ellipse (25, 200, 15, 15);
  ellipse (10, 290, 25, 25);
  ellipse (35, 340, 15, 15);
  ellipse (10, 390, 25, 25);

  //////////////////// CURTAIN (RIGHT) ////////////////////////

  // Right curtain top
  fill (86, 148, 170); // Light Blue
  beginShape (); 
  vertex (400, 0); 
  bezierVertex (400, 0, 400, 0, 340, 0); 
  bezierVertex (300, 15, 350, 190, 370, 240);
  endShape ();

  // Right curtain bottom
  fill (86, 148, 170); // Light blue
  beginShape (); 
  vertex (330, 400); 
  bezierVertex (320, 340, 380, 280, 370, 250);
  bezierVertex (400, 0, 530, 280, 400, 400);
  endShape ();
  
  rect (370, 0, 30, 400);

  // right curtain tie
  fill (77, 77, 77); // Grey
  rect (370, 242, 30, 20);
  ellipse (372, 252, 20, 20);

  // Right curtain polka dots
  fill (63, 139, 165); // Dark blue
  ellipse (380, 20, 25, 25);
  ellipse (380, 80, 15, 15);
  ellipse (340, 50, 25, 25);
  ellipse (350, 120, 15, 15);
  ellipse (390, 150, 25, 25);
  ellipse (375, 200, 15, 15);
  ellipse (390, 290, 25, 25);
  ellipse (365, 340, 15, 15);
  ellipse (390, 390, 25, 25);
   image(girl3,0,0);
   
    
    if ((mouseX > 440) && (mouseX < 480) && (mouseY > 100) && (mouseY < 140)) {
   image(scarf, 0, 0); // scarf
    }
     else if  ((mouseX > 440) && (mouseX < 480) && (mouseY > 170) && (mouseY < 210)) {
      image(hat, 0, 0); // hat
     }

//////// RECTANGLE /////////
fill (220);

  rect (400, 0, 150, 400);
  
  image(suntn,440,30);
  
    image(cloudtn,440,100);
    image(startn,440,170);
  
  
  
   
  
  
 
 fill (0);
 textSize(12);
 text("INSTRUCTIONS", 415, 245);
 
  fill (80);
 textSize(11);
  text("Hover mouse over", 408, 265);
   text("icons to change the ", 408, 280);
    text(" weather or time of", 408, 295);
     text("day", 408, 310);
  text("Hold the left mouse", 408, 335);
    text("button for rain", 408, 350);
    text("Hold right mouse", 408, 365);
     text("button for snow", 408, 380);
 
}








