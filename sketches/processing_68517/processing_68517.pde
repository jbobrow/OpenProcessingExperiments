
PImage yellowBG;
PImage sapling;
PImage stump;
PImage mouse;
PImage saw;
PImage tree;
PImage BGtree;
PImage BGdesert;
PImage rabbitcry;
PImage rabbit;
PFont first;
PFont second;
PFont third;
PFont fourth;
PFont fifth;
PFont sixth;

float[] posX=new float[3];
float[] posY=new float[3];

float startingTime=0;
float interval=0;
float interval2=5000;
float interval3=10000;
float interval4=12000;
float interval5=25000;


float velX=3;
//float posX;

boolean click=false;
boolean click2=false;
boolean click3=false;
boolean click4=false;
boolean click5=false;
boolean click6=false;
boolean click7=false;
boolean click8=false;
boolean click9=false;
boolean face1=false;
boolean face2=false;
boolean face3=false;
int d=50;

void setup() {
  size(800, 800);


  yellowBG=loadImage("BG yellow.jpg");
  sapling=loadImage("sapling.png");
  stump= loadImage("stump.png");
  mouse= loadImage("pot.png");
  saw= loadImage("saw.png");
  tree= loadImage("tree.png");
  BGtree=loadImage("BGtree.png");
  BGdesert=loadImage("BGdesert.png");
  rabbitcry=loadImage("rabbitcry.png");
  rabbit=loadImage("rabbit.png");

  first=loadFont("dandelioninthespring-40.vlw");
  second=loadFont("dandelioninthespring-40.vlw");
  third=loadFont("dandelioninthespring-40.vlw");
  fourth=loadFont("dandelioninthespring-40.vlw");
  fifth=loadFont("dandelioninthespring-40.vlw");
  sixth=loadFont("dandelioninthespring-40.vlw");
}



void draw() {
  background(255);


  if (millis()-startingTime>interval&& millis()-startingTime<interval2) {
    image(BGtree, 0, 0);
    textFont(first);
    text("Long Long ago, little rabbits lived in forest, it was quite peaceful.", 50, 630);
    fill(0);
  }


  if (millis()-startingTime>interval2&&millis()-startingTime<interval3) {
    image(BGtree, 0, 0);
    textFont(first);
    text("Long Long ago, little rabbits lived in forest, it was quite peaceful.", 50, 630);
    fill(0);

    for (int i=0;i<3;i++) {
      posY[i]=180*i;
      image(saw, posX[i], posY[i], 70, 180);
     textFont(second);
      text("One day, greedy monsters used saw take all trees away. ",50,680);

      if (posX[i]>width/2) {
        image(BGdesert, 0, 0);
      
      textFont(third);
      text("Rabbits were very sad.",50,730);
        for (int j=0;j<3;j++) {
          posY[j]=180*j;
          image(saw, posX[j], posY[j], 70, 180);
        }
      }
    }

    for (int i=0; i<3; i++) {
      posX[i]=posX[i]+velX;
    }
  }

  if (millis()-startingTime>interval3&& millis()-startingTime<interval4) {
    image(BGdesert, 0, 0);
   
  }

  if (millis()-startingTime>interval4&& millis()-startingTime<interval5) {

    image(yellowBG, 0, 0);
    textFont(fourth);
    text("With help of foest elf, new trees were planted.",50,670);
     textFont(fifth);
     text("Little rabitts got their home again! ",50,720);


    c();
    c2();
    c3();
    c4();
    c5();
    c6();
    c7();
    c8();
    c9();
    f1();
    f2();
    f3();
    image(mouse, mouseX-30, mouseY-20, 60, 40);
    //    
    //    
    //   
    //   
    //   
    //    
    //
  }
   if (millis()-startingTime>interval5){
    image(BGtree, 0,100);
     textFont(sixth);
     text("Thanks dear elf!",340,280);
   }
  
}


void c() {
  if (click==false) {
    image(stump, 40, 100, 200, 106);
  }
  if (click==true) {
    image(sapling, 50, 50);
  }
}

void c2() {
  if (click2==false) {
    image(stump, 175, 240, 240, 127);
  }
  if (click2==true) {
    image(sapling, 230, 230);
  }
}

void c3() {
  if (click3==false) {
    image(stump, 2, 300, 300, 159);
  }
  if (click3==true) {
    image(sapling, 70, 270);
  }
}
void c4() {
  if (click4==false) {
    image(stump, 155, 55, 150, 79);
  }
  if (click4==true) {
    image(sapling, 140, 15);
  }
}
void c5() {
  if (click5==false) {
    image(stump, 245, 400, 320, 169);
  }
  if (click5==true) {
    image(sapling, 320, 300);
  }
}

void c6() {
  if (click6==false) {
    image(stump, 320, 95, 170, 90);
  }
  if (click6==true) {
    image(sapling, 260, 85);
  }
}
void c7() {
  if (click7==false) {
    image(stump, 500, 30, 140, 74);
  }
  if (click7==true) {
    image(sapling, 500, 9);
  }
}
void c8() {
  if (click8==false) {
    image(stump, 500, 194, 240, 127);
  }
  if (click8==true) {
    image(sapling, 550, 170);
  }
}
void c9() {
  if (click9==false) {
    image(stump, 530, 355, 300, 159);
  }
  if (click9==true) {
    image(sapling, 565, 300);
  }
}
void f1() {
  if (face1==false) {
    image(rabbitcry, 330, 120, 120, 150);
  }
  if (face1==true) {
    image(rabbit, 330, 120, 120, 150);
  }
}
void f2() {
  if (face2==false) {
    image(rabbitcry, 400, 220, 100, 125);
  }
  if (face2==true) {
    image(rabbit, 400, 220, 100, 125);
  }
}
void f3() {
  if (face3==false) {
    image(rabbitcry, 500, 300, 80, 100);
  }
  if (face3==true) {
    image(rabbit, 500, 300, 80, 100);
  }
}



void mousePressed() {
  if (mouseX>0 && mouseX<200 && mouseY>0 && mouseY< 200) {
    click=true;
  }

  if (mouseX>200 && mouseX<400 && mouseY>200 && mouseY<400) {
    click2=true;
    face1=true;
  }
  if (mouseX>2 && mouseX<250 && mouseY>350 && mouseY<550) {
    click3=true;
  }
  if (mouseX>155 && mouseX<300 && mouseY>50 && mouseY<100) {
    click4=true;
  }
  if (mouseX>300 && mouseX<550 && mouseY>400 && mouseY<500) {
    click5=true;
    face2=true;
  }
  if (mouseX>320 && mouseX<500 && mouseY>95 && mouseY<150) {
    click6=true;
  }
  if (mouseX>500 && mouseX<580 && mouseY>30 && mouseY<80) {
    click7=true;
    face3=true;
  }
  if (mouseX>570 && mouseX<700 && mouseY>194 && mouseY<250) {
    click8=true;
  }
  if (mouseX>565 && mouseX<710 && mouseY>355 && mouseY<450) {
    click9=true;
  }
}


