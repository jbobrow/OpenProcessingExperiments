
int h, diameter, eSize = 10;

size(400, 400);
colorMode(RGB, 400);
background(400);
noStroke();

for (int j = 0; j <=400; j += 10) {
  for (int i = 0; i <= 400; i += 10) {
    fill(0, i, i, 255);
    ellipse(i, j, eSize, eSize);
  }
}

//ballcenter---------------------------------
//noStroke();
//fill(0, 150, 255, 180);

diameter = 0;
for (int i=0; i<16; i++) {

  if (i==3||i==5) {
    fill(400);
  } else {
    fill(0, 0, 255, 100);
  }

  ellipse(200, 200, diameter, diameter);
  diameter = diameter + 10;
} 

//lineleft1----------------------------------
for (int i = 0; i < 400; i += 2) {
  fill(0, 219, 255);
  ellipse(i, i+40, eSize, eSize);
}
//lineright1---------------------------------
for (int i = 0; i < 400; i += 2) {
  fill(0, 219, 255);
  ellipse(i, i-40, eSize, eSize);
}
//lineleft3----------------------------------
for (int i = 0; i < 400; i += 4) {
  fill(13, 255, 221, 200);
  ellipse(i, i+120, eSize, eSize);
}
//lineright3---------------------------------
for (int i = 0; i < 400; i += 4) {
  fill(13, 255, 221, 200);
  ellipse(i, i-120, eSize, eSize);
}

//ballleft2----------------------------------
noStroke();
fill(255, 0, 200, 220);
ellipse(120, 280, 80, 80);

//ballleft3-----------------------------------
noStroke();
fill(150, 0, 255, 220);
ellipse(160, 240, 60, 60);

//ballleft4-----------------------------------
noStroke();
fill(25, 0, 255, 200);
ellipse(190, 210, 50, 50);

//ballright4----------------------------------
noStroke();
fill(25, 0, 255, 200);
ellipse(210, 190, 50, 50);

//ballright3----------------------------------
noStroke();
fill(150, 0, 255, 200);
ellipse(240, 160, 60, 60);

//ballright2-----------------------------------
noStroke();
fill(255, 0, 200, 220);
ellipse(280, 120, 80, 80);

//ballleft1-------------------------------------
noStroke();
fill(255, 0, 200, 100);
diameter = 150;
for (int i=0; i<16; i++) {

  if (i==5||i==10) {
    fill(400);
  } else {
    fill(255, 0, 0, 100);
  }


  ellipse(70, 330, diameter, diameter);
  diameter = diameter - 10;
} 
//ballright1------------------------------------    
noStroke();
fill(255, 0, 200, 100);
diameter = 150;
for (int i=0; i<16; i++) {

  if (i==5||i==10) {
    fill(400);
  } else {
    fill(255, 0, 0, 100);
  }


  ellipse(330, 70, diameter, diameter);
  diameter = diameter - 10;
}

//linecenter----------------------------------
for (int i = 0; i < 400; i += 1) {
  fill(85, 143, 255);
  ellipse(i, i, eSize, eSize);
}
//lineleft2-----------------------------------
for (int i = 0; i < 400; i += 3) {
  fill(147, 185, 255);
  ellipse(i, i+80, eSize, eSize);
}
//lineright2----------------------------------
for (int i = 0; i < 400; i += 3) {
  fill(147, 185, 255);
  ellipse(i, i-80, eSize, eSize);
}
//lineleft4-----------------------------------
for (int i = 0; i < 400; i += 5) {
  fill(180, 255, 194, 200);
  ellipse(i, i+160, eSize, eSize);
}
//lineright4----------------------------------
for (int i = 0; i < 400; i += 5) {
  fill(180, 255, 194, 200);
  ellipse(i, i-160, eSize, eSize);
}


