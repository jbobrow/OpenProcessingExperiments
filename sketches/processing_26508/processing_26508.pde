
color redOrange = color(255,50,10);
color red = color(255,10,0);
color redPurple = color(183,46,135);
color purple = color(146,43,211);
color bluePurple = color(106,40,250);
color blue = color(0,70,220);
color blueGreen = color(26,170,133);
color green = color(54,175,44);
color yellowGreen = color(159,219,108);
color yellow = color(255,250,93);
color yellowOrange = color(242,175,73);
color orange = color(255,115,0);
String p = "";
String s = "";
String t = "";
String title = "The Colour Square";
int squareX = 150;
int squareY = 150;
int b1 = 1;
int b2 = 1;
int b3 = 1;
int b4 = 1;
int b5 = 1;
int b6 = 1;
int b7 = 1;
int b8 = 1;
int b9 = 1;
int b10 = 1;
int b11 = 1;
int b12 = 1;
String col = "";
int colX = 0;
int colY = 0;
String col2 = "";
int col2x = 0;
int col2y = 0;
int face = 255;
int hands = 255;
int feet = 255;
String r = "r";
int jump = 0;
String hi = "Hi, I'm Don !";

void setup () {
  size(600,600);
  smooth();
  stroke(0, 100);
  //background(255);
}

void draw () {
  background(255);

  fill(yellow); 
  strokeWeight(b1);
  rect(150,0,squareX,squareY);

  fill(yellowOrange);
  strokeWeight(b2); 
  rect(300,0,150,150);

  fill(orange); 
  strokeWeight(b3);
  rect(450,0,150,150);

  fill(redOrange); 
  strokeWeight(b4);
  rect(450,150,150,150);

  fill(red); 
  strokeWeight(b5);
  rect(450,300,150,150);

  fill(redPurple); 
  strokeWeight(b6);
  rect(450,450,150,150);

  fill(purple);  
  strokeWeight(b7);
  rect(300,450,150,150);

  fill(bluePurple); 
  strokeWeight(b8);
  rect(150,450,150,150);

  fill(blue); 
  strokeWeight(b9);
  rect(0,450,150,150);

  fill(blueGreen); 
  strokeWeight(b10);
  rect(0,300,150,150);

  fill(green); 
  strokeWeight(b11);
  rect(0,150,150,150);

  fill(yellowGreen);
  strokeWeight(b12); 
  rect(0,0,150,150);

  PFont font;
  font = loadFont("CenturyGothic-28.vlw");
  textFont(font);
  strokeWeight(1);
  fill(155,136,198);
  text(p, 200, 200);//primary
  fill(140,198,136);
  text(s, 180, 200);//secondary
  fill(198,170,136);
  text(t, 200, 200);//tertiary
  fill(250,68,187);
  text(title, 175, 200);//colour wheel
  fill(0);
  text(col, colX, colY);//colours
  text(col2, col2x, col2y);


  stroke(0);
  //rect(260,250,30,60);
  fill(face);
  ellipse(300,340,100,105);
  fill(feet);
  ellipse(280,390,30,20);//left foot
  ellipse(320,390,30,20);//right foot
  fill(hands);
  if (keyPressed == true) {
    ellipse(245,335,25,22);
  } else {
  ellipse(250,345,16,25);//left hand
  }
  ellipse(350,345,16,25);//right hand
  if (keyPressed == true) {
    font = loadFont("CenturyGothic-24.vlw");
    textFont(font);
    fill(100); 
    text(hi, 230, 260);//speech
  }
  fill(0);
  arc(300,360,22,35,0,PI);//mouth
  strokeWeight(2);
  if (keyPressed == true) {
    ellipse(288,330,7,10);//left eye
    ellipse(310,330,7,10);//right eye
  } else {
  line(283,335,293,330);//left-bottomw
  line(293,330,283,325);//left-top
  line(305,330,315,335);//right-bottom
  line(305,330,315,325);//right-top
  }
  
  strokeWeight(1);
  fill(180);
  ellipse(415,415,35,35);//RESTART button
  fill(0);
  font = loadFont("CenturyGothic-28.vlw");
  textFont(font);
  text(r, 411, 425);
}

