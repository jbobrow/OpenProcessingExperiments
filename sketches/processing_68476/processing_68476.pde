
PFont myFont; //font variable
float[] x=new float[1000];//first snow
float[] y=new float[1000];
float[] num=new float[1000];
PImage snow;
PImage face;
PImage snowman;
float count=0;  //number of mouse click 
snow[] ball= new snow[100];//bouncing snowball

float speed[] = new float [1000];
int e;
int i;

void setup() {
  size(400, 400); //canvas size
  smooth();

  for (i=0;i<1000;i++) {//first page snow array 
    x[i]=random(10, width);  //x coordination (random 10~400)
    y[i]=random(10, height);  //y coordination (random 10~400)
    num[i]=random(5, 10);  //size of snow
    speed[i]=random(1); //snow speed (0~1 random)
  }
  snow = loadImage("snow-01.png"); //snow background
  snowman = loadImage("snowman.png");  //snowman image
  smooth();
  for (int s = 0; s < ball.length; s++) {
    ball[s] = new snow();//snow bouncing array
  }
}


void draw() {
  background(123, 100, 96);
  fill(255); 
  for (int e=0; e<1000; e++) {  //1000 snow
    x[e] = x[e] + speed[e];
    y[e] = y[e] + speed[e];
    noStroke();
    ellipse(x[e], y[e], num[e], num[e]);
  }
  image(snow, 0, 330);  //place snow background

  myFont = createFont("Helvetica", 50, true);  //font setting
  textFont(myFont);
  fill(160, 191, 188);
  textSize(20);
  text("MAKE A SNOWMAN", 10, 20);


  if (count==1) {  // first mouse click
    fill(250, 246, 237);  //snowman body
    ellipse(100, 300, 80, 80);
  }
  else if (count==2) {//second mouse click
    fill(250, 246, 237);  //snowman body
    ellipse(100, 300, 120, 120);
  }
  else if (count==3) {  //third mouse click
    fill(250, 246, 237);  //snowman head and body
    ellipse(100, 300, 120, 120);
    ellipse(100, 200, 90, 90);
    showmessage();  //text appear 
  }
  else if (count==4) {// fourth mouse click
    background(160, 191, 188); //change background color
    fill(250, 246, 237);
    image(snowman, 120, 120);  //replace image
    image(snow, 0, 330);
    for (int i=0; i<1000; i++) {  //1000 snow array
      x[i] = x[i] + speed[i];
      y[i] = y[i] + speed[i];
      noStroke();
      ellipse(x[i], y[i], num[i], num[i]);  //snow
    }
  }
  else if (count>=5) { // if you click more than 5
    background(160, 191, 188);  //background color
    image(snowman, 120, 120);  //replace iamges
    image(snow, 0, 330);
    for (int s = 0; s < ball.length; s++) { // snow bouncing
      ball[s].move();
      ball[s].snowball();
      count=5;
    }
  }
}


void mousePressed() {  //mouse click (count is increasing)
  count+=1;
}

void keyPressed() {  //go to first frame
  count=0;
}

void showmessage() {  //text message
  myFont = createFont("Helvetica", 50, true);
  textFont(myFont);
  fill(255);
  textSize(15);
  text("Give the snowman a face", 180, 250);
}

class snow {  //snow class
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float ballsize;

  snow () {  //snow attribute
    xpos = random(400);
    ypos = random(400);
    xspeed = random(1, 5);
    yspeed = random(1, 5);
    ballsize = random(1, 5);
  }


  void move() {// boucing inside canvas
    if (xpos+(ballsize/2) > 400 || xpos-(ballsize/2) < 0) { 
      xspeed = xspeed * (-1); //x coordinate inverse
    }
    if (ypos+(ballsize/2) > 400 || ypos-(ballsize/2) < 0) {
      yspeed = yspeed * (-1); //y coordinate inverse
    }
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
  }

  void snowball() {  //snowball 
    fill(255);
    ellipse(xpos, ypos, ballsize, ballsize);
  }
}


