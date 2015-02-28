
PImage logo;
float[] squigs;
//float r = random(5);
void setup() {
  logo = loadImage("WHITE2.png");
  imageMode(CENTER);
  //frameRate(10);
  size(500, 500);
  smooth();
  strokeWeight(0.9);
  noFill();
  squigs = new float [width+100];
  for (float i = -100; i < squigs.length; i=i+6) { //sets limits
    //squigs[i] = random(0, 255); //sets stroke weight
  }
}
void draw () {

  background(255);
  for (float i = 0; i <squigs.length; i=i+6) { //POSITION X
    for (float j = 0; j <squigs.length; j=j+6) { //POSITION Y


      //      float mx = dist(mouseX, 0, width/2, 0);
      //      float a = map(mx, width/2, 0, 255, 0);
      //      float inverse = 255-mx;
      //      hair(i, random(j));
      hair(i, random(j));
    }
  }

  image(logo, width/2, width/2);
  float mx = dist(mouseX, 0, width/2, 0);
  float a = map(mx, width/2, 0, 255, 0);
  float inverse = 255-mx;
  
  tint(255,inverse-5);
}


