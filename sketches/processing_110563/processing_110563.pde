
float x = 100, y = 100;
float xSpeed = random(2, 4);
float ySpeed = random(2, 4);
int player1=0;

float brickX = 50, brickY=30;
float brickX2 = 220, brickY2=30;
float brickX3 = 85, brickY3=30;
float brickX4 = 185,brickY4=30;

float brickX5 = 35,brickY5=42;
float brickX6 = 70,brickY6=42;
float brickX7 = 105,brickY7=42;
float brickX8 = 165,brickY8=42;
float brickX9 = 200,brickY9=42;
float brickX10 = 235,brickY10=42;

float brickX11 = 15,brickY11=54;
float brickX12 = 50,brickY12=54;
float brickX13 = 85,brickY13=54;
float brickX14 = 120,brickY14=54;
float brickX15 = 150,brickY15=54;
float brickX16 = 185,brickY16=54;
float brickX17 = 220,brickY17=54;
float brickX18 = 255,brickY18=54;

float brickX19 = 15,brickY19=66;
float brickX20 = 50,brickY20=66;
float brickX21 = 85,brickY21=66;
float brickX22 = 120,brickY22=66;
float brickX23 = 150,brickY23=66;
float brickX24 = 185,brickY24=66;
float brickX25 = 220,brickY25=66;
float brickX26 = 255,brickY26=66;

float brickX27 = 15,brickY27=78;
float brickX28 = 50,brickY28=78;
float brickX29 = 85,brickY29=78;
float brickX30 = 120,brickY30=78;
float brickX31 = 150,brickY31=78;
float brickX32 = 185,brickY32=78;
float brickX33 = 220,brickY33=78;
float brickX34 = 255,brickY34=78;

float brickX35 = 15,brickY35=90;
float brickX36 = 50,brickY36=90;
float brickX37 = 85,brickY37=90;
float brickX38 = 120,brickY38=90;
float brickX39 = 150,brickY39=90;
float brickX40 = 185,brickY40=90;
float brickX41 = 220,brickY41=90;
float brickX42 = 255,brickY42=90;

float brickX43 = 15,brickY43=102;
float brickX44 = 50,brickY44=102;
float brickX45 = 85,brickY45=102;
float brickX46 = 120,brickY46=102;
float brickX47 = 150,brickY47=102;
float brickX48 = 185,brickY48=102;
float brickX49 = 220,brickY49=102;
float brickX50 = 255,brickY50=102;

float brickX51 = 30,brickY51=114;
float brickX52 = 65,brickY52=114;
float brickX53 = 100,brickY53=114;
float brickX54 = 135,brickY54=114;
float brickX55 = 170,brickY55=114;
float brickX56 = 205,brickY56=114;
float brickX57 = 240,brickY57=114;

float brickX58 = 48,brickY58=126;
float brickX59 = 83,brickY59=126;
float brickX60 = 118,brickY60=126;
float brickX61 = 153,brickY61=126;
float brickX62 = 188,brickY62=126;
float brickX63 = 223,brickY63=126;

float brickX64 = 66,brickY64=138;
float brickX65 = 101,brickY65=138;
float brickX66 = 136,brickY66=138;
float brickX67 = 171,brickY67=138;
float brickX68 = 206,brickY68=138;

float brickX69 = 84,brickY69=150;
float brickX70 = 119,brickY70=150;
float brickX71 = 154,brickY71=150;
float brickX72 = 189,brickY72=150;

float brickX73 = 102,brickY73=162;
float brickX74 = 137,brickY74=162;
float brickX75 = 172,brickY75=162;

float brickX76 = 120,brickY76=174;
float brickX77 = 155,brickY77=174;

float brickX78 = 138,brickY78=186;
float brickX79 = 143,brickY79=198;
float brickX80 = 148,brickY80=210;


PImage img;
PImage img1;
PImage img2;
PImage img3;
PFont font;

import ddf.minim.*; 
AudioPlayer player; 
Minim minim;

void setup() {

  size(300, 300);
  noStroke();
    noCursor();
  img=loadImage("heart.jpg");
  img1=loadImage("HEARTBALL.gif");
  img2=loadImage("heartfinal.jpg");
  img3=loadImage("heart3.jpg");
  minim = new Minim(this); player = minim.loadFile("LOVESONG.mp3"); 
  player.loop(); 

}

