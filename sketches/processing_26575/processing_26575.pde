
/*that is a food catching game, every food has different score and becarfull the rotten eggs
  if you touched that rotten egg game will be over~
  the limitation of time is 60 seconds
  Have Fun~*/

PFont font1;//font for game over
PFont font2;//font for score and timer
PImage Bimg;//background image
PImage F_icecream;//icecream image
PImage F_orange;//orange image
PImage F_cherry;//cherry image
PImage egg;//bad egg image
PImage ball;//catcher image
PImage cloud1;
PImage cloud2;
PImage cloud3;

float[] y_icecream = new float[2000];//totaly 2000 icecreams 
float[] y_orange = new float[2000];//totaly 2000
float[] y_cherry = new float[1800];
float[] y_egg = new float[3000];
float[] x_cloud1 = new float[10];
float[] x_cloud2 = new float[10];
float[] x_cloud3 = new float[10];

float theta;//rotate angle for catcher
float speed = 1;
int diameter =200;
float TUx;
float TUy;

int time1=60000;
int seconds=60000;//60 seconds;
String secondsBox=nfc(seconds);// tansfer timer number in to text box
String clock = "Game Over!";//game over string

int score=0;//score beging as "0"
String scoreBox=nfc(score);//tansfer score number in to text box

int currentTime = millis();


void setup() {
  size(600,450);
  String scoreBox=nfc(score);//display score at first
  
  Bimg = loadImage("star2.jpg");
  ball = loadImage("ball.gif");
  font1 = loadFont("ArialMT-48.vlw");
  font2 =loadFont("ArialMT-18.vlw");
  
  //display clouds in different size
  cloud1 = loadImage("cloud1.png");
  for (int i = 0; i < x_cloud1.length; i++) {
    x_cloud1[i] = random(-4500, 450);
  }
  cloud2 = loadImage("cloud2.png");
  for (int i = 0; i < x_cloud2.length; i++) {
    x_cloud2[i] = random(-4500, 450);
  }
  cloud3 = loadImage("cloud3.png");
  for (int i = 0; i < x_cloud3.length; i++) {
    x_cloud3[i] = random(-4500, 450);
  }
  
  //display icecreams in different places  
  F_icecream = loadImage("icecream.gif");
  for (int i = 0; i < y_icecream.length; i++) {
    y_icecream[i] = random(-45000, 0);
  }
  //dispaly oranges in different places
  F_orange = loadImage("orange.gif");
  for (int i = 0; i < y_orange.length; i++) {
    y_orange[i] = random(-60000, 450);
  }
  //display cherries in different places
  F_cherry = loadImage("cherry.gif");
  for (int i = 0; i < y_cherry.length; i++) {
    y_cherry[i] = random(-60000, 450);
  }
  //display bad eggs in different places
  egg = loadImage("egg.gif");
  for (int i = 0; i < y_egg.length; i++) {
    y_egg[i] = random(-60000, 450);
  }

  theta=0.0;//ball rotate begin
}


void draw() {
  int currentTime = millis();

  //println(currentTime);
  image(Bimg,0,0);
  //scoreBox
  String scoreBox=nfc(score);//update score box
  fill(0);
  textFont(font2);
  text(scoreBox,25,40,200,200);//font for score box

  cloud1();
  cloud2();
  cloud3();
  tick();//timer changed every second

  if(currentTime< time1) {           //boolean for checking the timer
    String secondsBox=nfc(seconds);
    fill(0);
    textFont(font2);
    text(secondsBox,520,40,200,200);
    tick();

    //display every fruit
    icecream();
    orange();
    cherry();
    egg();
    fill(0);
    textFont(font2);
    text(scoreBox,25,40,200,200); 
    
    cursor(HAND);//change the cursor to be hand

      ballRotate(mouseX,mouseY);
  }
  else {
    image(ball,300,225,50,50);//if time is over 60 seconds then game's over
    timesUp();
  }
}





//cloud function
void cloud1() {
  for (int i = 0; i < x_cloud1.length; i++) {
    x_cloud1[i] += 0.4;
    float y = i * 6;
    image(cloud1,x_cloud1[i],y,y*5,y*2);
  }
}

void cloud2() {
  for (int i = 0; i < x_cloud2.length; i++) {
    x_cloud2[i] += 0.3;
    float y = i * 6;
    image(cloud2,x_cloud2[i],y,i*30,i*15);
  }
}

void cloud3() {
  for (int i = 0; i < x_cloud3.length; i++) {
    x_cloud3[i] += 0.2;
    float y = i * 6;
    image(cloud3,x_cloud3[i],y,y*5,y);
  }
}




//fruits function
void icecream() {
  //create icecream arraylist
  for (int i = 0; i < y_icecream.length; i++) {
    y_icecream[i] += 3;
    float x = i * 6;
    image(F_icecream,x,y_icecream[i]);
    
    //if icecream be catched
    if(x-30<mouseX&&mouseX<x+30 && y_icecream[i]-30<mouseY&&mouseY<y_icecream[i]+30) {
      score= score+2;//score +2
      fill(0);
      textFont(font2);
      text(scoreBox,25,40,200,200);
      y_icecream[i]=-100;//that object dispeared
    }
  }
}

void orange() {
  //create orange arraylist
  for (int i = 0; i < y_orange.length; i++) {
    y_orange[i] += 5;
    float x = i * 6;
    image(F_orange,x,y_orange[i]);
    //if orange be catched
    if(x-30<mouseX&&mouseX<x+30 && y_orange[i]-30<mouseY&&mouseY<y_orange[i]+30) {
      score= score+1;//score+1
      fill(0);
      textFont(font2);
      text(scoreBox,25,40,200,200);
      y_orange[i]=-100;//that object dispeared
    }
  }
}

void cherry() {
  //create cherries arraylist
  for (int i = 0; i < y_cherry.length; i++) {
    y_cherry[i] += 4;
    float x = i * 6;
    image(F_cherry,x,y_cherry[i]);
    
    //if orange be catched
    if(x-30<mouseX&&mouseX<x+30 && y_cherry[i]-30<mouseY&&mouseY<y_cherry[i]+30) {
      score= score+5;
      fill(0);
      textFont(font2);
      text(scoreBox,25,40,200,200);
      y_cherry[i]=-100;//that object dispeared
    }
  }
}

void egg() {
  //create bad egg arraylist
  for (int i = 0; i < y_egg.length; i++) {
    y_egg[i] += 8;//egg drop speed
    float x = i * 6;
    image(egg,x,y_egg[i]);
    
    //if orange be catched
    if(x-40<mouseX&&mouseX<x+40 && y_egg[i]-40<mouseY&&mouseY<y_egg[i]+40) {
      timesUp();//dead gameover~
      time1=0;
      y_egg[i]=-100;//that object dispeared
    }
  }
}




//time is over 60 seconds than game is over
void timesUp() {
  fill(TUx+255,TUy,TUx);
  noStroke();
  ellipse(TUx+300, TUy+225, diameter, diameter);
  TUx += random(-speed,speed);
  TUy += random(-speed,speed);
  fill(255,255,255);
  noStroke();
  textFont(font1);
  text(clock,TUx+240,TUy+190,200,200);
}


//ball rotate function
void ballRotate(int x, int y) {
  translate(x,y);
  rotate(theta);
  image(ball,-y*0.1,-y*0.1,y*0.2,y*0.2);
  theta+=0.1;//rotate speed
}

//timer tiktak
void tick() {
  seconds-=5;
}


