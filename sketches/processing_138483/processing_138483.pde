
import ddf.minim.*;

Minim minim;

AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioSample effect;


color cEast;
color cWest;
color cNorth;
color cSouth;


color[][] normalBox = new color[6][4];
color[][] normalBox2 = new color[9][6];
color[][] normalBox3 = new color[12][8];


int frame = 0;
float x;
float y;
float speed = 5;

int radi = 25;
int dia = radi*2;
int item = 5;
boolean itemOn = false;

boolean goUp = true;
boolean goDown = true;
boolean goLeft = true;
boolean goRight = true;

boolean inBox = false;
boolean previousInBox = false;

void setup() {
  size(800, 480);


  smooth();
  noStroke();

  minim = new Minim(this);
  // load BD.mp3 from the data folder with a 1024 sample buffer
  effect = minim.loadSample("cartoon004.mp3");
  player2 = minim.loadFile("Side Pocket - NES - Game Theme.mp3");
  player3 = minim.loadFile("Clu Clu Land - NES - Stage Theme.mp3");
  player4 = minim.loadFile("Side Pocket - NES - City Champion.mp3");

  
  x = (width/2)-150;
  y = (height/2)-150;



  for (int i=0; i<4; i++) {
    for (int j=0; j<6; j++) {
      int RanColor = int(random (1, 5));
      color thisColor = #000000;
      switch(RanColor) {
      case 1: 
        thisColor = #FC4040;
        break;
      case 2:
        thisColor = #4047FC;
        break;
      case 3:
        thisColor = #97FC40;
        break;
      case 4:
        thisColor = #FCF340;
        break;
      } 
      normalBox[j][i] = thisColor;
    }
  }
  for (int i1=0; i1<6; i1++) {
    for (int j1=0; j1<9; j1++) {
      int RanColor = int(random (1, 5));
      color thisColor = #000000;
      switch(RanColor) {
      case 1: 
        thisColor = #FC4040;
        break;
      case 2:
        thisColor = #4047FC;
        break;
      case 3:
        thisColor = #97FC40;
        break;
      case 4:
        thisColor = #FCF340;
        break;
      } 
      normalBox2[j1][i1] = thisColor;
    }
  }
  for (int i2=0; i2<8; i2++) {
    for (int j2=0; j2<12; j2++) {
      int RanColor = int(random (1, 5));
      color thisColor = #000000;
      switch(RanColor) {
      case 1: 
        thisColor = #FC4040;
        break;
      case 2:
        thisColor = #4047FC;
        break;
      case 3:
        thisColor = #97FC40;
        break;
      case 4:
        thisColor = #FCF340;
        break;
      } 
      normalBox3[j2][i2] = thisColor;
    }
  }
}

