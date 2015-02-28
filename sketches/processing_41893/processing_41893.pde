
PFont f;
PImage[] unowns;
PImage[] alphaunown;
int[] dh, dw;
//int m;
//int lastMinute;
int heig = 0;
int mod3;


void setup(){
  size(580,320);
  frameRate(20);
  noStroke();
  f = createFont("AngsanaNew-Italic-48.vlw", 48, true);
  unowns = new PImage[10];
  alphaunown = new PImage[28];
  for(int i = 0; i<10; i++){
    unowns[i] = loadImage("unown"+i+".png");
  }
  for(int i = 0; i<28; i++){
    alphaunown[i] = loadImage("201_"+ (i+1) +".png");
  }
  dh = new int[4];
  dw = new int[4];
}


void draw(){
  //call time
  int m = minute();
  int s = second();
  int h = hour()%12;
  //int milli = millis()%1000;
  int h1 = h/10;
  int h2 = h%10;
  int m1 = m/10;
  int m2 = m%10;
  
  //background
  background(95, 73, 24);
  for (int r = 0; r<16; r++)
  {
    for(int c = 0; c<15; c++)
    {
      fill(165,123,24);
      if(r % 2 == 1)
      {
        rectMode(CENTER);
        rect(5+c*40, 13+r*20, 35, 15);
      }
      else{
        rectMode(CORNER);
        rect(5+c*40, 5+r*20, 35, 15);
      }
    }
  }
  
  //draw unowns - set location
  int widSt = 75;
  int shft = 5;
  for(int i = 0; i<4; i++){
    dw[i] += random(-shft, shft);
    dh[i] += random(-shft, shft);
    dh[i] = constrain(dh[i], -60, 60);
    dw[i] = constrain(dw[i], -60, 60);
  }
  //if time has changed, switch on animation
  //draw unowns(actually!)
  if(heig < 130)
  {
    image(unowns[h1], widSt+(130*0) + dw[0], heig + dh[0]);
    image(unowns[h2], widSt+(130*1) + dw[1], heig + dh[1]);
    image(unowns[m1], widSt+(130*2) + dw[2], heig + dh[2]);
    image(unowns[m2], widSt+(130*3) + dw[3], heig + dh[3]);
    heig += 5;
  }
  else{
    image(unowns[h1], widSt+(130*0) + dw[0], heig + dh[0]);
    image(unowns[h2], widSt+(130*1) + dw[1], heig + dh[1]);
    image(unowns[m1], widSt+(130*2) + dw[2], heig + dh[2]);
    image(unowns[m2], widSt+(130*3) + dw[3], heig + dh[3]);
  }
  for(int i = 0; i<s; i++)
  {
    image(alphaunown[int(random(0,26))], random(0, 580), random(0, 320));
  }  
  //fill(0);
  //textFont(f);
//    if (m != lastMinute)
  {
    //mode = 1;
    //update the last second
//    lastMinute = m;
    //this variables will be the same until
    //the next second change in the clock
  }
  /*if (mode == 1){
      if(heig+dh[3]+mod3 < height + 100){
        image(unowns[h1], widSt+(130*0) + dw[0], heig + dh[0]);
        image(unowns[h2], widSt+(130*1) + dw[1], heig + dh[1]);
        image(unowns[m1], widSt+(130*2) + dw[2], heig + dh[2]);
        image(unowns[m2], widSt+(130*3) + dw[3], heig + dh[3]+mod3);
        mod3 += 5;
      }
      else if(heig+dh[3]+mod3 >= height + 100){
        image(unowns[h1], widSt+(130*0) + dw[0], heig + dh[0]);
        image(unowns[h2], widSt+(130*1) + dw[1], heig + dh[1]);
        image(unowns[m1], widSt+(130*2) + dw[2], heig + dh[2]);
        image(unowns[lastMinute%10], widSt+(130*3) + dw[3], heig + dh[3] - mod3);
        mod3 -=5;
      }
      if(
      
  }*/
}

