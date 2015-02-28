
import ddf.minim.*;


//////////////////////////////////////
// Global Variables
//////////////////////////////////////
 AudioPlayer player;
Minim minim;
 
int card;
float pMillis = 0.0;
PImage[] slides = new PImage[21];
int[] sequence1 = new int[21];
boolean girl = false;
boolean icecream = false;
boolean happygirl = false;
 
 float x = 0;
float y = 0;

float angle = 0.0;
float scalar = 40; 
float speed = 0.1;

 
//////////////////////////////////////
// Setup
//////////////////////////////////////
 
void setup()
{
  size(700, 465);
  smooth();
  card  = 1;
 
 minim = new Minim(this);
  player = minim.loadFile("On the first warm day.mp3", 2048);
  // play the file
  player.play();
 
  //My 4 random words, stored in advance. Yours will be PImages of course
  slides[0]  = loadImage("1.jpg");
  slides[1]  = loadImage("2.jpg");
  slides[2]  = loadImage("3.jpg");
  slides[3]  = loadImage("4.jpg");
  slides[4]  = loadImage("5.jpg");
  slides[5]  = loadImage("6.jpg");
  slides[6]  = loadImage("7.jpg");
  slides[7]  = loadImage("8.jpg");
  slides[8]  = loadImage("9.jpg");
  slides[9]  = loadImage("10.jpg");
  slides[10]  = loadImage("11.jpg");
  slides[11]  = loadImage("12.jpg");
  slides[12]  = loadImage("12.jpg");
  slides[13]  = loadImage("12.jpg");
  slides[14]  = loadImage("click.jpg");
  slides[15]  = loadImage("end.jpg");
  slides[16]  = loadImage("bath time.jpg");
  slides[17]  = loadImage("relaxpage1.jpg");
  slides[18]  = loadImage("relaxpage2.jpg");  
  slides[19]  = loadImage("relax1.png");
  slides[20]  = loadImage("relax2.png");
 
 
 
  //A randomized sequence of numbers -- determined at setup. We'll use this in slide 2!
  //At the end of the draw loop, we refresh this sequence. See below.
  for (int i=0; i<sequence1.length; i++)
  {
    sequence1[i] = int(random(3));
  }
  //delay(5000); //delays the program for two seconds
}
 
//////////////////////////////////////
// Main Loop
//////////////////////////////////////
 
void draw()
{
  background(255);
  fill(0);
 
  //////////////////////////////////
  //The timing for the individual cards
  //////////////////////////////////
 
  if (card==1)
  {
    image(slides[16], 0, 0);
    println("1");
    if (millis() - pMillis >= 5000)
    {
      card++;
      pMillis = millis();
    }
  }
  if (card==2)
  {
    image(slides[3], 0, 0);
    println("1");
    if (millis() - pMillis >= 2000)
    {
      card++;
      pMillis = millis();
    }
  }
  else if (card==3)
  {
    println("2");
    //shorcut.. so we don't have to type it every time
    float tmp = millis() - pMillis;
 
    if (tmp <= 1500)
    {//first 1.5 second
      //Use the corresponding random number (we stored it in advance) to select which image to display.
      image(slides[sequence1[0]], 0, 0);
    }
    else if (tmp > 1500 && tmp <= 3000)
    { //second 1.5 second
      image(slides[sequence1[1]], 0, 0);
    }
    else
    { //third 2 seconds
      image(slides[sequence1[2]], 0, 0);
    }
 
    //The check to see if it's time to leave "Slide 2"
    if (millis() - pMillis >= 5000)
    {
      card++;
      pMillis = millis();
    }
  }
 
 
 
  else if (card==4)
  {
    println("3");
    image(slides[4], 0, 0);
    if (millis() - pMillis >= 3000)
    {
      card++;
      pMillis = millis();
    }
  }
  else if (card==5)
  {
    println("4");
    image(slides[5], 0, 0);
    if (millis() - pMillis >= 2000)
    {
      card++;
      pMillis = millis();
    }
  }
 
  else if (card==6)
  {
    println("5");
    image(slides[6], 0, 0);
    if (millis() - pMillis >= 2000)
    {
      card++;
      pMillis = millis();
    }
  }
  else if (card==7)
  {
    println("6");
    image(slides[7], 0, 0);
    if (millis() - pMillis >= 2000)
    {
      card++;
      pMillis = millis();
    }
  }
  else if (card==8)
  {
    println("7");
    image(slides[14], 0, 0);
   
 
    if (mousePressed)
    {
      if (mouseX>100&&mouseX<525&&mouseY>250&&mouseY<420)
      {
        println("clicked girl");
        girl = true; icecream=false;
        card = 9; //sequence is 8, 9, 11
        pMillis = millis();
      }
 
 
      if (mousePressed&&(mouseX>525&&mouseX<700&&mouseY>250&&mouseY<420))
      {
        icecream = true; girl=false;
        card = 11; //sequence is 10, 11
        pMillis = millis();
      }
    }
  }
  else if (card==9)
  {
    println("8");
    image(slides[8], 0, 0);
    if (millis() - pMillis >= 2000)
    {
      card++;
      pMillis = millis();
    }
  }
  else if (card==10)
  {
    println("9");
    image(slides[9], 0, 0);
    if (millis() - pMillis >= 2000)
    {
      if(girl)
        card=11;
      else
        card=10;
      pMillis = millis();
    }
  }
  else if (card==11)
  {
    if (girl) {
      card++;
    }
 
    println("10");
    image(slides[10], 0, 0);
    if (millis() - pMillis >= 2000)
    {
      card++;
      pMillis = millis();
    }
  }
  else if (card ==12)
  {
    println("11");
    image(slides[11], 0, 0);
    if (millis() - pMillis >= 2000)
    {
      card++;
      pMillis = millis();
    }
     
  }
   

   else if (card ==13)
  {
    println("12");
    image(slides[17], 0, 0);
     
     if (mousePressed&&(mouseX>150&&mouseX<400&&mouseY>50&&mouseY<250))
      {
        println("clicked girl");
        happygirl = true;
        card = 14;
        pMillis = millis();
      }
     
  }
  else if (card==14)
  {
    image(slides[18], 0, 0);
    
      float offsetA = sin(angle)*scalar;
      float offsetB = (y+=4)*speed;
    
    image(slides[19], offsetA, offsetB);

    image(slides[20], 0, 0);
    
       if (millis() - pMillis >= 4000)
    {
      card++;
      y=0;
      pMillis = millis();
    }
  }
  
   else if (card ==15)
  {
    println("12");
    image(slides[15], 0, 0);
    if (millis() - pMillis >= 4000)
    {
      card++;
      pMillis = millis();
    }
     
  }
 
  //////////////////////////////////
  // The code that runs when we reach the last slide
  //////////////////////////////////
    if (card == 16)
    {
  //    //Wrap the card back to 1 
     card=1;
  //    //Re-generate random number sequence
      for (int i=0; i<sequence1.length; i++)
      {
        sequence1[i] = int(random(3));
      }
    }
 
  //////////////////////////////////
  // End Draw
  //////////////////////////////////
}


void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  
  super.stop();
}


