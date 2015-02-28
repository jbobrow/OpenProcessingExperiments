
/* SnowMan version 6-1 variables, 2 buttons active, array of snowflakes, functions.d
 problems with colours
 
 */

//declare numbers for the array
int MAX_SNOWFLAKES = 100000;
int num_snowflakes = 0;

//make an array for snowflakes that include their x, y and diam - size and position

int [] snowflakeX = new int[MAX_SNOWFLAKES];
int [] snowflakeY = new int[MAX_SNOWFLAKES];
int [] snowflakeDiam = new int[MAX_SNOWFLAKES];
color [] snowFlakeColor = new color[MAX_SNOWFLAKES];
color backgroundColor =color(209, 42, 48);
float []snowflakeSpeed=new float [MAX_SNOWFLAKES];
boolean []snowflakeDraw= new boolean [MAX_SNOWFLAKES];

//class for colours of snowflakes?

boolean buttonSnow=false;
boolean buttonLb=false;

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

int buttonX= 20;
int buttonY= 350;
int buttonW= 70;
int buttonH= 35;
int bellyX=200;
int bellyY=300;
int fingerY=270;
int fingerX=260;
int eyeW=5;
int lightX=342;
int lightY=66;



void setup () {
  size(420, 400);
  background(209, 42, 48);
  smooth();
  frameRate(60);
}


void draw() {

  // fingerY=mouseY;

  // Each time new random numbers are creating the snowflakes
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  //y = random(height);
  y = -random(height);
  background(backgroundColor);

  // these random values are creating the colour and size of snowflakes

  if (buttonSnow) { //if snowing button is pressed
    //drawHandsUp(); //draw hands up function

    stroke(0);
    fill(r, g, b, a);

    //ellipse(x, y, diam, diam);

    /*
    //for making a new snowflake
     x = int (random(width));
     y = int (random(height));
     diam = int (random(20));
     
     */
    snowflakeX[num_snowflakes] = int(x);
    snowflakeY[num_snowflakes] = int (y);
    snowflakeDiam[num_snowflakes] = int (diam);
    snowFlakeColor[num_snowflakes] = color(r, g, b, a);
    snowflakeSpeed[num_snowflakes] = random(1, 6); 
    snowflakeDraw[num_snowflakes]=true;  // Pick a random speed
    num_snowflakes++;

    //ellipse(snowflakeX[num_snowflakes], snowflakeY[num_snowflakes], snowflakeDiam[num_snowflakes], snowflakeDiam[num_snowflakes]);
    //background (209, 42, 48);

    for (int i = 0; i < num_snowflakes; i++)
    {
      snowflakeY[i] += snowflakeSpeed[i];
      
      if(snowflakeX[i]> bellyX-40 && snowflakeX[i]<bellyX+40 && snowflakeY[i]> bellyY-120 && snowflakeY[i] < bellyY-20) {
      snowflakeDraw[i]=false;
    } 
   
     // rect(bellyX-40, bellyY-120, 80, 100);
      if (snowflakeDraw[i]) {   //if snowflake draw boolean happen then draw the snow flakes
      stroke(0);
      fill(snowFlakeColor[i]);
      ellipse(snowflakeX[i], snowflakeY[i], snowflakeDiam[i], snowflakeDiam[i]);
      }
     
      // Increment by speed
      //snowflakeY[i] += 3;
    
    }
  } 
  else {
    num_snowflakes=0;
    //background(backgroundColor);
    //drawHandsDown(); //draw hands down
  }

  /*}
   else {
   background (209, 42, 48);
   }
   */
  /*if(buttonColor) {
   stroke(0);
   fill(r, g, b, a);
   ellipse(x, y, diam+10, diam+10);
   } else {
   background(209, 42, 48);
   }
   */

  //in draw, for drawing all snowflakes

  //background (209, 42, 48);


  //ground
  stroke( 0);
  fill(118, 6, 10);
  rect(0, 330, 420, 80);
  fill(255);

  text("Click any key to make snowflakes!", 100, 370);
  
  
  bellyX=mouseX; //this allows the snowman to move based on the mouse x location 
  bellyY=mouseY;// this allows the snowman to move based on the mouse y location 
  drawSnowMan();

  //button that activates the color snowflakes
 // fill (255);
 // rect (buttonX, buttonY, buttonW, buttonH);
 // //fill (0);
  //text("Snowing!", 25, 370);
  //button that activates the colorful snowflakes
  //fill (255, 0, 0, 80);
  // rect (buttonX+300, buttonY, buttonW, buttonH);

  //lightbulb
  fill (254, 255, 10);
  rect( lightX, eyeW*10, eyeW*2, eyeW*4);
  ellipse(lightX+5, eyeW*9, eyeW*5, eyeW*5);
  fill(41, 36, 29, 220);
  rect( lightX+1, eyeW*9, eyeW+2, eyeW*2+3);
  line(lightX, lightY-4, lightX+10, lightY-4);
  line(lightX, lightY, lightX+10, lightY);


  //rectangle to cover light bulb 
  //stroke(0);
 // noFill();
  //rect( lightX-12, lightY-36, lightY/2, lightY-24);
}

