
/*Title: Game-based Clock: Breathing
 Created: September 24, 2012
 by: Min Fan
 Email:mfan1028@gmail.com
 */

//Description:
//P1 Display the progress of time in a non-traditional way.
//**********************************************************
//This is a game-based clock which displays a beatiful and vivid picture of the ocean.
//The background pictures, sun's position and the big waves's transparency will be changed according to the hour(h).
//The number of the rectangle waves will accumulate with the time of minute(m).
//The sunshine in the daytime and the star in the night will show the frequency of second(s).
//Users could play with the game by shooting bubbles(drops of water) to let the big fish get enough oxygen.
//Their score will also be displaced on the left upper corner.
//There is no win or lose in this game. Users can play around it and feel the time flies when they have fun. 

//Issues
//If Users never click mouse, the drop will not continue to fall down.
//Processing requires lager memory to run it. Please change it in prefernece first. 

//Future Ideas
/*The orignial intent of this project was to allow the frequency of drop water represent the second. In this case, the frequency of user click the mouse(to shot the object) will show the second. 
 So the clock will work perfectly by the efforts of users and itself. However, I couldn't fix how to let each object fall off in every second and continues to fall off even without any mouse clicking.
 Hope I can implement it in the future.*/

/*Import the audio libary*/
import ddf.minim.*;


/*Declare global variables and assign value to some of them*/
//Declare the reference named minim in the class of Minim
Minim minim;
AudioPlayer au_player1, au_player2;
//Declare the variable named score with type of integer.
int score;
//Declare the variable named ballSize with type of integer and assign the value 15 to it.
int ballSize = 15;
//Declare the variable named s with type of integer.
int s;                               
//Declare the variable named h with type of integer.
int h;
//Declare the variable named m with type of integer and assign minute() to it.
int m=minute();   
/*How far apart should each horizontal location be spaced*/
//Declare the variable named xsapcing with type of integer and assign the value 13 to it.
int xspacing =13;                
/*Total numbers of waves to add together*/
//Declare the variable named maxwaves with type of integer and assign value 4 to it.
int maxwaves = 4;                     
//Declare the variable named pos with type of integer.
int pos;
//Declare the variable named rel with type of integer.
int rel;
//Declare the variable named numLines with type of integer.
int numLines;

/*Height of wave*/
//Declare the array named amplitude with type of float and assign its length with m+4
float[] amplitude = new float[m+4];   
/*Value for incrementing X, to be calculated as a function of period and xspacing*/
//Declare the array named amplitude with type of float and assign its length with m+4
float[] dx = new float[m+4];        
/* Using an array to store height values for the wave (not entirely necessary)*/
//Declare the array named yvalues with type of float.
float[] yvalues;                    
//Declare the variable named theta with type of float and assign it the value 0
float theta = 0.0f;

//Declare the variable named fire with type of boolean and assign it false
boolean fire = false;

//Declare varibles with type of PImage and named with  img1, img2, img3, img4, img5, img6, img7,img8,img9 respectively
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9;

//Declare a variable named GetRandomX with type of integer and assign it value with random(600).
int getRandomX()
{
  return int(random(600));
}

//Declare the array named ballx[] with type of integer and assign values to it 
int[] ballx = { 
  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()
  };
  //Declare the array named bally[] with type of integer and assign values to it 
int[] bally = { 
  0, 0, 0, 0, 0
};


//declare the function named setup
void setup()
{
  //Create a new object Minim and linked it to the reference named minim
  minim=new Minim(this);
  au_player1=minim.loadFile("music.mp3");
  au_player2=minim.loadFile("bubble.mp3");

  //loop the audio
  au_player1.loop();
  //set the canvas with width 900 and height 500
  size (900, 500);
  //set the colorMode
  colorMode(RGB, 255, 255, 255, 100);
  //turn on the smooth function
  smooth ();
  //set the frameRate as 30
  frameRate(30);
  //assign time1.png to img1
  img1=loadImage("time1.png");
  //assign time2.png to img2
  img2=loadImage("time2.png");
  //assign time3.png to img3
  img3=loadImage("time3.png");
  //assing bigFish.png to img4
  img4=loadImage("bigFish.png");
  //assing star.png to img5
  img5=loadImage("star.png");
  //assing sunshineNoon to img6
  img6=loadImage("sunshineNoon.png");
  //assing sunshineMorning to img7
  img7=loadImage("sunshineMorning.png");
  /*For loop to assign random value to array of amplitude and dx*/
  for (int z = 0; z< maxwaves; z++) {
    //Assign random value from 20 to 30 to each element of array amplitude[]
    amplitude[z] = random(20, 30);
    // Declare a variable named period with type of float and assign random value from 400 to 500 to it :How many pixels before the wave repeats  
    float period = random(400, 500);  
    //Assign value (TWO_PI/period)*xspacing to array dx[]
    dx[z] = (TWO_PI / period) * xspacing;
  }
}



