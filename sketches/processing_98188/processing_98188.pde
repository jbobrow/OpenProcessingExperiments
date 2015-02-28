
//Charlotte Lim
//Week 9 homework
//"animation"

PImage bg;
PImage[] dp = new PImage[7];

int[] xVal = {30, 120, 260, 340, 420, 560, 680};

int row1 = 65;
int row2 = 140;
int row3 = 215; 
int row4 = 290; 

void setup(){
  
  size(800, 480);
  
  //loading images
  bg = loadImage("bg.jpg");  
  dp[0] = loadImage("dp1.png");
  dp[1] = loadImage("dp2.png");
  dp[2] = loadImage("dp3.png");
  dp[3] = loadImage("dp4.png");
  dp[4] = loadImage("dp5.png");
  dp[5] = loadImage("dp6.png");
  dp[6] = loadImage("dp7.png");
}

void draw(){  
  
  image(bg, 0, 0);
  
  image(dp[0], xVal[0], row4);
  image(dp[1], xVal[1], row1);
  image(dp[2], xVal[2], row2);
  image(dp[3], xVal[3], row4);
  image(dp[4], xVal[4], row3);
  image(dp[5], xVal[5], row1);
  image(dp[6], xVal[6], row3);
  
  for (int i=0 ; i<=6 ; i++){
    xVal[i] -= 2;
    if (xVal[i] <= -45){
      xVal[i] = 800;
    }  
  }

}


