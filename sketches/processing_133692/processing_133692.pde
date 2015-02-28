
int counter = 0;
int amount = 256;
int alpha;
float[] speed = new float[amount];
float[] posY = new float[amount];
float[] posX = new float[amount];


void setup() {
  size(512,512);
  noStroke();
  createArrays();
}

void createArrays() {
  for(int i=0; i<amount; i++) {
    speed[i]=random(1,4);
    posX[i]=random(0,width);
    posY[i]=random(0,height);
  }
}

void draw() {
  counter++;
  
  // DRAW BACKGROUND. TRANSPARENCY DEPENDS ON Y-POSITION OF MOUSE.
  fill(0,0,0,map(mouseY,0,height,0,255));
  rect(0,0,width,height);
  
  // DRAW NUMBER OF SNOWFLAKES STORED IN THE ARRAY
  for(int i=0; i<amount; i++) {
    fill(255,map(speed[i],2,4,128,255));
    ellipse(posX[i],posY[i],speed[i],speed[i]);
    posY[i]+=speed[i];
    
    // IF SNOWFLAKE REACHES BOTTOM PLACE IT AT TOP AGAIN
    if (posY[i]>height) {
      posY[i]=0;
      posX[i]=random(width);
    }
  }
}


