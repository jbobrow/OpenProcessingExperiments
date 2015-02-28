
PImage[] guy = new PImage[15];
PImage[] guy2 = new PImage[30];
PImage[] guy3 = new PImage[50];
PImage[] heart = new PImage[1];

int i = 0;
int x = 0;

int counter =0;

void setup() {
  size (600, 200);
  frameRate(60);

  //heartbutton
  heart[0] = loadImage("heart.png");

  //Yellow
  guy[0] = loadImage("1.png");
  guy[1] = loadImage("1.png");
  guy[2] = loadImage("1.png");
  guy[3] = loadImage("2.png");
  guy[4] = loadImage("2.png");
  guy[5] = loadImage("2.png");
  guy[6] = loadImage("3.png");
  guy[7] = loadImage("3.png");
  guy[8] = loadImage("3.png");
  guy[9] = loadImage("4.png");
  guy[10] = loadImage("4.png");
  guy[11] = loadImage("4.png");
  guy[12] = loadImage("5.png");
  guy[13] = loadImage("5.png");
  guy[14] = loadImage("5.png");

  //Red
  guy2[0] = loadImage("happy1.png");
  guy2[1] = loadImage("happy1.png");
  guy2[2] = loadImage("happy1.png");
  guy2[3] = loadImage("happy1.png");
  guy2[4] = loadImage("happy1.png");
  guy2[5] = loadImage("happy2.png");
  guy2[6] = loadImage("happy2.png");
  guy2[7] = loadImage("happy2.png");
  guy2[8] = loadImage("happy2.png");
  guy2[9] = loadImage("happy2.png");
  guy2[10] = loadImage("happy3.png");
  guy2[11] = loadImage("happy3.png");
  guy2[12] = loadImage("happy3.png");
  guy2[13] = loadImage("happy3.png");
  guy2[14] = loadImage("happy3.png");
  guy2[15] = loadImage("happy3.png");
  guy2[16] = loadImage("happy3.png");
  guy2[17] = loadImage("happy3.png");
  guy2[18] = loadImage("happy3.png");
  guy2[19] = loadImage("happy3.png");
  guy2[20] = loadImage("happy4.png");
  guy2[21] = loadImage("happy4.png");
  guy2[22] = loadImage("happy4.png");
  guy2[23] = loadImage("happy4.png");
  guy2[24] = loadImage("happy4.png");
  guy2[25] = loadImage("happy5.png");
  guy2[26] = loadImage("happy5.png");
  guy2[27] = loadImage("happy5.png");
  guy2[28] = loadImage("happy5.png");
  guy2[29] = loadImage("happy5.png");

  //Blue
  guy3[0] = loadImage("sad1.png");
  guy3[1] = loadImage("sad1.png");
  guy3[2] = loadImage("sad1.png");
  guy3[3] = loadImage("sad1.png");
  guy3[4] = loadImage("sad1.png");
  guy3[5] = loadImage("sad1.png");
  guy3[6] = loadImage("sad1.png");
  guy3[7] = loadImage("sad1.png");
  guy3[8] = loadImage("sad1.png");
  guy3[9] = loadImage("sad1.png");
  guy3[10] = loadImage("sad1.png");
  guy3[11] = loadImage("sad1.png");
  guy3[12] = loadImage("sad1.png");
  guy3[13] = loadImage("sad2.png");
  guy3[14] = loadImage("sad2.png");
  guy3[15] = loadImage("sad2.png");
  guy3[16] = loadImage("sad2.png");
  guy3[17] = loadImage("sad2.png");
  guy3[18] = loadImage("sad2.png");
  guy3[19] = loadImage("sad2.png");
  guy3[20] = loadImage("sad3.png");
  guy3[21] = loadImage("sad3.png");
  guy3[22] = loadImage("sad3.png");
  guy3[23] = loadImage("sad3.png");
  guy3[24] = loadImage("sad3.png");
  guy3[25] = loadImage("sad3.png");
  guy3[26] = loadImage("sad3.png");
  guy3[27] = loadImage("sad3.png");
  guy3[28] = loadImage("sad3.png");
  guy3[29] = loadImage("sad3.png");
  guy3[30] = loadImage("sad4.png");
  guy3[31] = loadImage("sad4.png");
  guy3[32] = loadImage("sad4.png");
  guy3[33] = loadImage("sad4.png");
  guy3[34] = loadImage("sad4.png");
  guy3[35] = loadImage("sad4.png");
  guy3[36] = loadImage("sad4.png");
  guy3[37] = loadImage("sad4.png");
  guy3[38] = loadImage("sad4.png");
  guy3[39] = loadImage("sad4.png");
  guy3[40] = loadImage("sad4.png");
  guy3[41] = loadImage("sad4.png");
  guy3[42] = loadImage("sad4.png");
  guy3[43] = loadImage("sad5.png");
  guy3[44] = loadImage("sad5.png");
  guy3[45] = loadImage("sad5.png");
  guy3[46] = loadImage("sad5.png");
  guy3[47] = loadImage("sad5.png");
  guy3[48] = loadImage("sad5.png");
  guy3[49] = loadImage("sad5.png");
}