//Declare the function named draw
void draw() {
  //Turn on the stroke function
  stroke (255);
  //Set the second 
  s=second();    
  //Set the minute 
  m=minute();     
  //Set the hour
  h=hour();    
  /*Conditional:Load different background images according to time(h)*/
  //If 0<=h<=5 is true or 20<=h<=24 is true 
  if ((h>=0&&h<=5)||(h>=20&&h<=24))
  {
    //Draw img1 at positon 0,0
    image(img1, 0, 0);
    /*Conditional:Draw stars every two second*/
    //If s%2 equal to 0 is true
    if (s%2==0) {
      //Draw img5 at position 0,0
      image(img5, 0, 0);
    }
  }
  //If 5<h<=8 is true or 17<h<20 is true 
  if ((h>5&&h<=8)||(h>17&&h<20)) {
    //Draw img2 at positon 0,0
    image(img2, 0, 0);
    /*Conditional:Draw sunshines every two second*/
    //If s%2 equal to 0 is true
    if (s%2==0) {
      //Draw img7 at position 0,0
      image(img7, 0, 0);
    }
  }
  //If h>8 is true and h<=17 is true 
  if (h>8&&h<=17) {
    //Draw img3 at positon 0,0
    image(img3, 0, 0);
    /*Conditional:Draw sunshines every two second*/
    //If s%2 equal to 0 is true
    if (s%2==0) {
      //Draw img6 at position 0,0
      image(img6, 0, 0);
    }
  }
  //Call the drawWave method 
  drawWave(); 
  //Call the drawSun method 
  drawSun();
  //Draw big fish at position mouseX-65, 360
  image(img4, mouseX-65, 360);
  /*Display score*/
  //Fill orange color
  fill(255, 116, 0);
  //draw text with value of score at position 20,20 
  text(score, 20, 20);
  //Call the ballFalling method 
  dropFalling();
  /*Conditional:Detact fire and its result*/
  if (fire)
  {
    //Call the function of cannon
    cannon(mouseX);
    //Assign false to fire 
    fire = false;
  }
}


//Declare the method named mousePressed
void mousePressed()
{
  //Assign true to variable fire when mousePressed
  fire = true;
  //loop the audio 
  au_player2.loop();
}

//Declare the method named ballFalling
void dropFalling()
{ 
  //Turn on the stroke function and set it with blue color
  stroke(39, 154, 240);
  //Fill blue color
  fill (39, 154, 240);
  //For loop: 5 Drops will fall each time
  for (int i=0; i<5; i++)
  {
    ellipse(ballx[i], bally[i]++, ballSize, ballSize);
  }
}