void drawSnowMan() {
  //rectangle to check hit -testing
  
 // rect(bellyX-40, bellyY-120, 80, 100);

 //lower belly
  fill(255);
  ellipseMode(CENTER);
  ellipse(bellyX, bellyY, 100, 100);

  //middle belly
  ellipseMode(CENTER);
  ellipse(bellyX, bellyY-50, 60, 60);

  //face 
  ellipseMode(CENTER);
  ellipse(bellyX, bellyY-95, 50, 50);

  //smile
  noFill();
  arc(bellyX+2, bellyY-84, 20, 20, 0.5, PI/1.3);

  //left eye
  ellipseMode(CENTER);
  fill(0);
  ellipse(bellyX-8, bellyY-95, 5, 5);

  //right eye
  ellipseMode(CENTER);
  ellipse(bellyX+15, bellyY-95, 5, 5);

  //nose
  triangle(bellyX+2, bellyY-88, bellyX+4, bellyY-82, bellyX+30, bellyY-88);

  //left hand points down
  line( bellyX-70, bellyY-20, bellyX-25, bellyY-60);

  //left fingers
  line( bellyX-70, bellyY-20, bellyX-80, bellyY-26);
  line( bellyX-70, bellyY-20, bellyX-78, bellyY-6);
  line( bellyX-70, bellyY-20, bellyX-69, bellyY-6);

  //right hand points down
  line( bellyX+23, bellyY-64, bellyX+60, bellyY-30);

  //right fingers
  line (bellyX+61, bellyY-30, bellyX+60, bellyY-20);
  line (bellyX+61, bellyY-30, bellyX+70, bellyY-20);
  line (bellyX+61, bellyY-30, bellyX+73, bellyY-27);

  //right hand up
  //line(226, 240, 260, 200);

  //left hand up
  //line( 180, 245, 130, 200);

  //belly dot high
  fill(0);
  ellipseMode(CENTER);
  ellipse(bellyX+8, bellyY-60, 7, 7);

  //belly dot middle
  fill(0);
  ellipseMode(CENTER);
  ellipse(bellyX+10, bellyY-45, 7, 7);

  //belly dot low
  fill(0);
  ellipseMode(CENTER);
  ellipse(bellyX+8, bellyY-30, 7, 7);

}


void drawHandsUp() {
}

void drawHandsDown() {
}

void mousePressed() {

  //when button is pressed snowflakes appear
  if (mouseX> buttonX && mouseX< buttonX+buttonW && mouseY> buttonY && mouseY< buttonY+buttonH) {
    buttonSnow= !buttonSnow;
  }
  //when lightbulb is pressed, background change color
  if (mouseX>330 && mouseX< 366 && mouseY>30 && mouseY<72) {
    buttonLb=!buttonLb;
    if (buttonLb) {
      backgroundColor=0;
    }
    else {  
      backgroundColor=color(209, 42, 48);
    }
    //background(backgroundColor);
  }
}


void keyPressed() {
  //when a key is pressed the background either returns to nuteral or activates the snowflakes. 
   buttonSnow= !buttonSnow;
}

/*void move() {
  float speed; // Speed of raindrop
  speed = random(1, 5);   // Pick a random speed

  // Increment by speed
  y += speed;
}
*/