void draw() {


  //yellowmildscene
  if (counter == 1) {  
    mildScene();
    mildGuy();
  }

  //redhappyscene
  if (counter == 2) {  
    happyScene();
    happyGuy();
  }

  //bluesadscene
  if (counter == 0) {  
    sadScene();
    sadGuy();
  } 
 image(heart[0],10,155); 
}

void mousePressed() {
  if (((mouseX > 15) && (mouseX < 54)) && ((mouseY > 160) && (mouseY < 190)))
    rect(0, 0, width, height);
    if(counter<2) {
      counter++;
    } 
    else {
      counter=0;
    }
}

void mildScene() {
  //ground  
  fill(163,214,132);
  rect(0,150,600,100);

  //sun&clouds
  fill(255,186,0);
  ellipse(70,70,100,100);
  fill(255);
  ellipse(90,90,40,40);
  fill(255);
  ellipse(90,100,150,30);
  fill(255);
  ellipse(10,90,150,60);
  fill(255);
  ellipse(60,110,130,30);

  //moon&stars
  fill(243,228,146);
  ellipse(540,70,90,90);
  fill(0);
  ellipse(570,50,90,90);
  fill(255);
  ellipse(580,70,3,3);
  ellipse(580,30,3,3);
  ellipse(570,70,3,3);
  ellipse(550,60,3,3);
  ellipse(520,20,3,3);
  ellipse(500,20,3,3);
  ellipse(520,120,3,3);
  ellipse(570,110,3,3);
  ellipse(580,110,1,1);
  ellipse(580,110,1,1);
  ellipse(560,60,1,1);
  ellipse(580,10,1,1);
  ellipse(560,50,2,2);
}

void mildGuy() {
  if (x < width) {
    if (i < guy.length) {
      for (int i = 0; i < 600; i++) {
        stroke (50-i*.15, 0, 255-i*0.5, 30);
        line(i, 0, i, 600);
      }    
      image (guy[i],x,50);
      i++;
    } 
    else {
      i = 0;
    } 
    x++;
  } 
  else {
    x = 0;
  }
}


void happyScene() {

  //ground  
  fill(54,179,34);
  rect(0,150,600,100);

  //sun&clouds
  fill(255);
  ellipse(90,90,40,40);
  fill(255);
  ellipse(90,100,150,30);
  fill(255);
  ellipse(10,90,150,60);
  fill(255);
  ellipse(60,110,130,30);
  fill(255,186,0);
  ellipse(70,70,100,100);

  //moon&stars
  fill(243,228,146);
  ellipse(540,70,90,90);
  fill(255);
  ellipse(580,70,3,3);
  ellipse(580,30,3,3);
  ellipse(570,70,3,3);
  ellipse(550,60,3,3);
  ellipse(520,20,3,3);
  ellipse(500,20,3,3);
  ellipse(520,120,3,3);
  ellipse(570,110,3,3);
  ellipse(580,110,1,1);
  ellipse(580,110,1,1);
  ellipse(560,60,1,1);
  ellipse(580,10,1,1);
  ellipse(560,50,2,2);
}

void happyGuy() {
  if (x < width) {
    if (i < guy2.length) {
      for (int i = 0; i < 600; i++) {
        stroke (50-i*.15, 0, 255-i*0.5, 30);
        line(i, 0, i, 600);
      }    
      image (guy2[i],x,50);
      i++;
    } 
    else {
      i = 0;
    } 
    x++;
  } 
  else {
    x = 0;
  }
}


void sadScene() {
  //rain
  fill(255);
  line(100,100,400,600);
  line(50,50,350,550);
  line(70,70,370,570);
  line(30,60,330,530);
  line(10,60,310,510);
  line(5,60,305,505);

  //ground  
  fill(213,215,168);
  rect(0,150,600,100);

  //sun&clouds
  fill(255,186,0);
  ellipse(70,70,60,60);
  fill(172);
  ellipse(90,90,100,70);
  ellipse(90,100,150,30);
  ellipse(10,90,150,60);
  ellipse(60,110,130,30);

  //moon&stars
  fill(243,228,146);
  ellipse(540,70,90,90);
  fill(0);
  ellipse(550,60,100,100);
}

void sadGuy() {
  if (x < width) {
    if (i < guy3.length) {
      for (int i = 0; i < 600; i++) {
        stroke (50-i*.15, 0, 255-i*0.5, 30);
        line(i, 0, i, 600);
      }    
      image (guy3[i],x,50);
      i++;
    } 
    else {
      i = 0;
    } 
    x++;
  } 
  else {
    x = 0;
  }
}


