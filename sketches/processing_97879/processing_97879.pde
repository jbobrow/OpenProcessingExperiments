
PImage hamlet;
PImage page1;
PImage page2;
PImage page3;

PImage pig;
PImage cow;
PImage sheep;
PImage cloud;

PImage cow2;
PImage sheep2;
PImage cloud2;

int GamePlay = 1;
int HamletY = 350;
int HamletYSpeed = 2;

int rainbownumber = 500;
int Factor = 0;
float[] X_pos = new float[rainbownumber];
float[] Y_pos = new float[rainbownumber];
float[] Speed = new float[rainbownumber];
float movement = -.5;


int number_of_cows = 200;
float [] CowY = new float[number_of_cows];
float CowYspeed = -1.5;
float cowincrementer = 0;


int number_of_sheep = 200;
float [] SheepX = new float[number_of_sheep];
float SheepXspeed = -2.5;
float sheepincrementer = 0;

int number_of_clouds = 300;
float [] CloudX = new float[number_of_clouds];
float CloudXspeed = -6.5;


void setup() {

  size(1200, 700);
  hamlet = loadImage("hamlet1.png");
  page1 = loadImage("gamepage1.png");
  page2 = loadImage("gamepage2.png");
  page3 = loadImage("gamepage3.png");
  pig = loadImage("pig.png");
  cow = loadImage("cow1.png");
  sheep = loadImage("sheep1.png");
  cloud = loadImage("cloud1.png");
  cow2 = loadImage("cow2.png");
  sheep2 = loadImage("sheep2 copy.png");
  cloud2 = loadImage("cloud2 copy.png");
  for (int i = 0; i < number_of_clouds; i++) {
    CloudX[i] = 100 + i*400;
  }
  for (int j = 0; j < number_of_sheep; j++) {
    SheepX[j] = 1000 + j*200;
  }
  for (int k = 0; k < number_of_cows; k++) {
    CowY[k] = 750 + k*300;
  }
}
void draw() {
  background(200);
  if (GamePlay == 1) {
    image(page1, 0, 0, 1200, 700);
    image(hamlet, 100, HamletY, 300, 300);
    HamletY = HamletY + HamletYSpeed;
    if (HamletY > 400) { 
      HamletYSpeed = -2;
    }
    if (HamletY < 300) {

      HamletYSpeed = 2;
    }
  } 
  else if (GamePlay == 2) {
    image(page2, 0, 0, 1200, 700);
    image(hamlet, 100, HamletY, 300, 300);
    HamletY = HamletY + HamletYSpeed;
    if (HamletY > 400) { 
      HamletYSpeed = -2;
    }
    if (HamletY < 300) {

      HamletYSpeed = 2;
    }
  }
  else if (GamePlay == 3) {
    image(page3, 0, 0, 1200, 700);
    image(hamlet, 100, HamletY, 300, 300);
    HamletY = HamletY + HamletYSpeed;
    if (HamletY > 400) { 
      HamletYSpeed = -2;
    }
    if (HamletY < 300) {

      HamletYSpeed = 2;
    }
  }
  else if (GamePlay == 4) {

    background(255, 78, 42);
    if (mousePressed == true) {
      background(116, 212, 255);
    }
    //Clouds
    for (int i = 0; i<number_of_clouds; i++)
    {
      image(cloud, CloudX[i], 100, 200, 100);
      image(cloud, CloudX[i]-200, 300, 200, 100);
      image(cloud, CloudX[i], 500, 200, 100);
      CloudX[i]=CloudX[i]+CloudXspeed;
    }
    if (mousePressed == true) {
      for (int i = 0; i<number_of_clouds; i++)
      {
        image(cloud2, CloudX[i], 100, 200, 100);
        image(cloud2, CloudX[i]-200, 300, 200, 100);
        image(cloud2, CloudX[i], 500, 200, 100);
      }
    }

    // End Clouds

    //Sheep
    for (int j = 0; j < number_of_sheep; j++)
    {
      float xOff = cos(sheepincrementer*0.005) * 150;
      float yOff = sin(sheepincrementer*0.05) * 100;
      image(sheep, SheepX[j]+xOff, 150+yOff, 130, 130);
      image(sheep, SheepX[j]+xOff, 450+yOff, 130, 130);
      SheepX[j]=SheepX[j]+SheepXspeed;
      sheepincrementer += .001;
    }
    if (mousePressed == true) {
      for (int j = 0; j < number_of_sheep; j++)
      {
        float xOff = cos(sheepincrementer*0.005) * 150;
        float yOff = sin(sheepincrementer*0.05) * 100;
        image(sheep2, SheepX[j]+xOff, 150+yOff, 130, 130);
        image(sheep2, SheepX[j]+xOff, 450+yOff, 130, 130);
      }
    }
    //End Sheep

    //Cows
    for (int k = 0; k < number_of_cows; k++)
    {
      float xOffset = sin(cowincrementer*0.05) * 50;
      float yOffset = cos(cowincrementer*0.008) * 100;
      image(cow, 300+xOffset, CowY[k]+yOffset, 150, 200);
      image(cow, 900+xOffset, CowY[k]+yOffset, 150, 200);
      CowY[k]=CowY[k]+CowYspeed;
      cowincrementer += -.001;
    }
    if (mousePressed == true) {
      for (int k = 0; k < number_of_cows; k++)
      {
        float xOffset = sin(cowincrementer*0.05) * 50;
        float yOffset = cos(cowincrementer*0.008) * 100;
        image(cow2, 300+xOffset, CowY[k]+yOffset, 150, 200);
        image(cow2, 900+xOffset, CowY[k]+yOffset, 150, 200);
      }
    }
    //End Cows




    //Rainbow Trail
    for (int i = 0; i < rainbownumber; i++) {
      Drawing(X_pos[i], Y_pos[i]);
      X_pos[i] += Speed[i];
      Speed[i] += movement;
    }
    if (mousePressed==true) {
      X_pos[Factor] = mouseX;
      Y_pos[Factor] = mouseY;
      Speed[Factor] = -5;
      Factor +=1;
      if (Factor >= rainbownumber) {
        Factor =0;
      }
      //End Rainbow Trail
    }
    //Hamlet the Pig
    image(pig, mouseX, mouseY, 200, 200);
    //End Hamlet
  }
}

void Drawing(float x, float y) {
  smooth();
  noStroke();


  fill(255, 0, 0, 150);
  ellipse(x+60, y+50, 20, 20);
  fill(250, 146, 10, 150);
  ellipse(x+60, y+65, 20, 20);
  fill(255, 255, 0, 150);
  ellipse(x+60, y+80, 20, 20);
  fill(0, 255, 0, 150);
  ellipse(x+60, y+95, 20, 20);
  fill(0, 0, 255, 150);
  ellipse(x+60, y+110, 20, 20);
  fill(140, 10, 250, 150);
  ellipse(x+60, y+125, 20, 20);
  fill(255, 0, 149, 150);
  ellipse(x+60, y+140, 20, 20);
}
void mousePressed() {
  GamePlay++;
  if (GamePlay > 4) {
    GamePlay = 4;
  }
}



