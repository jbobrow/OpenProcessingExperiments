
int numWater = 8;
int numSky = 8;
int numSand = 3;
int numSun = 9;
PImage [] water = new PImage[numWater];
PImage [] sky = new PImage[numSky];
PImage [] sand = new PImage[numSand];
PImage [] sun = new PImage[numSun];
int waves [] = new int[11];
//float wave = 0;
int k = 5;
int p = 4;
boolean a = false;

void setup() {
  size (600, 640);
  background(50, 95, 205);
  smooth();
  frameRate(6);
  for (int i = 0; i < water.length; i++) {
    String name = "water" + (i+1) + ".jpg";
    water[i] = loadImage(name);
  }
  for (int i = 0; i < sky.length; i++) {
    String name1 = "sky" + (i+1) + ".jpg";
    sky[i] = loadImage(name1);
  }
  for (int i = 0; i < sand.length; i++) {
    String name2 = "sand" + (i+1) + ".jpg";
    sand[i] = loadImage(name2);
  }
  for (int i = 0; i < sun.length; i++) {
    String name3 = "sunset" + (i+1) + ".jpg";
    sun[i] = loadImage(name3);
  }
  //  for (int j = -50; j < 51; j +=10) {
  //
  //    for (int i = 0; i < 10; i++) {
  //      waves[i] = j;
  //      //waves[0] = 0;
  //      //println(j);
  //      println(waves[i]);
  //    }
  //  }
  waves[0] = -50;
  waves[1] = -40;
  waves[2] = -30;
  waves[3] = -20;
  waves[4] = -10;
  waves[5] = 0;
  waves[6] = 10;
  waves[7] = 20;
  waves[8] = 30;
  waves[9] = 40;
  waves[10] = 50;


  //noLoop();
}

void draw() {
  //  for (int k = 0; k < numWater; k++) {
  //    for (int i = 0; i < width; i+= 200) {
  //      for (int j = height; j > height/2-1; j-= 80) {
  //        image(water[k], i, j, 200, 80);
  //        println(k);
  //      }
  //    }
  //  }
  //  for (int k = 0; k < numSky; k++) {
  //    for (int i = 0; i < width; i+= 200) {
  //      for (int j = 0; j < height/2; j+= 80) {
  //        image(sky[k], i, j, 200, 80);
  //        println(k);
  //      }
  //    }
  //  }

  dayMode();

  if (mousePressed) {
    //    if (a) {
    //      sunMode();
    //      a=false;
    //    }
    //    else {
    sunMode();
    //      a=true;
    //    }
  }

  image(sand[0], 0, 560, 200, 80);
  image(sand[1], 200, 560, 200, 80);
  image(sand[2], 400, 560, 200, 80);

  waveMotion();

  image(water[0], 0, 400, 200, 80);
  image(water[3], 200, 400, 200, 80);
  image(water[1], 400, 400, 200, 80);

  image(water[5], 0, 480, 200, 80);
  image(water[1], 200, 480, 200, 80);
  image(water[7], 400, 480, 200, 80);

  waveMotion1();

  image(water[3], 0, 240, 200, 80);
  image(water[2], 200, 240, 200, 80);
  image(water[6], 400, 240, 200, 80);
  image(water[2], 0, 320, 200, 80);
  image(water[5], 200, 320, 200, 80);
  image(water[4], 400, 320, 200, 80);
}

void waveMotion() {
  translate(0, waves[k]);
  if (p<k&& k <10 && k>0) {
    p=k;
    k+=1;
  }
  else if (p==k && k >0 && k <10) {
    p=k;
    k+=1;
  }
  else if (p==k && k <10 && k>0) {
    p=k;
    k-=1;
  }
  else if (p>k&& k <10 && k>0) {
    p=k;
    k-=1;
  }
  else if (k==0) {
    p=k;
    k+=1;
  }
  else if (k==10) {
    p=k;
    k-=1;
  }
}
void waveMotion1() {
  translate(0, -waves[k]);
  if (p<k&& k <10 && k>0) {
    p=k;
    k+=1;
  }
  else if (p==k && k >0 && k <10) {
    p=k;
    k+=1;
  }
  else if (p==k && k <10 && k>0) {
    p=k;
    k-=1;
  }
  else if (p>k&& k <10 && k>0) {
    p=k;
    k-=1;
  }
  else if (k==0) {
    p=k;
    k+=1;
  }
  else if (k==10) {
    p=k;
    k-=1;
  }
}

void dayMode() {
  image(sky[0], 0, 0, 200, 80);
  image(sky[6], 200, 0, 200, 80);
  image(sky[2], 400, 0, 200, 80);
  image(sky[3], 0, 80, 200, 80);
  image(sky[4], 200, 80, 200, 80);
  image(sky[5], 400, 80, 200, 80);
  image(sky[1], 0, 160, 200, 80);
  image(sky[7], 200, 160, 200, 80);
  image(sky[0], 400, 160, 200, 80);
}

void sunMode() {    
  image(sun[3], 0, 0, 200, 80);
  image(sun[7], 200, 0, 200, 80);
  image(sun[5], 400, 0, 200, 80);
  image(sun[4], 0, 80, 200, 80);
  image(sun[6], 200, 80, 200, 80);
  image(sun[2], 400, 80, 200, 80);
  image(sun[0], 0, 160, 200, 80);
  image(sun[1], 200, 160, 200, 80);
  image(sun[8], 400, 160, 200, 80);
}