void draw() {
  
  background(0);
  
  if (frame == 0) {
    frameIntro();
  }
  else if (frame == 1) {
    frameGame1();
  }
  else if (frame == 2) {
    frameGame2();
  }
  else if (frame == 3) {
    frameGame3();
  }
  else if (frame == 4) {
    Level1();
  }
  else if (frame == 5) {
    Level2();
  }
  else if (frame == 6) {
    Level3();
  }
  else if (frame == 7) {
    frameWin();
  }
  else if (frame == 8) {
    frameLose();
  }

  cEast = get(width/2 + radi, height/2);
  cWest = get(width/2 - radi, height/2);
  cNorth = get(width/2, height/2 - radi);
  cSouth = get(width/2, height/2 + radi);


  if (cEast == color(#FC4040) || cEast == color(#4047FC) || cEast == color(#97FC40) || cEast == color(#FCF340) || cEast == -3539556 || cEast == -132964 ||
  cEast == -6512387 || cEast == -156516){
    goRight = false;
  } 
  else {
    goRight = true;
  }

  if (cWest == color(#FC4040) || cWest == color(#4047FC) || cWest == color(#97FC40) || cWest == color(#FCF340) || cWest == -3539556 || cWest == -132964 ||
  cWest == -6512387 || cWest == -156516){ 
    goLeft = false;
  } 
  else {

    goLeft = true;

  }
  
    if (cNorth == color(#FC4040) || cNorth == color(#4047FC) || cNorth == color(#97FC40) || cNorth == color(#FCF340) || cNorth == -3539556 || cNorth == -132964 || 
    cNorth == -6512387 || cNorth == -156516){
    goUp = false;
  } 
  else {
    goUp = true;

  }
  
  if (cSouth == color(#FC4040) || cSouth == color(#4047FC) || cSouth == color(#97FC40) || cSouth == color(#FCF340) || cSouth == -3539556 || cSouth == -132964 || 
  cSouth == -6512387 || cSouth == -156516) {
    goDown = false;
  } 
  else {
    goDown = true;
  }
 
  pushMatrix();
  if (frame == 1 || frame == 2 || frame == 3) {
    ellipse(width/2, height/2, dia, dia);
    fill(#464443);
    switch(item){
      case 5:
        ellipse(width/2+20, height/2, dia/4, dia/4);
      case 4:
        ellipse(width/2+10, height/2, dia/4, dia/4);
      case 3:
        ellipse(width/2, height/2, dia/4, dia/4);
      case 2:
        ellipse(width/2-10, height/2, dia/4, dia/4);
      case 1:
        ellipse(width/2-20, height/2, dia/4, dia/4);
        break;
        
    }
    //text("items: "+ item, width/2-21, height/2+3);
  }
  popMatrix();
}



void moveScreen() {

  if (keyPressed == true) {
    if (key == CODED) {
      if (keyCode == UP && goUp == true) {
        y += speed;
      } 
      else if (keyCode == DOWN && goDown == true) {
        y -= speed;
      } 
      else if (keyCode == LEFT && goLeft == true) {
        x += speed;
      } 
      else if (keyCode == RIGHT && goRight == true) {
        x -= speed;
      }
    }
  }
}



boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {

  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);

  if (circleDistanceX > (rw/2 + cr)) { 
    return false;
  }
  if (circleDistanceY > (rh/2 + cr)) { 
    return false;
  }
  if (circleDistanceX <= rw/2) { 
    return true;
  }
  if (circleDistanceY <= rh/2) { 
    return true;
  }

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}




void frameIntro() {

  text("INSTRUCTION:", 220, 180);
  text("1. Use Arrow keys, Reach to the Right*Bottom corner", 320, 200);
  text("2. Do NOT pass between same color boxes", 320, 220);
  text("3. FIVE chances to use PASS item, Press < B >", 320, 240);
  text("   * Use the item WISELY for emergency situations!", 320, 260);
  text("4. When you are ready, Press < S >", 320, 280);
  

  fill(#FA3838);
  text("[Press ANY Key to Start]", 320, 300);
  //text("if you want to try again, Press <S>!", 380, 255); 

  fill(255);
  rect(45, 45, 40, 40);

  ellipse (740, 420, 40, 40);

  if (keyPressed) {

    frame = 4;
  }
}


//==============================================================Level 1



void frameGame1() {
  player2.play();
  pushMatrix();
  
  // Wall boundary (x, right, left)/ (y. bottom, top)
  x = constrain(x, -1130, 335);
  y = constrain(y, -650, 180);

  moveScreen();
  inBox = false;

  //println("X: " + x + " Y: " + y);
  translate(x, y);

  fill(104);
  rect(0, 0, 1600, 960);


  //Normal Box
  for (int j=0; j<4; j++) {
    for (int i=0; i<6; i++) {
      if (i==0 && j==0) {
        continue;//draw star here
      }
      else if (i==5 && j==3) {
        fill(#FFC66F);
        ellipse(((width*2)/6)*5+128, ((height*2)/4)*3+105, 150, 150);
        fill(#663698);
        text("Good Job!", ((width*2)/6)*5+65, ((height*2)/4)*3+115);
      }
      else {
        fill(normalBox[i][j]);
        rect(((width*2)/6)*i+42.5, ((height*2)/4)*j+50, 180, 150);
      }
    }
  }

  //Invisible horizental box
  for (int j=0; j<3; j++) {
    for (int i=0; i<6; i++) {
      if (i==0 && j==0) {
        continue;
      }
      else if (i==5 && j==2) {
        continue;
      }
      else {
        if (rectCircleIntersect(x+(width*2)*i/6+42.5, y+(height*2)*j/4+205, 180, 80, width/2, height/2, 0)) {
          fill(104);
          //println("i: " + i + " j: " + j);
          if (itemOn == false && normalBox[i][j] == normalBox[i][j+1]) {
            frame = 8;
          } 
          else if (itemOn == true && normalBox[i][j] == normalBox[i][j+1]) {
            inBox = true;
          }
        } 
        else {
          fill(104);
        }
        rect((width*2)*i/6+42.5, (height*2)*j/4+205, 180, 80);
      }
    }
  }

  //Invisible vertical box
  for (int j=0; j<4; j++) {
    for (int i=0; i<5; i++) {
      if (i==0 && j==0) {
        continue;
      }
      else if (i==4 && j==3) {
        continue;
      }
      else {
        fill(#FFFFFF);
        if (rectCircleIntersect(x+(width*2)*i/6+226.5, y+(height*2)*j/4+50, 75, 150, width/2, height/2, 0)) {
          fill(104);
          if (itemOn == false && normalBox[i][j] == normalBox[i+1][j]) {
            frame = 8;
          } 
          else if (itemOn == true && normalBox[i][j] == normalBox[i+1][j]) {
            inBox = true;
          }
        } 
        else {
          fill(104);
        }
        rect((width*2)*i/6+226.5, (height*2)*j/4+50, 75, 150);
      }
    }
  }

  item();
  
    popMatrix();

  if (x < -1000 && y < -520) {
    frame = 5;
  }
}


//==================================================================Level 2

void frameGame2() {
  player3.play();
  
  pushMatrix();

  x = constrain(x, -1940, 335);
  y = constrain(y, -1140, 180);

  moveScreen();
  inBox = false;

  translate(x, y);

  fill(104);
  rect(0, 0, 2400, 1440);

  for (int j1=0; j1<6; j1++) {
    for (int i1=0; i1<9; i1++) {
      if (i1==0 && j1==0) {
        continue;//draw star here
      }
      else if (i1==8 && j1==5) {
        fill(#FFC66F);
        ellipse(((width*3)/9)*8+128, ((height*3)/6)*5+105, 150, 150);
        fill(#663698);
        text("Well Done:)", ((width*3)/9)*8+65, ((height*3)/6)*5+100); 
      }
      else {
        fill(normalBox2[i1][j1]);
        rect(((width*3)/9)*i1+42.5, ((height*3)/6)*j1+50, 180, 150);
      }
    }
  }


  //horizental box
  for (int j1=0; j1<5; j1++) {
    for (int i1=0; i1<9; i1++) {
      if (i1==0 && j1==0) {
        continue;//draw star here
      }
      else if (i1==8 && j1==4) {
        continue;
      }
      else {
        if (rectCircleIntersect(x+(width*3)*i1/9+42.5, y+(height*3)*j1/6+205, 180, 80, width/2, height/2, 0)) {
          fill(104);
          //println("i: " + i + " j: " + j1);
          if (itemOn == false && normalBox2[i1][j1] == normalBox2[i1][j1+1]) {
            frame = 8;
          }
          else if (itemOn == true && normalBox2[i1][j1] == normalBox2[i1][j1+1]) {
            inBox = true;
          }
        } 
        else {
          fill(104);
        }
        rect((width*3)*i1/9+42.5, (height*3)*j1/6+205, 180, 80);
      }
    }
  }

  //vertical box
  for (int j1=0; j1<6; j1++) {
    for (int i1=0; i1<8; i1++) {
      if (i1==0 && j1==0) {
        continue;//draw star here
      }
      else if (i1==7 && j1==5) {
        continue;
      }
      else {
        fill(#FFFFFF);
        if (rectCircleIntersect(x+(width*3)*i1/9+226.5, y+(height*3)*j1/6+50, 75, 150, width/2, height/2, 0)) {
          fill(104);
          if (itemOn == false && normalBox2[i1][j1] == normalBox2[i1+1][j1]) {
            frame = 8;
          } 
          else if (itemOn == true && normalBox2[i1][j1] == normalBox2[i1+1][j1]) {
            inBox = true;
          }
        } 
        else {
          fill(104);
        }
        rect((width*3)*i1/9+226.5, (height*3)*j1/6+50, 75, 150);
      }
    }
  }
  popMatrix();

  item();

  if (x < -1800 && y < -1000) {
    frame = 6;
  }
}

//===================================================================Level 3

void frameGame3() {
  player4.play();
  moveScreen();

  pushMatrix();
  
  x = constrain(x, -2735, 335);
  y = constrain(y, -1620, 180);
  
  inBox = false;
  translate(x, y);

  fill(104);
  rect(0, 0, 3200, 1920);



  for (int j2=0; j2<8; j2++) {
    for (int i2=0; i2<12; i2++) {
      if (i2==0 && j2==0) {
        continue;//draw star here
      }
      else if (i2==11 && j2==7) {
        continue;
      }
      else {
        fill(normalBox3[i2][j2]);
        rect(((width*4)/12)*i2+42.5, ((height*4)/8)*j2+50, 180, 150);
      }
    }
  }

  //horizental box
  for (int j2=0; j2<7; j2++) {
    for (int i2=0; i2<12; i2++) {
      if (i2==0 && j2==0) {
        continue;//draw star here
      }
      else if (i2==11 && j2==6) {
        fill(#FFC66F);
        ellipse(((width*4)/12)*11+128, ((height*4)/7)*6+105, 150, 150);
        fill(#663698);
        text("OMG.. You're amazing'0'", ((width*4)/12)*11+62, ((height*4)/7)*6+115);
      }
      else {
        if (rectCircleIntersect(x+(width*4)*i2/12+42.5, y+(height*4)*j2/8+205, 180, 80, width/2, height/2, 0)) {
         fill(104);
          //println("i: " + i + " j: " + j);
          if (itemOn == false && normalBox3[i2][j2] == normalBox3[i2][j2+1]) {
            frame = 8;
          } 
          else if (itemOn == true && normalBox3[i2][j2] == normalBox3[i2][j2+1]) {
            inBox = true;
          }
        } 
        else {
          fill(104);
        }
        rect((width*4)*i2/12+42.5, (height*4)*j2/8+205, 180, 80);
      }
    }
  }

  //vertical box
  for (int j2=0; j2<8; j2++) {
    for (int i2=0; i2<11; i2++) {
      if (i2==0 && j2==0) {
        continue;//draw star here
      }
      else if (i2==1 && j2==6) {
        continue;
      }
      else {
        fill(#FFFFFF);
        if (rectCircleIntersect(x+(width*4)*i2/12+226.5, y+(height*4)*j2/8+50, 75, 150, width/2, height/2, 0)) {
          fill(104);
          if (itemOn == false && normalBox3[i2][j2] == normalBox3[i2+1][j2]) {
            frame = 8;
          } 
          else if (itemOn == true && normalBox3[i2][j2] == normalBox3[i2+1][j2]) {
            inBox = true;
          }
        }  
        else {
          fill(104);
        }
        rect((width*4)*i2/12+226.5, (height*4)*j2/8+50, 75, 150);
      }
    }
  }
  popMatrix();

  item();
  if (x < -2600 && y < -1480) {
    frame = 7;
  }
}



//=============================================Level changes



void Level1() {
  text("Level 1", 380, 220);
  text("Press < S >", 372, 255); 

  if (keyPressed) {
    if (key == 's' || key == 'S') {
      x = (width/2)-150;
      y = (height/2)-150;
      frame = 1;
    }
  }
}


void Level2() {
  text("Level 2", 380, 220);
  text("Press < S >", 372, 255); 
  
  player2.pause();
  
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      x = (width/2)-150;
      y = (height/2)-150;
      frame = 2;
    }
  }
}

void Level3() {
  text("Level 3", 380, 220);
  text("Press < S >", 372, 255); 

  player3.pause();

  if (keyPressed) {
    if (key == 's' || key == 'S') {
      x = (width/2)-150;
      y = (height/2)-150;
      frame = 3;
    }
  }
}

void frameWin() {
  text("Congrats!!", 375, 220);
  text("To start again, Press < S >!", 700, 460); 

  player4.pause();

  if (keyPressed) {
    if (key == 's' || key == 'S') {
      x = (width/2)-150;
      y = (height/2)-150;
      frame = 0;
    }
  }
}


void frameLose() {

  text("GAME OVER", 370, 220);
  text("if you want to try again, Press < S >!", 580, 460); 

  player2.pause();
  player3.pause();
  player4.pause();

  if (keyPressed) {
    if (key == 's' || key == 'S') {
      x = (width/2)-150;
      y = (height/2)-150;
      frame = 0;
    }
  }
  
  item = 5;
  
}


void keyPressed() {
  if ((frame == 1 || frame == 2 || frame == 3) && (key == 'b' || key == 'B')) {
    if (item > 0) {
      effect.trigger();
      itemOn = true;
      item--;
     
    }
  }
}

 void item() {
   if (itemOn) {
    fill(#FF8D00);
    
  } 
  else {
    fill(255);
  }


  if (itemOn == true && inBox == false && previousInBox == true) {
    itemOn = false;
    previousInBox = false;
    //println("switch");
  }
  if (itemOn == true && inBox == true) {
    previousInBox = true;
  }
  if (itemOn == true && inBox == false) {
    previousInBox = false;
  }
 }




