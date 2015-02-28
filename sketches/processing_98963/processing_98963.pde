
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
float CloudXspeed = -1.5;

float myFloat = 1.616;
Sheep jules = new Sheep(20, 30, 40, 100);
Sheep mary = new Sheep(200, 30, 40, 100);
Sheep [] julian = new Sheep[number_of_sheep];


void setup() {
  size(1200, 600);
  for (int i = 0; i < number_of_clouds; i++) {
    CloudX[i] = 1160 + i*400;
  }
  for (int j = 0; j < number_of_sheep; j++) {
    SheepX[j] = 1400 + j*200;
  }
  for (int k = 0; k < number_of_cows; k++) {
    CowY[k] = 800 + k*300;
  }
  int sheepCounter = 0;
  for (int i =0; i < 20; i++) {
    for (int j = 0; j<10; j++) {
      julian[sheepCounter] = new Sheep(100 + i*200, j * 100, 40, 40);
      sheepCounter ++;
    }
  }
}
void draw() {
  background(200);
  //Clouds
  fill(255);
 /* for (int i = 0; i<number_of_clouds; i++)
  {
    ellipse(CloudX[i], 100, 200, 100);
    ellipse(CloudX[i]-200, 300, 200, 100);
    ellipse(CloudX[i], 500, 200, 100);
    CloudX[i]=CloudX[i]+CloudXspeed;
  }
  // End Clouds

  //Sheep
  for (int j = 0; j < number_of_sheep; j++)
  {
    float xOff = cos(sheepincrementer*0.005) * 150;
    float yOff = sin(sheepincrementer*0.05) * 100;
    ellipse(SheepX[j]+xOff, 150+yOff, 130, 130);
    ellipse(SheepX[j]+xOff, 450+yOff, 130, 130);
    SheepX[j]=SheepX[j]+SheepXspeed;
    sheepincrementer += .001;
  }

  //End Sheep

  //Cows
  for (int k = 0; k < number_of_cows; k++)
  {
    float xOffset = sin(cowincrementer*0.05) * 50;
    float yOffset = cos(cowincrementer*0.008) * 100;
    ellipse(300+xOffset, CowY[k]+yOffset, 150, 200);
    ellipse(900+xOffset, CowY[k]+yOffset, 150, 200);
    CowY[k]=CowY[k]+CowYspeed;
    cowincrementer += -.001;
  }
  //End Cows


  //Hamlet the Pig
  ellipse(mouseX, mouseY, 200, 200);
  //End Hamlet
  jules.display();
  mary.display();*/
  for (int i =0; i < number_of_sheep; i++) {
    julian[i].display();
    //julian[0].display();
  }
}

class Sheep {
  float  x, y, w, h;
  float startX, startY;
  int fillColor = 255;
  Sheep (float initX, float initY, float  initW, float initH) {
    startX = initX;
    startY = initY;
    w = initW;
    h = initH;
    fillColor = 255;
  }
  void display() {
    fill(fillColor);
    x = cos(sheepincrementer*0.005) * 150;
    y = sin(sheepincrementer*0.05) * 100;
    ellipse(x + startX, y + startY, w, h);
    sheepincrementer += .001;
  }
  void checkClick() {
    if (dist(mouseX, mouseY, x + startX, y + startY)  < w/2) {
      fillColor = 0;
    }
  }
}
void mousePressed() {
  for (int i =0; i < number_of_sheep; i++) {
    julian[i].checkClick();


    //for loop to loop through all sheep
    //julian[i].checkClick();
  }
  jules.checkClick();
  mary.checkClick();
}
