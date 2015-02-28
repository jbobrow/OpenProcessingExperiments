
// The next line is needed if running in JavaScript Mode with Processing.js
 //@pjs preload="mypic.png"; 

PImage hotair;
PImage clouds;
PImage flame;
PImage bird;
float skyX=1;
float birdX=1;
float birdX2=1;
float birdX3=1;
int groundLevel=505;
float hotairY;
float hotairX;

//score
String name = "Coins: ";
int score = 0;
int scoretime = 0;

//bird and coin array

float[] birdXs = {0, 0, 0, 0};
float[] birdYs = {120, 140, 220, 260};
int[] velocities = {1, 2, 1, 3};

float[] coinXs = {60, 100, 10, 660};
float[] coinYs = {80, 135, 240, 190};




int direction = 0;
float speed = 1;
int boom = 0; 

//start and end screens
boolean startscreen;
boolean end;

void setup() {
  size(1000,400);
  frameRate(60);
  startscreen = true;
  end= false;
  bird = loadImage("bird3.png");
  hotair = loadImage("hotairballoon1.png");
 clouds = loadImage("clouds1.jpg");
  flame=loadImage("flame.png");
 flame.resize(0, 90);
 bird.resize(0,75);
 hotair.resize( 0, 75);


    hotairY=(height/2)-(hotair.height/2);
   hotairX=(width/2)-(hotair.width/2);
    
     for (int j=0; j<2; j++)
  {
    if (j/2 == 0){
      birdYs[j] = random(80, 40);
    }
        for (int i=0; i<2; i++)
  {
    if (i/2 == 0){
      coinYs[i] = random(50, 70);
    }

 } 
  }
}
void draw() {
  
  if (startscreen==true) { //thanks william
  image(clouds, int(skyX),0);
   skyX+=speed; //draw sky
   skyX%=width;
  image(clouds, int(skyX)-clouds.width,0);
     
    textSize(26);    
    text("HOT AIR",450,300); //welcome message
   textSize(50);
    text("click to start",370,350);
    
    } else //draw rest of function
    {
      if (end == false) {
 skyX+=speed;
 skyX%=width;
 image(clouds, int(skyX),0);
 
image(clouds, int(skyX)-clouds.width,0);

       //check that the hotair hasnt been in a collision, if not, draw it
if((boom==0)){
image(hotair,hotairX,hotairY);
}
 for(int j=0;j<birdXs.length;j++){ //hotair and birds intersect
    drawBird(birdXs[j], birdYs[j], velocities[j], j );
    if(((birdXs[j]>=hotairX)&&(birdXs[j]<=hotairX+hotair.width))&&((birdYs[j]>=hotairY)&&(birdYs[j]<=hotairY+hotair.height))) {
  image(flame, hotairX, hotairY);
 end = true;
 fill(250,250,250);
  textSize(26);
   text("You just killed some honeymooners!",450,300);
    text("CLICK TO START AGAIN",480,330);
     textSize(18);
     text("P.S try not to kill people this time...",490,350);
 
  
}
for(int i=0;i<coinXs.length;i++){ // hotair and coins intersect
    drawCoin(coinXs[i], coinYs[i], velocities[i], i);
    if(((coinXs[i]>=hotairX)&&(coinXs[i]<=hotairX+hotair.width))&&((coinYs[i]>=hotairY)&&(coinYs[i]<=hotairY+hotair.height))) {
     println("coinX: "+coinXs[i]+" hotairX"+hotairX);
      textSize(40);
      text("YAY!", hotairX, hotairY);
      score++;
     coinXs [i] = 20;
 fill(0);
  }
  textSize(18);  
text("Coins: "+score, 26, 30, 240, 100);
  }
    }
}
}
}

void drawBird(float startX, float startY, int velocity, int index){
  //generate new random y value
  
  image(bird, int(startX), int(startY));
  startX+=velocity*2;
  startX%=width;
 
 birdXs[index]=startX;
}


void drawCoin(float startX, float startY, int velocity, int index){
    fill(#FFF06A);
    ellipse(startX, startY, 20,20);
   startX+=speed/5;
  startX%=width;
 
 coinXs[index]=startX;
}

  
void mouseClicked() {
   
  if (startscreen==true){
  image(clouds, int(skyX),0);
 
    startscreen = false;
      image(clouds, int(skyX),0);
  }
      if (end==true){
 setup();
 end = false;  //click mouse to restart game
   image(clouds, int(skyX),0);
   fill(250,250,250);
}
 
 

}

void keyPressed() {
  //println(hotairY+","+groundLevel);
  
  
if (key == CODED) {
    if (keyCode == UP) {
      if(hotairY>0){
      hotairY-=6;
    }
    } 
      else if (keyCode == DOWN) {
      //  println("check groundlevel");
       if(hotairY+hotair.height<groundLevel){
        hotairY+=7;
    }
  }
      }
  }


