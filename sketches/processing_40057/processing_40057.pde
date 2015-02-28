
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

//class for colours of snowflakes?

boolean buttonColor=false;
boolean buttonBg=false;

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


 
  // Each time new random numbers are creating the snowflakes
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(20);
  x = random(width);
  y = random(height);

  
  // these random values are creating the colour and size of snowflakes
  
if (buttonColor) {
  stroke(0);
  fill(r, g, b, a);
  ellipse(x,y,diam,diam);
  
    
  //for making a new snowflake
x = int (random(width));
y = int (random(height));
diam = int (random(20));


snowflakeX[num_snowflakes] = int(x);
snowflakeY[num_snowflakes] = int (y);
snowflakeDiam[num_snowflakes] = int (diam);

num_snowflakes++;

  
  } else {
  background(209, 42, 48);
}
if(buttonBg) {
  background(0);
 }else {
 background (209, 42, 48);
}
 /*if(buttonColor) {
 stroke(0);
 fill(r, g, b, a);
 ellipse(x, y, diam+10, diam+10);
  } else {
   background(209, 42, 48);
  }
 */
 
 //in draw, for drawing all snowflakes
for (int i = 0; i < num_snowflakes; i++)
{
  noStroke();
  fill(255);
  ellipse(snowflakeX[i],snowflakeY[i],snowflakeDiam[i],snowflakeDiam[i]);
}
  //background (209, 42, 48);
 
  
//ground
stroke( 0);
fill(118, 6, 10);
rect(0, bellyY+30, bellyY+120, lightY+14);
fill(255);

text("click the snow button to make snowflakes!",100, 370);

 drawSnowMan();

//button that activates the color snowflakes
  fill (255);
  rect (buttonX, buttonY, buttonW, buttonH);
  fill (0);
  text("Snowing!", 25, 370);
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
stroke(0);
noFill();
rect( lightX-12, lightY-36, lightY/2, lightY-24);

}
void drawSnowMan() {
  
    //lower belly
    stroke(0);
    fill(255);
    ellipseMode(CENTER);
    ellipse(bellyX,bellyY,bellyX/2,bellyX/2);
    
    //middle belly
    ellipseMode(CENTER);
    ellipse(bellyX, bellyY-50, bellyY/5, bellyY/5);
    
    //face 
    ellipseMode(CENTER);
    ellipse(bellyX, bellyX+5, bellyX/4, bellyX/4);
    
    //smile
    noFill();
    arc(bellyX+2, bellyX+16, eyeW*4, eyeW*4, 0.5, PI/1.3);
    
    //left eye
    ellipseMode(CENTER);
    fill(0);
    ellipse(bellyX-8, bellyX+5, eyeW, eyeW);
    
    //right eye
    ellipseMode(CENTER);
    ellipse(bellyX+15, bellyX+5, eyeW, eyeW);
    
    //nose
    triangle(bellyX+2, bellyX+12, bellyX+4, bellyX+18, bellyX+30, bellyX+12);
    
    //left hand points down
    line( fingerX/2, fingerY+10, fingerX/2+45, fingerX-20);
    
    //left fingers
    line( fingerX/2, fingerY+10, fingerX/2-10, fingerY+14);
    line( fingerX/2, fingerY+10, fingerX/2-8, fingerY+24);
    line( fingerX/2, fingerY+10, fingerX/2, fingerY+24);
    
    //right hand points down
    line( fingerX-37, fingerX-24, fingerX, fingerY);
    
    //right fingers
    line (fingerX+1, fingerY, fingerX, fingerY+10);
    line (fingerX, fingerY, fingerY, fingerY+10);
    line (fingerX+1, fingerY, fingerY+3, fingerY+3);
    
    
    
    //left hand up
    //line( 180, 245, 130, 200);
    
    //belly dot high
    fill(0);
    ellipseMode(CENTER);
    ellipse(bellyX+8, bellyX+40, eyeW+2, eyeW+2);
    
    //belly dot middle
    fill(0);
    ellipseMode(CENTER);
    ellipse(bellyX+10, bellyX+55, eyeW+2, eyeW+2);
    
    //belly dot low
    fill(0);
    ellipseMode(CENTER);
    ellipse(bellyX+8, bellyY-30, eyeW+2, eyeW+2);
    
}



void mousePressed() {

  //when button is pressed snowflakes appear
  if (mouseX> buttonX && mouseX< buttonX+buttonW && mouseY> buttonY && mouseY< buttonY+buttonH) {
  buttonColor= !buttonColor; 
  }
  //when lightbulb is pressed, background change color
if (mouseX>330 && mouseX< 366 && mouseY>30 && mouseY<72) {
 buttonBg=!buttonBg;
}

}


void keyPressed() {
 //when a key is pressed the snowflakes disspear, background returns
background(209, 42, 48);
}

