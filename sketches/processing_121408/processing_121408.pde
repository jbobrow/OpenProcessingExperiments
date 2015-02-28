
float theta = 0.0;
PImage imgDay;
PImage imgNight;
PImage imgMask;
float z = 0;
void setup() {
  size(700,394);
  smooth();
  imgNight = loadImage("worldNight.png");
  imgDay = loadImage("worldDay.png");

}

void draw() {
  background(0);

  imgMask = loadImage("worldMasks3.png");
  //imgDay.mask(imgMask);
  int imageSize = width * height;
  int[] alpahas=new int[imageSize];
  for (int n=0;n<imageSize;n++) {
   //if(n%width<theta*100) alpahas[n]=0;
   if(n%width<theta*100) alpahas[n]=0;
   else alpahas[n]=255;
   
   if (theta>8){
     theta=0;
     alpahas[n]=255;
   }
   
  }
  imgDay.mask(alpahas);
  image(imgNight,0,0);
  image(imgDay,0,0);

  theta += .02;
  noStroke();
  fill(255);
  float x = theta;

  //for (int i = 0; i <= 255; i++) {
    //float y = sin(x)*height/2;
   // ellipse(i*10,y + height/2,8,8);
   // x += 0.2;
    

println(theta);
  }


