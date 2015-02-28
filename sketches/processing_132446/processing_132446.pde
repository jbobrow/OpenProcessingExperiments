
//Movement variables for objects going off screen or approaching edges
 int x = 15;
 int y = 320;
 int x1 = 30;
 int x2 = 10;
 int x3 = 20;
 int y2 = 460;
 
 float r1;
 
 
 float r2;
 float s1;
 float Q;
 
 

PImage veg ; //nickname
PFont power; //nickname




void setup() {
 
power = loadFont("OCRAStd-48.vlw");
textFont(power, 38);


size(100, 100);
veg = loadImage("dbz.jpeg");
  
  //canvas size
  size(800, 500) ; 
}

void draw() {
  
  background(#08E4FF);
  
  
  
  //crater
  //ellipse(400, 350, 30, 50);
 
 fill(#00C415);
 rect(0, y, width, 400);
 y = y + 2;
 if (y > 324) {
   y = 320;
 }
  
 
 
  //Floating rocks
 
 //random y-coords for rock spawning
 r1 = random(0, 500);
 
 //random x-coords for rock spawning
r2 = random(0, width); 

//random dimensions for rocks
s1 = random (2, 25);

//random speed for rock movement
Q = random(1, 5); 
 
  // clouds
  
  fill(255);
  ellipse(x, 80, 160, 80);
  x = x + 4;
  if (x > 900) {
    x = 0;
  }
  
  ellipse(x1, 115, 80, 40);
  x1 = x1 + 1;
  if (x1 > 900) {
    x1 = 0;
    
  }
  
  ellipse(x2, 160, 100, 45);
  x2 = x2 + 2;
  if (x2 > 850) {
    x = 0;
    
  }
  
  ellipse(x3, 30, 120, 60);
  x3 = x3 + 3;
  if (x3 > 900) {
    x3 = 0;
    
  }
  
  
  
  
   //rocks behind ninja
   fill(#6C482F);
   rect(r2, r1, s1, s1);
   r1 = r1 - Q/10;
   if (r1 < 0) {
     r1 = 500;
   }
   
 tint(255, 127);
 image(veg, 500, 50, 300, 250);
 //Creature's bod
 fill(#000000);
 quad(380, 320, 360, 200, 440, 200, 420, 320); //main body
 

  
  
  //Creature's head!
   
   fill(#434342);
   ellipse(400, 155, 100, 100) ; //head shape
  
  
  //mask
  fill(#000000);
  arc(400, 158, 100, 92, 0, PI-0);
  arc(400, 138, 90, 70, 0-PI, 0);
  
  //eyes
  
 fill(#FFF700);
  quad(360, 140, 360, 155, 398, 152, 398, 147); //left eye
  quad(402, 152, 402, 147, 440, 140, 440, 155); //right eye
  
 
  
  //"rayman" hands (with power up)
 
 
 fill(#434342);
 ellipse(450, 285, 25, 25);
 
 
 
 fill(#434342);
 ellipse(450, 260, 25, 25);
 
 fill(#FFEA00, 160);
 ellipse(450, 260, 140, 140);
 noStroke();
 fill(255, 180);
 ellipse(450, 260, 45, 45);
 fill(#FF6600, 100);
 ellipse(450, 260, 150, 150);
  //rayman feet
  fill(#000000);
  rect(375, 330, 22, 20, 80, 0, 0, 80);
  rect(405, 330, 22, 20, 0, 80, 80, 0);
  
  
  text("His power level...", 20, 420);
  text("...IT'S OVER 9000!!!", 200, 460);
    
  
  
  
  
  
  println(mouseX + "," + mouseY);
}




