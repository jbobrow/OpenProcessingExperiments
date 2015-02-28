
PImage img1; //large multi
PImage img2; //large green
PImage img3; //large blue


float easing = .1;
  float ballX = 220;  
int direction = 1;
float y = 450;
float x = 610;
//float Min = 8;
int radius = 40;

void setup() {
  size(620, 480);
  img1= loadImage("largemultimarble.png");
  img2= loadImage("largegreenmarble.png");
  img3= loadImage("largebluemarble.png");
}

void draw() {
  background(81, 25, 164); //background color

  float m = minute();
  float s = second();
  float yPos;
  float xPos;

  m = map(m, 0, 59, 480 - 80, 0); //what minute does
  s = map(s, 0, 59, 135 + radius, 380 + radius); //what second does

if(second()%2 == 0){
  xPos = 220; //even second

}
else{
  xPos = 320; //odd second

}


  float balldx = xPos-ballX;
  if(abs(balldx) > 1){
    ballX += balldx * easing;
  }

  image(img1, 145, m, 80, 80);
  image(img2, 395, m, 80, 80);
  image(img3, ballX, m, 80, 80);

 }


