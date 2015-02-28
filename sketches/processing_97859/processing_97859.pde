
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
}
void draw() {
  background(200);
  //Clouds
  for (int i = 0; i<number_of_clouds; i++)
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
}