void mousePressed () {
  if (mouseX > 150 && mouseX < 300 && mouseY < 150) {
    p = "Primary Colour";
    b1 = 2;
    b5 = 1;
    b9 = 1;
    title = "";
    col = "Yellow";
    colX = 180;
    colY = 85;
    feet = yellow;
  } 
  else if (mouseX > 450 && mouseY > 300 && mouseY < 450) {
    p = "Primary Colour";
    b5 = 2;
    b1 = 1;
    b9 = 1;
    title = "";
    col = "Red";
    colX = 495;
    colY = 380;
    feet = red;
  } 
  else if (mouseX < 150 && mouseY > 450) {
    p = "Primary Colour";
    b9 = 2;
    b1 = 1;
    b5 = 1;    
    title = "";
    col = "Blue";
    colX = 45;
    colY = 530;
    feet = blue;
  } 
  else {
    p = "";
    b1 = 1;
    b5 = 1;
    b9 = 1;
    col2 = "";
  }  

  if (mouseX > 450 && mouseY < 150) {
    s = "Secondary Colour";
    b3 = 2;
    b7 = 1;
    b11 = 1;
    title = "";
    col = "Orange";
    colX = 470;
    colY = 85;
    hands = orange;
  } 
  else if (mouseX > 300 && mouseX < 450 && mouseY > 450) {
    s = "Secondary Colour";
    b7 = 2;
    b3 = 1;
    b11 = 1;
    title = "";
    col = "Purple";
    colX = 335;
    colY = 530;
    hands = purple;
  } 
  else if (mouseX < 150 && mouseY > 150 && mouseY < 300) {
    s = "Secondary Colour";
    b11 = 2;
    b3 = 1;
    b7 = 1;
    title = "";
    col = "Green";
    colX = 35;
    colY = 235;
    hands = green;
  } 
  else {
    s = "";
    b3 = 1;
    b7 = 1;
    b11 = 1;
    col2 = "";
  }

  if (mouseX > 300 && mouseX < 450 && mouseY < 150) {
    t = "Tertiary Colour";
    b2 = 2;
    b4 = 1;
    b6 = 1;
    b8 = 1;
    b10 = 1;
    b12 = 1;
    title = "";
    col = "Yellow";
    colX = 330;
    colY = 70;
    col2 = "-Orange";
    col2x = 315;
    col2y = 100;
    face = yellowOrange;
  } 
  else if (mouseX > 450 && mouseY > 150 && mouseY < 300) {
    t = "Tertiary Colour";
    b4 = 2;
    b2 = 1;
    b6 = 1;
    b8 = 1;
    b10 = 1;
    b12 = 1;
    title = "";
    col = "Red";
    colX = 495;
    colY = 220;
    col2 = "-Orange";
    col2x = 470;
    col2y = 250;
    face = redOrange;
  } 
  else if (mouseX > 450 && mouseY > 450) {
    t = "Tertiary Colour";
    b6 = 2;
    b2 = 1;
    b4 = 1;
    b8 = 1;
    b10 = 1;
    b12 = 1;
    title = "";
    col = "Red";
    colX = 495;
    colY = 515;
    col2 = "-Purple";
    col2x = 475;
    col2y = 545;
    face = redPurple;
  } 
  else if (mouseX > 150 && mouseX < 300 && mouseY > 450) {
    t = "Tertiary Colour";
    b8 = 2;
    b2 = 1;
    b4 = 1;
    b6 = 1;
    b10 = 1;
    b12 = 1;
    title = "";
    col = "Blue";
    colX = 195;
    colY = 515;
    col2 = "-Purple";
    col2x = 175;
    col2y = 545;
    face = bluePurple;
  } 
  else if (mouseX < 150 && mouseY > 300 && mouseY < 450) {
    t = "Tertiary Colour";
    b10 = 2;
    b2 = 1;
    b4 = 1;
    b6 = 1;
    b8 = 1;
    b12 = 1;
    title = "";
    col = "Blue";
    colX = 45;
    colY = 365;
    col2 = "-Green";
    col2x = 25;
    col2y = 395;
    face = blueGreen;
  } 
  else if (mouseX < 150 && mouseY < 150) {
    t = "Tertiary Colour";
    b12 = 2;
    b2 = 1;
    b4 = 1;
    b6 = 1;
    b8 = 1;
    b10 = 1;
    title = "";
    col = "Yellow";
    colX = 30;
    colY = 70;
    col2 = "-Green";
    col2x = 25;
    col2y = 100;
    face = yellowGreen;
  } 
  else {
    t = "";
    b2 = 1;
    b4 = 1;
    b6 = 1;
    b8 = 1;
    b10 = 1;
    b12 = 1;
  }

  if (mouseX > 150 && mouseX < 450 && mouseY > 150 && mouseY < 450) {
    title = "The Colour Square";
    col = "";
    col2 = "";
  } 
  else {
    title = "";
  }
  
  if (mouseX > 397 && mouseX < 433 && mouseY > 397 && mouseY < 433) {
    face = 255;
    hands = 255;
    feet = 255;
  }
}

/*void keyPressed () {
  if   
}

void hi() {
 ellipse(30,30,30,30); 
}*/