void draw() {
   background(img3);
   
    textFont(createFont("Stencil", 15));
   fill(160, 81, 29);
   text("Press <ENTER> to start the game", 25, 70);
   
   textFont(createFont("MoolBoran", 15));
   text("How to play: Try to bounce the ball to break all the bricks", 25, 90);
   text("and see the picture behind.", 25, 100);
   text("The rule: ", 25,120);
   text("Hit one brick : + 5 marks", 25,130);
   text("Hit back on the middle of the paddle: +20 marks", 25,140);
   text("hit back on the paddle but not on the middle: + 5 marks", 25 ,150);
   text("hit on the bottom boundary: -100 marks", 25,160);
   
   font=loadFont("Jokerman-Regular-48.vlw");
    textFont(font, 15);

   text("Start the true love game now!!!", 25,200);
 if (keyCode== ENTER) {
  background(img3);
  

  background(img);
 fill(243,8,154);
  rect(mouseX-25, height-40, 50, 10);
    fill(255);
  rect(mouseX-10, height-40, 20, 10);
    fill(169, 104, 10);
    text("Player 1:"+player1, 20, 20);
  
  fill(249,37,141);
  rect(brickX, brickY, 30, 10); // brick
  rect(brickX2, brickY2, 30, 10); // brick
  rect(brickX6, brickY6, 30, 10);
  rect(brickX8, brickY8, 30, 10);
  rect(brickX10, brickY10, 30, 10);
  rect(brickX11, brickY11, 30, 10);
  rect(brickX13, brickY13, 30, 10);
  rect(brickX15, brickY15, 30, 10);
  rect(brickX17, brickY17, 30, 10);
  rect(brickX20, brickY20, 30, 10);
  rect(brickX22, brickY22, 30, 10);
  rect(brickX24, brickY24, 30, 10);
  rect(brickX26, brickY26, 30, 10);
  rect(brickX27, brickY27, 30, 10);
  rect(brickX29, brickY29, 30, 10);
  rect(brickX31, brickY31, 30, 10);
  rect(brickX33, brickY33, 30, 10);
  rect(brickX36, brickY36, 30, 10);
  rect(brickX38, brickY38, 30, 10);
  rect(brickX40, brickY40, 30, 10);
  rect(brickX42, brickY42, 30, 10);
  rect(brickX43, brickY43, 30, 10);
  rect(brickX45, brickY45, 30, 10);
  rect(brickX47, brickY47, 30, 10);
  rect(brickX49, brickY49, 30, 10);
  rect(brickX52, brickY52, 30, 10);
  rect(brickX54, brickY54, 30, 10);
  rect(brickX56, brickY56, 30, 10);
  rect(brickX58, brickY58, 30, 10);
  rect(brickX60, brickY60, 30, 10);
  rect(brickX62, brickY62, 30, 10);
  rect(brickX65, brickY65, 30, 10);
  rect(brickX67, brickY67, 30, 10);
  rect(brickX69, brickY69, 30, 10);
  rect(brickX71, brickY71, 30, 10);
  rect(brickX73, brickY73, 30, 10);
  rect(brickX75, brickY75, 30, 10);
  rect(brickX77, brickY77, 30, 10);
  rect(brickX79, brickY79, 20, 10);

  fill(1,204,240);
  rect(brickX3, brickY3, 30, 10);
  rect(brickX4, brickY4, 30, 10);
  rect(brickX5, brickY5, 30, 10);
  rect(brickX7, brickY7, 30, 10);
  rect(brickX9, brickY9, 30, 10);
  rect(brickX12, brickY12, 30, 10);
  rect(brickX14, brickY14, 30, 10);
  rect(brickX16, brickY16, 30, 10);
  rect(brickX18, brickY18, 30, 10);
  rect(brickX19, brickY19, 30, 10);
  rect(brickX21, brickY21, 30, 10);
  rect(brickX23, brickY23, 30, 10);
  rect(brickX25, brickY25, 30, 10);
  rect(brickX28, brickY28, 30, 10);
  rect(brickX30, brickY30, 30, 10);
  rect(brickX32, brickY32, 30, 10);
  rect(brickX34, brickY34, 30, 10);
  rect(brickX35, brickY35, 30, 10);
  rect(brickX37, brickY37, 30, 10);
  rect(brickX39, brickY39, 30, 10);  
  rect(brickX41, brickY41, 30, 10);
  rect(brickX44, brickY44, 30, 10);
  rect(brickX46, brickY46, 30, 10);
  rect(brickX48, brickY48, 30, 10);
  rect(brickX50, brickY50, 30, 10);
  rect(brickX51, brickY51, 30, 10);
  rect(brickX53, brickY53, 30, 10);
  rect(brickX55, brickY55, 30, 10);
  rect(brickX57, brickY57, 30, 10);
  rect(brickX59, brickY59, 30, 10);
  rect(brickX61, brickY61, 30, 10);
  rect(brickX63, brickY63, 30, 10);
  rect(brickX64, brickY64, 30, 10);
  rect(brickX66, brickY66, 30, 10);
  rect(brickX68, brickY68, 30, 10);
  rect(brickX70, brickY70, 30, 10);
  rect(brickX72, brickY72, 30, 10);
  rect(brickX74, brickY74, 30, 10);
  rect(brickX76, brickY76, 30, 10);
  rect(brickX78, brickY78, 30, 10);
  rect(brickX80, brickY80, 10, 10);
  
  fill(random(255),random(1),random(255));
  image(img1,x ,y , 20, 20);



  x = x + xSpeed;
  y = y + ySpeed;

  if (x > width-5 || x < 5) {
    xSpeed = -xSpeed;
  }
  if (y > height-5 || y < 5) {
    ySpeed = -ySpeed;
  }

  // do we collide with paddle
  if (y >height-40 &&( mouseX-25<x && mouseX+25> x))
  { 
    ySpeed = -ySpeed;
        player1=player1+10;
  }

  // do we collide with brick 1
  if (ySpeed < 0 && x >= brickX && x <= brickX+50 && y > brickY && y < brickY+10)
  { 
    ySpeed = -ySpeed;
    brickX = -1000;
    player1 = player1+5;
    println("HIT!!!!");
  }
  
   // do we collide with brick 2
  if (ySpeed < 0 && x >= brickX2 && x <= brickX2+50 && y > brickY2 && y < brickY2+10)
  { 
    ySpeed = -ySpeed;
    brickX2 = -1000;
        player1 = player1+5;
    println("HIT2!!!!");
  }
   if (ySpeed < 0 && x >= brickX3 && x <= brickX3+50 && y > brickY3 && y < brickY3+10)
  { 
    ySpeed = -ySpeed;
    brickX3 = -1000;
        player1 = player1+5;
    println("HIT3!!!!");
  }
    if (ySpeed < 0 && x >= brickX4 && x <= brickX4+50 && y > brickY4 && y < brickY4+10)
  { 
    ySpeed = -ySpeed;
    brickX4 = -1000;
        player1 = player1+5;
    println("HIT4!!!!");
  }
  if (ySpeed < 0 && x >= brickX5 && x <= brickX5+50 && y > brickY5 && y < brickY5+10)
  { 
    ySpeed = -ySpeed;
    brickX5 = -1000;
        player1 = player1+5;
    println("HIT5!!!!");
  }
    if (ySpeed < 0 && x >= brickX6 && x <= brickX6+50 && y > brickY6 && y < brickY6+10)
  { 
    ySpeed = -ySpeed;
    brickX6 = -1000;
        player1 = player1+5;
    println("HIT6!!!!");
  }
    if (ySpeed < 0 && x >= brickX7 && x <= brickX7+50 && y > brickY7 && y < brickY7+10)
  { 
    ySpeed = -ySpeed;
    brickX7 = -1000;
        player1 = player1+5;
    println("HIT7!!!!");
  }
     if (ySpeed < 0 && x >= brickX8 && x <= brickX8+50 && y > brickY8 && y < brickY8+10)
  { 
    ySpeed = -ySpeed;
    brickX8 = -1000;
        player1 = player1+5;
    println("HIT8!!!!");
  }
    if (ySpeed < 0 && x >= brickX9 && x <= brickX9+50 && y > brickY9 && y < brickY9+10)
  { 
    ySpeed = -ySpeed;
    brickX9 = -1000;
        player1 = player1+5;
    println("HIT9!!!!");
  }
    if (ySpeed < 0 && x >= brickX10 && x <= brickX10+50 && y > brickY10 && y < brickY10+10)
  { 
    ySpeed = -ySpeed;
    brickX10 = -1000;
        player1 = player1+5;
    println("HIT10!!!!");
  }
    if (ySpeed < 0 && x >= brickX11 && x <= brickX11+50 && y > brickY11 && y < brickY11+10)
  { 
    ySpeed = -ySpeed;
    brickX11 = -1000;
        player1 = player1+5;
    println("HIT11!!!!");
  }
    if (ySpeed < 0 && x >= brickX12 && x <= brickX12+50 && y > brickY12 && y < brickY12+10)
  { 
    ySpeed = -ySpeed;
    brickX12 = -1000;
        player1 = player1+5;
    println("HIT12!!!!");
  }
    if (ySpeed < 0 && x >= brickX13 && x <= brickX13+50 && y > brickY13 && y < brickY13+10)
  { 
    ySpeed = -ySpeed;
    brickX13 = -1000;
        player1 = player1+5;
    println("HIT13!!!!");
  }
    if (ySpeed < 0 && x >= brickX14 && x <= brickX14+50 && y > brickY14 && y < brickY14+10)
  { 
    ySpeed = -ySpeed;
    brickX14 = -1000;
        player1 = player1+5;
    println("HIT14!!!!");
  }
    if (ySpeed < 0 && x >= brickX15 && x <= brickX15+50 && y > brickY15 && y < brickY15+10)
  { 
    ySpeed = -ySpeed;
    brickX15 = -1000;
        player1 = player1+5;
    println("HIT4!!!!");
  }
    if (ySpeed < 0 && x >= brickX16 && x <= brickX16+50 && y > brickY16 && y < brickY16+10)
  { 
    ySpeed = -ySpeed;
    brickX16 = -1000;
        player1 = player1+5;
    println("HIT16!!!!");
  }
    if (ySpeed < 0 && x >= brickX17 && x <= brickX17+50 && y > brickY17 && y < brickY17+10)
  { 
    ySpeed = -ySpeed;
    brickX17 = -1000;
        player1 = player1+5;
    println("HIT17!!!!");
  }
    if (ySpeed < 0 && x >= brickX18 && x <= brickX18+50 && y > brickY18 && y < brickY18+10)
  { 
    ySpeed = -ySpeed;
    brickX18 = -1000;
        player1 = player1+5;
    println("HIT18!!!!");
  }
    if (ySpeed < 0 && x >= brickX19 && x <= brickX19+50 && y > brickY19 && y < brickY19+10)
  { 
    ySpeed = -ySpeed;
    brickX19 = -1000;
        player1 = player1+5;
    println("HIT4!!!!");
  }
    if (ySpeed < 0 && x >= brickX20 && x <= brickX20+50 && y > brickY20 && y < brickY20+10)
  { 
    ySpeed = -ySpeed;
    brickX20 = -1000;
        player1 = player1+5;
    println("HIT20!!!!");
  }
    if (ySpeed < 0 && x >= brickX21 && x <= brickX21+50 && y > brickY21 && y < brickY21+10)
  { 
    ySpeed = -ySpeed;
    brickX21 = -1000;   
    player1 = player1+5;
    println("HIT21!!!!");
  }
    if (ySpeed < 0 && x >= brickX22 && x <= brickX22+50 && y > brickY22 && y < brickY22+10)
  { 
    ySpeed = -ySpeed;
    brickX22 = -1000;    
    player1 = player1+5;
    println("HIT22!!!!");
  }
    if (ySpeed < 0 && x >= brickX23 && x <= brickX23+50 && y > brickY23 && y < brickY23+10)
  { 
    ySpeed = -ySpeed;
    brickX23 = -1000;
        player1 = player1+5;
    println("HIT23!!!!");
  }
    if (ySpeed < 0 && x >= brickX24 && x <= brickX24+50 && y > brickY24 && y < brickY24+10)
  { 
    ySpeed = -ySpeed;
    brickX24 = -1000;
        player1 = player1+5;
    println("HIT24!!!!");
  }
    if (ySpeed < 0 && x >= brickX25 && x <= brickX25+50 && y > brickY25 && y < brickY25+10)
  { 
    ySpeed = -ySpeed;
    brickX25 = -1000;
        player1 = player1+5;
    println("HIT25!!!!");
  }
    if (ySpeed < 0 && x >= brickX26 && x <= brickX26+50 && y > brickY26 && y < brickY26+10)
  { 
    ySpeed = -ySpeed;
    brickX26 = -1000;
        player1 = player1+5;
    println("HIT26!!!!");
  }
    if (ySpeed < 0 && x >= brickX27 && x <= brickX27+50 && y > brickY27 && y < brickY27+10)
  { 
    ySpeed = -ySpeed;
    brickX27 = -1000;
        player1 = player1+5;
    println("HIT427!!!!");
  }
    if (ySpeed < 0 && x >= brickX28 && x <= brickX28+50 && y > brickY28 && y < brickY28+10)
  { 
    ySpeed = -ySpeed;
    brickX28 = -1000;
        player1 = player1+5;
    println("HIT28!!!!");
  }
    if (ySpeed < 0 && x >= brickX28 && x <= brickX28+50 && y > brickY28 && y < brickY28+10)
  { 
    ySpeed = -ySpeed;
    brickX28 = -1000;
        player1 = player1+5;
    println("HIT27!!!!");
  }
    if (ySpeed < 0 && x >= brickX29 && x <= brickX29+50 && y > brickY29 && y < brickY29+10)
  { 
    ySpeed = -ySpeed;
    brickX29 = -1000;
        player1 = player1+5;
    println("HIT29!!!!");
  }
    if (ySpeed < 0 && x >= brickX30 && x <= brickX30+50 && y > brickY30 && y < brickY30+10)
  { 
    ySpeed = -ySpeed;
    brickX30 = -1000;
        player1 = player1+5;
    println("HIT30!!!!");
  }
    if (ySpeed < 0 && x >= brickX31 && x <= brickX31+50 && y > brickY31 && y < brickY31+10)
  { 
    ySpeed = -ySpeed;
    brickX31 = -1000;
        player1 = player1+5;
    println("HIT31!!!!");
  }
    if (ySpeed < 0 && x >= brickX32 && x <= brickX32+50 && y > brickY32 && y < brickY32+10)
  { 
    ySpeed = -ySpeed;
    brickX32 = -1000;
        player1 = player1+5;
    println("HIT32!!!!");
  }
    if (ySpeed < 0 && x >= brickX33 && x <= brickX33+50 && y > brickY33 && y < brickY33+10)
  { 
    ySpeed = -ySpeed;
    brickX33 = -1000;
        player1 = player1+5;
    println("HIT33!!!!");
  }
    if (ySpeed < 0 && x >= brickX34 && x <= brickX34+50 && y > brickY34 && y < brickY34+10)
  { 
    ySpeed = -ySpeed;
    brickX34 = -1000;
        player1 = player1+5;
    println("HI.3T4!!!!");
  }
    if (ySpeed < 0 && x >= brickX35 && x <= brickX35+50 && y > brickY35 && y < brickY35+10)
  { 
    ySpeed = -ySpeed;
    brickX35 = -1000;
        player1 = player1+5;
    println("HIT35!!!!");
  }
    if (ySpeed < 0 && x >= brickX36 && x <= brickX36+50 && y > brickY36 && y < brickY36+10)
  { 
    ySpeed = -ySpeed;
    brickX36 = -1000;
        player1 = player1+5;
    println("HIT36!!!!");
  }
    if (ySpeed < 0 && x >= brickX37 && x <= brickX37+50 && y > brickY37 && y < brickY37+10)
  { 
    ySpeed = -ySpeed;
    brickX37 = -1000;
        player1 = player1+5;
    println("HIT337!!!!");
  }
    if (ySpeed < 0 && x >= brickX38 && x <= brickX38+50 && y > brickY38 && y < brickY38+10)
  { 
    ySpeed = -ySpeed;
    brickX38 = -1000;
        player1 = player1+5;
    println("HIT38!!!!");
  }
    if (ySpeed < 0 && x >= brickX39 && x <= brickX39+50 && y > brickY39 && y < brickY39+10)
  { 
    ySpeed = -ySpeed;
    brickX39 = -1000;
        player1 = player1+5;
    println("HIT39!!!!");
  }
    if (ySpeed < 0 && x >= brickX40 && x <= brickX40+50 && y > brickY40 && y < brickY40+10)
  { 
    ySpeed = -ySpeed;
    brickX40 = -1000;
        player1 = player1+5;
    println("HIT40!!!!");
  }
    if (ySpeed < 0 && x >= brickX41 && x <= brickX41+50 && y > brickY41 && y < brickY41+10)
  { 
    ySpeed = -ySpeed;
    brickX41 = -1000;
        player1 = player1+5;
    println("HIT41!!!!");
  }
    if (ySpeed < 0 && x >= brickX42 && x <= brickX42+50 && y > brickY42 && y < brickY42+10)
  { 
    ySpeed = -ySpeed;
    brickX42 = -1000;
        player1 = player1+5;
    println("HIT42!!!!");
  }
    if (ySpeed < 0 && x >= brickX43 && x <= brickX43+50 && y > brickY43 && y < brickY43+10)
  { 
    ySpeed = -ySpeed;
    brickX43 = -1000;
        player1 = player1+5;
    println("HIT43!!!!");
  }
    if (ySpeed < 0 && x >= brickX44 && x <= brickX44+50 && y > brickY44 && y < brickY44+10)
  { 
    ySpeed = -ySpeed;
    brickX44 = -1000;
        player1 = player1+5;
    println("HIT44!!!!");
  }
    if (ySpeed < 0 && x >= brickX45 && x <= brickX45+50 && y > brickY45 && y < brickY45+10)
  { 
    ySpeed = -ySpeed;
    brickX45 = -1000;
        player1 = player1+5;
    println("HIT45!!!!");
  }
    if (ySpeed < 0 && x >= brickX46 && x <= brickX46+50 && y > brickY46 && y < brickY46+10)
  { 
    ySpeed = -ySpeed;
    brickX46 = -1000;
        player1 = player1+5;
    println("HIT46!!!!");
  }
    if (ySpeed < 0 && x >= brickX47 && x <= brickX47+50 && y > brickY47 && y < brickY47+10)
  { 
    ySpeed = -ySpeed;
    brickX47 = -1000;
        player1 = player1+5;
    println("HIT47!!!!");
  }
    if (ySpeed < 0 && x >= brickX4 && x <= brickX4+50 && y > brickY4 && y < brickY4+10)
  { 
    ySpeed = -ySpeed;
    brickX4 = -1000;
        player1 = player1+5;
    println("HIT4!!!!");
  }
    if (ySpeed < 0 && x >= brickX48 && x <= brickX48+50 && y > brickY48 && y < brickY48+10)
  { 
    ySpeed = -ySpeed;
    brickX48 = -1000;
        player1 = player1+5;
    println("HIT48!!!!");
  }
    if (ySpeed < 0 && x >= brickX49 && x <= brickX49+50 && y > brickY49 && y < brickY49+10)
  { 
    ySpeed = -ySpeed;
    brickX49 = -1000;
        player1 = player1+5;
    println("HIT49!!!!");
  }
    if (ySpeed < 0 && x >= brickX50 && x <= brickX50+50 && y > brickY50 && y < brickY50+10)
  { 
    ySpeed = -ySpeed;
    brickX50 = -1000;
        player1 = player1+5;
    println("HIT50!!!!");
  }
    if (ySpeed < 0 && x >= brickX51 && x <= brickX51+50 && y > brickY51 && y < brickY51+10)
  { 
    ySpeed = -ySpeed;
    brickX51 = -1000;
        player1 = player1+5;
    println("HIT51!!!!");
  }
    if (ySpeed < 0 && x >= brickX52 && x <= brickX52+50 && y > brickY52 && y < brickY52+10)
  { 
    ySpeed = -ySpeed;
    brickX52 = -1000;
        player1 = player1+5;
    println("HIT52!!!!");
  }
    if (ySpeed < 0 && x >= brickX53 && x <= brickX53+50 && y > brickY53 && y < brickY53+10)
  { 
    ySpeed = -ySpeed;
    brickX53 = -1000;
        player1 = player1+5;
    println("HIT53!!!!");
  }
    if (ySpeed < 0 && x >= brickX54 && x <= brickX54+50 && y > brickY54 && y < brickY54+10)
  { 
    ySpeed = -ySpeed;
    brickX54 = -1000;
        player1 = player1+5;
    println("HIT54!!!!");
  }
    if (ySpeed < 0 && x >= brickX55 && x <= brickX55+50 && y > brickY55 && y < brickY55+10)
  { 
    ySpeed = -ySpeed;
    brickX55 = -1000;
        player1 = player1+5;
    println("HIT55!!!!");
  }
    if (ySpeed < 0 && x >= brickX56 && x <= brickX56+50 && y > brickY56 && y < brickY56+10)
  { 
    ySpeed = -ySpeed;
    brickX56 = -1000;
        player1 = player1+5;
    println("HIT56!!!!");
  }
    if (ySpeed < 0 && x >= brickX57 && x <= brickX57+50 && y > brickY57 && y < brickY57+10)
  { 
    ySpeed = -ySpeed;
    brickX57 = -1000;
        player1 = player1+5;
    println("HIT57!!!!");
  }
    if (ySpeed < 0 && x >= brickX58 && x <= brickX58+50 && y > brickY58 && y < brickY58+10)
  { 
    ySpeed = -ySpeed;
    brickX58 = -1000;
        player1 = player1+5;
    println("HIT58!!!!");
  }
  if (ySpeed < 0 && x >= brickX59 && x <= brickX59+50 && y > brickY59 && y < brickY59+10)
  { 
    ySpeed = -ySpeed;
    brickX59 = -1000;
        player1 = player1+5;
    println("HIT59!!!!");
  }
  if (ySpeed < 0 && x >= brickX60 && x <= brickX60+50 && y > brickY60 && y < brickY60+10)
  { 
    ySpeed = -ySpeed;
    brickX60 = -1000;
        player1 = player1+5;
    println("HIT60!!!!");
  }
  if (ySpeed < 0 && x >= brickX61 && x <= brickX61+50 && y > brickY61 && y < brickY61+10)
  { 
    ySpeed = -ySpeed;
    brickX61 = -1000;
        player1 = player1+5;
    println("HIT61!!!!");
  }
  if (ySpeed < 0 && x >= brickX62 && x <= brickX62+50 && y > brickY62 && y < brickY62+10)
  { 
    ySpeed = -ySpeed;
    brickX62 = -1000;
        player1 = player1+5;
    println("HIT62!!!!");
  }
  if (ySpeed < 0 && x >= brickX63 && x <= brickX63+50 && y > brickY63 && y < brickY63+10)
  { 
    ySpeed = -ySpeed;
    brickX63 = -1000;
        player1 = player1+5;
    println("HIT63!!!!");
  }
  if (ySpeed < 0 && x >= brickX64 && x <= brickX64+50 && y > brickY64 && y < brickY64+10)
  { 
    ySpeed = -ySpeed;
    brickX64 = -1000;
        player1 = player1+5;
    println("HIT64!!!!");
  }
  if (ySpeed < 0 && x >= brickX65 && x <= brickX65+50 && y > brickY65 && y < brickY65+10)
  { 
    ySpeed = -ySpeed;
    brickX65 = -1000;
        player1 = player1+5;
    println("HIT65!!!!");
  }
  if (ySpeed < 0 && x >= brickX66 && x <= brickX66+50 && y > brickY66 && y < brickY66+10)
  { 
    ySpeed = -ySpeed;
    brickX66 = -1000;
        player1 = player1+5;
    println("HIT66!!!!");
  }
  if (ySpeed < 0 && x >= brickX67 && x <= brickX67+50 && y > brickY67 && y < brickY67+10)
  { 
    ySpeed = -ySpeed;
    brickX67 = -1000;
        player1 = player1+5;
    println("HIT67!!!!");
  }
  if (ySpeed < 0 && x >= brickX68 && x <= brickX68+50 && y > brickY68 && y < brickY68+10)
  { 
    ySpeed = -ySpeed;
    brickX68 = -1000;
        player1 = player1+5;
    println("HIT68!!!!");
  }
  if (ySpeed < 0 && x >= brickX69 && x <= brickX69+50 && y > brickY69 && y < brickY69+10)
  { 
    ySpeed = -ySpeed;
    brickX69 = -1000;
        player1 = player1+5;
    println("HIT69!!!!");
  }
  if (ySpeed < 0 && x >= brickX70 && x <= brickX70+50 && y > brickY70 && y < brickY70+10)
  { 
    ySpeed = -ySpeed;
    brickX70 = -1000;
        player1 = player1+5;
    println("HIT70!!!!");
  }
  if (ySpeed < 0 && x >= brickX71 && x <= brickX71+50 && y > brickY71 && y < brickY71+10)
  { 
    ySpeed = -ySpeed;
    brickX71 = -1000;
        player1 = player1+5;
    println("HIT71!!!!");
  }
  if (ySpeed < 0 && x >= brickX72 && x <= brickX72+50 && y > brickY72 && y < brickY72+10)
  { 
    ySpeed = -ySpeed;
    brickX72 = -1000;
        player1 = player1+5;
    println("HIT72!!!!");
  }
  if (ySpeed < 0 && x >= brickX73 && x <= brickX73+50 && y > brickY73 && y < brickY73+10)
  { 
    ySpeed = -ySpeed;
    brickX73 = -1000;
        player1 = player1+5;
    println("HIT73!!!!");
  }
  if (ySpeed < 0 && x >= brickX74 && x <= brickX74+50 && y > brickY74 && y < brickY74+10)
  { 
    ySpeed = -ySpeed;
    brickX74 = -1000;
        player1 = player1+5;
    println("HIT574!!!!");
  }
  if (ySpeed < 0 && x >= brickX75 && x <= brickX75+50 && y > brickY75 && y < brickY75+10)
  { 
    ySpeed = -ySpeed;
    brickX75 = -1000;
        player1 = player1+5;
    println("HIT75!!!!");
  }
  if (ySpeed < 0 && x >= brickX76 && x <= brickX76+50 && y > brickY76 && y < brickY76+10)
  { 
    ySpeed = -ySpeed;
    brickX76 = -1000;
        player1 = player1+5;
    println("HIT76!!!!");
  }
  if (ySpeed < 0 && x >= brickX77 && x <= brickX77+50 && y > brickY77 && y < brickY77+10)
  { 
    ySpeed = -ySpeed;
    brickX77 = -1000;
        player1 = player1+5;
    println("HIT77!!!!");
  }
  if (ySpeed < 0 && x >= brickX78 && x <= brickX78+50 && y > brickY78 && y < brickY78+10)
  { 
    ySpeed = -ySpeed;
    brickX78 = -1000;
        player1 = player1+5;
    println("HIT78!!!!");
  }
  if (ySpeed < 0 && x >= brickX79 && x <= brickX79+50 && y > brickY79 && y < brickY79+10)
  { 
    ySpeed = -ySpeed;
    brickX79 = -1000;
        player1 = player1+5;
    println("HIT79!!!!");
  }
  if (ySpeed < 0 && x >= brickX80 && x <= brickX80+50 && y > brickY80 && y < brickY80+10)
  { 
    ySpeed = -ySpeed;
    brickX80 = -1000;
        player1 = player1+5;
    println("HIT80!!!!");
  }
    if (y>width-5) {
    player1=player1-100;
  }
    if(y >height-40 && (mouseX-15 < x && mouseX+15 >x)){
    player1=player1+20;}
    
    if(brickX == -1000 && brickX2 == -1000 && brickX3 == -1000 && brickX4 == -1000 && brickX5 == -1000 && brickX6 == -1000 && brickX7 == -1000 && brickX8 == -1000 && brickX9 == -1000 && brickX10 == -1000 
    && brickX11 == -1000 && brickX12 == -1000 && brickX13 == -1000 && brickX14 == -1000 && brickX15 == -1000 && brickX16 == -1000 && brickX17 == -1000 && brickX18 == -1000 && brickX19 == -1000 && brickX20 == -1000
    && brickX61 == -1000 && brickX62 == -1000 && brickX63 == -1000 && brickX64 == -1000 && brickX65 == -1000 && brickX66 == -1000 && brickX67 == -1000 && brickX68 == -1000 && brickX69 == -1000 && brickX70 == -1000 
    && brickX71 == -1000 && brickX72 == -1000 && brickX73 == -1000 && brickX74 == -1000 && brickX75 == -1000 && brickX76 == -1000 && brickX77 == -1000 && brickX78 == -1000 && brickX79 == -1000 && brickX80 == -1000  )
    {image(img2, 0, 0, 300, 300); }
}
}