//Declare the method named cannon
void cannon(int shotX)
{
  //Turn on the stroke function 
  stroke(255, 116, 0);
  //Declare the varible called strike with type of boolean and assign false to it
  boolean strike = false;
  //For loop: Account shooting 
  for (int i = 0; i < 5; i++)
  {
    /*Conditionals:Detacts whether shooting off the object*/
    //If shotX is in the range of ballx
    if ((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
      //Assign boolean true to variable strike
      strike = true;
      line(mouseX, 390, mouseX, bally[i]+20);
      //Draw bigger ellipse(shotting effects) at the object's position
      noStroke();
      //Fill orange color
      fill(255, 116, 0, 100);
      //Draw ellipse at position ballx[i], bally[i] with the size of ballSize+25
      ellipse(ballx[i], bally[i], ballSize+25, ballSize+25);
      //Assign random value to element of ballx[i]
      ballx[i] = getRandomX();
      //Assign value 0 to element of bally[i]
      bally[i] = 0;
      //Assign score+1 to score
      score++;
    }
  }
  //If strike is equal to false
  if (strike == false)
  {
    //Draw line from (mouxeX 565) to (mouseX 0)
    line(mouseX, 390, mouseX, 0);
  }
}

//Declare the medthod called drawWave
void drawWave() 
{
  //Assign the value of m to varible numLines
  numLines = m;
  yvalues = new float[numLines];
  rel = 1 - ((pos - 75) / (width - 150));
  //Call the method calcWave()
  calcWave();
  //Call the method renderWave()
  renderWave();
}

//Declare the method named calcWave
void calcWave() {
  //Assign value theta+0.05 to the variable theta
  theta += 0.05;
  //For loop:Set all height values to zero
  for (int i = 0; i < numLines; i++) {
    yvalues[i] = 0.0f;
  }
  // For loop: Accumulate wave height values
  for (int j = 0; j < numLines; j++) {
    float x = theta;
    for (int i = 0; i < numLines; i++) {
      //Conditional:Every other wave is cosine instead of sine
      //Declare a varible diff with type of float and assign the value j%2 to diff. If diff is equal to 0 is true, draw sin(x), else draw cos(x)
      float diff = j % 2 == 0 ? sin(x) : cos(x);
      //Declare the varible add with the type of float and assign the value diff*amplitude[j] to it
      float add = diff*amplitude[j];
      //Assign the value yvalues[i]+add to the varible yvalues[i]
      yvalues[i] += add;
      //Assign the value x+dx[j] to x 
      x+=dx[j];
    }
  }
}

//Declare the method named renderWave()
void renderWave() {
  //Turn off the stroke function  
  noStroke();
  //Fill with color and alpha 
  fill(0, 85, 162, (m+20)*rel); 
  //Star to draw shap 
  beginShape();
  //Start the first point at 0, height
  vertex(0, height);
  //For loop:Draw big waves
  for (int x = 0; x < numLines; x++) {
    //Draw vertex at position x*xspacing, height/5*3+yvalues[x]
    vertex(x*xspacing, height/5*3+yvalues[x]);
    //Draw vertex at position (x*xspacing) + 2, height/5*3+yvalues[x]
    vertex((x*xspacing) + 2, height/5*3+yvalues[x]);
  }
  //Finish the last point at width, height
  vertex(width, height);
  //Finish drawing shape
  endShape(CLOSE);
  //For loop:Draw rectangiles in front of big wave
  for (int x = 0; x < numLines; x++) {
    //Fill with color and alpha 
    fill(0, 145, 246, 255 - ((x/numLines)*200));
    //Draw rectangle at position x*xspacing, height/5*3+yvalues[x] with the size of 10 by height/5*3
    rect(x*xspacing, height/5*3+yvalues[x], 10, height/5*3);
  }
}


//Draw sun or moon at different positions according to time change 
void drawSun() {
  //Assign picture mrSun to img8
  img8=loadImage("mrSun.png");
  //Assign picture moon to img8
  img9=loadImage("moon.png");
  //Turn off stroke function.
  noStroke();
  /*Conditional:Draw sun or moon at different position according to hour(h).*/
  //if h<=12 is true 
  if (h<=12)
  {
    /*Conditional: Detact load sun or moon.*/
    //if (h>=0 and h<=5)is true
    if (h>=0&&h<=5)
    {
      //Draw img9 at position width/24*h+width/24/60*m, (height/2-height/24*h)-height/24/60*m
      image(img9, width/24*h+width/24/60*m, (height/2-height/24*h)-height/24/60*m);
    }
    //if  (h>=0 and h<=5) is false 
    else {
      //Draw img8 at position width/24*h+width/24/60*m, (height/2-height/24*h)-height/24/60*m
      image(img8, width/24*h+width/24/60*m, (height/2-height/24*h)-height/24/60*m);
    }
  }
  //if h>12 is true 
  if (h>12)
  {
    /*Conditional: Detact load sun or moon.*/
    //if (h>=20 and h<=24)is true
    if (h>=20&&h<=24) {
      //Draw img9 at position width/24*h+width/24/60*m, (height/24*(h-12))+height/24/60*m.
      image(img9, width/24*h+width/24/60*m, (height/24*(h-12))+height/24/60*m);
    }
    //if (h>=20 and h<=24)is false
    else {
      //Draw img8 at position width/24*h+width/24/60*m, (height/24*(h-12))+height/24/60*m.
      image(img8, width/24*h+width/24/60*m, (height/24*(h-12))+height/24/60*m);
    }
  }
}



