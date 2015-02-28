
//import ddf.minim.*;
//Minim minim;
//AudioPlayer player;
PFont comic;
PFont arial;
PFont blackoak;

float timer;
float Y = 1;
float y2 = 400;
float deg = 0;
float s = 0;
float x = 250;
float x1 = 250;
float x2 = 250;
float x3 = 250;
float x4 = 250;
float x5 = 250;
float x6 = 250;
float x7 = 250;
float x8 = 250;
float x9 = 250;
float x10 = 250;

void setup()
{
  size(500, 500);
  frameRate(60);
  
  comic = createFont("Comic Sans MS",64);
  arial = createFont("Arial",64);
  blackoak = createFont("Blackoak Std",32);
  
  //minim = new Minim(this);
  //player = minim.loadFile("Joker.mp3");
  player = new Audio("Joker.mp3");
  player.play();
}

void draw()
{
  background(0);
  
  timer += .0175;
  
  if (timer >= 0 && timer <= 1.4)
  {
    pushMatrix();
    fill(255, 0, 0);
    translate(75 , height/2);
    textFont(blackoak);
    scale(1);
    text("Memories", 0, 0);
    popMatrix();
  } 
  
  if(timer >= 1.4 && timer <= 2.4)
  {
    pushMatrix();
    fill(255, 0, 0);
    translate(75, height/2);
    textFont(comic);
    scale(2);
    text("Can Be", 0, 0);
    popMatrix();
  }
  
  if(timer >= 2.4 && timer <= 5.2)
  {
    pushMatrix();
    Y += 2;
    fill(255, 0, 0);
    translate(100, 250 + Y);
    textFont(comic);
    scale(2);
    text("Vile,", 0, 0);
    popMatrix();
  }
  
  if(timer >= 6.3 && timer <= 8)
  {
    pushMatrix();
    fill(255, 0, 0);
    translate(45, 50);
    textFont(comic);
    scale(.8);
    rotate(radians(45));
    text("Repulsive Little Brutes.", 0, 0);
    popMatrix();
  }
  
  if(timer >= 8 && timer <= 9)
  {
    deg += 5;
    pushMatrix();
    fill(255, 0, 0);
    translate(250, 250);
    textFont(comic);
    scale(.5);
    rotate(radians(deg));
    text("Like Children,", 0, 0);
    popMatrix();
  }
  
  if(timer >= 9 && timer <= 10)
  {
    pushMatrix();
    fill(255, 0, 0);
    translate(45, 50);
    textFont(comic);
    scale(.8);
    rotate(radians(0));
    text("I Suppose.", 0, 0);
    popMatrix();
  }
  
  if (timer >= 10 && timer <= 13)
  {
    pushMatrix();
    s += .04;
    fill(255, 0, 0);
    translate(50, 450);
    textFont(comic);
    scale(s);
    rotate(radians(0));
    text("Ha", 0, 0);
    popMatrix();
  }
  
  if (timer >= 13.1 && timer <= 15.4)
  {
    pushMatrix();
    x -= 9;
    fill(255, 0, 0);
    translate(x, height/2);
    textFont(comic);
    scale(1.5);
    rotate(radians(0));
    text("But Can We Live Without Them?", 0, 0);
    popMatrix();
  }
  
  if (timer >= 15.4 && timer <= 16.6)
  {
    pushMatrix();
    fill(255, 0, 0);
    translate(75, height/2);
    textFont(blackoak);
    scale(1);
    text("Memories", 0, 0);
    popMatrix();
  }
  
  if (timer >= 16.6 && timer <= 19.2)
  {   
    pushMatrix();
    x1 -= 9.5;
    fill(255, 0, 0);
    translate(x1, 100);
    textFont(comic);
    scale(1.5);
    rotate(radians(0));
    text("Are What Our Reason Is Based Upon", 0, 0);
    popMatrix();
  }
  
  if (timer >= 19.3 && timer <= 21)
 {
    pushMatrix();
    fill(255, 0, 0);
    translate(50, 450);
    textFont(comic);
    scale(.8);
    rotate(radians(315));
    text("If We Can't Face Them,", 0, 0);
    popMatrix();
 }
 
 if (timer >= 21 && timer <= 23.7)
 {
    pushMatrix();
    fill(255, 0, 0);
    translate(45, 450);
    textFont(comic);
    scale(.6);
    rotate(radians(0));
    text("We Deny Reason Itself!", 0, 0);
    popMatrix();
 }
 
 if (timer >= 24 && timer <= 25.7)
 {
    pushMatrix();
    fill(255, 0, 0);
    translate(45, height/3);
    textFont(comic);
    scale(.7);
    rotate(radians(0));
    text("Alghough, Why Not?", 0, 0);
    popMatrix();
 }
 
 if (timer >= 25.7 && timer <= 30.8)
 {
    pushMatrix();
    x2 -= 8.6;
    fill(255, 0, 0);
    translate(x2, height/2);
    textFont(comic);
    scale(1.5);
    rotate(radians(0));
    text("We Aren't Contractually Tied Down To Rationality!", 0, 0);
    popMatrix();
 }
 
 if (timer >= 32 && timer <= 35.8)
 {
    pushMatrix();
    x3 -= 7.5;
    fill(255, 0, 0);
    translate(x3, 175);
    textFont(comic);
    scale(1.5);
    rotate(radians(15));
    text("There Is No Sanity Clause!", 0, 0);
    popMatrix();
 }
 
 if (timer >= 36.5 && timer <= 38.8)
 {
    pushMatrix();
    x4 -= 9.5;
    fill(255, 0, 0);
    translate(x4, 175);
    textFont(comic);
    scale(2);
    rotate(radians(0));
    text("So When You Find Yourself", 0, 0);
    popMatrix();
 }
 
 if(timer >= 38.8 && timer <= 39.4)
 {
    pushMatrix();
    fill(255, 0, 0);
    translate(50, width/2);
    textFont(arial);
    scale(2);
    rotate(radians(0));
    text("Locked", 0, 0);
    popMatrix();
 }
 
 if (timer >= 39.4 && timer <= 42)
 {
    pushMatrix();
    x5 -= 9.5;
    fill(255, 0, 0);
    translate(x5, 175);
    textFont(comic);
    scale(1.5);
    rotate(radians(0));
    text("Onto An Unpleasant Train Of Thought", 0, 0);
    popMatrix();
 }
 
 if (timer >= 42 && timer <= 45)
 {
    pushMatrix();
    x6 -= 9.5;
    fill(255, 0, 0);
    translate(x6, 400);
    textFont(comic);
    scale(1.5);
    rotate(radians(0));
    text("Heading For The Places In Your Past", 0, 0);
    popMatrix();
 }
 
 if (timer >= 45 && timer <= 48)
 {
    pushMatrix();
    x7 -= 9.5;
    fill(255, 0, 0);
    translate(x7, 100);
    textFont(comic);
    scale(1.5);
    rotate(radians(0));
    text("Where The Screaming Is Unbearable,", 0, 0);
    popMatrix();
 }
 
 if (timer >= 48 && timer <= 49.5)
 {
    pushMatrix();
    y2 -= 2;
    fill(255, 0, 0);
    translate(75, y2);
    textFont(comic);
    scale(1.3);
    rotate(radians(0));
    text("Remember", 0, 0);
    popMatrix();
 }
 
 if (timer >= 49.6 && timer <= 52.6)
 {
    pushMatrix();
    fill(255, 0, 0);
    translate(40, 40);
    textFont(comic);
    scale(.8);
    rotate(radians(45));
    text("There's Always Madness", 0, 0);
    popMatrix();
 }
 
 if (timer >= 52.6 && timer <= 54.8)
 {
    pushMatrix();
    x8 -= 9.5;
    fill(255, 0, 0);
    translate(x8, 100);
    textFont(comic);
    scale(1.5);
    rotate(radians(0));
    text("You Can Just Step Outside,", 0, 0);
    popMatrix();
 }
 
 if (timer >= 54.6 && timer <= 56.6)
 {
    pushMatrix();
    x10 -= 9.5;
    fill(255, 0, 0);
    translate(x10, 250);
    textFont(comic);
    scale(1.5);
    rotate(radians(0));
    text("And Close The Door", 0, 0);
    popMatrix();
   
 }
 
 if (timer >= 56.4 && timer <= 60.1)
 {
    pushMatrix();
    x9 -= 9.5;
    fill(255, 0, 0);
    translate(x9, 400);
    textFont(comic);
    scale(1.5);
    rotate(radians(0));
    text("On All Those Dreadful Things That Happened.", 0, 0);
    popMatrix();
 }
 
 if (timer >= 60.1 && timer <= 64.3)
 {
    pushMatrix();
    fill(255, 0, 0);
    translate(50, 100);
    textFont(comic);
    scale(.5);
    rotate(radians(20));
    text("You Can Lock Them Away...", 0, 0);
    popMatrix();
 }
 
 if (timer >= 64.4 && timer <= 69.1)
 {
    pushMatrix();
    fill(255, 0, 0);
    translate(25, 400);
    textFont(comic);
    scale(.5);
    rotate(radians(340));
    text("Madness Is The Emergency Exit...", 0, 0);
    popMatrix();
 }
 
 if (timer >= 69.1 && timer <= 72.2)
 {
    pushMatrix();
    fill(255, 0, 0);
    textFont(comic);
    scale(.5);
    rotate(radians(0));
    text("Hahahaha", 100, 900);
    text("Hahahaah", 400, 500);
    text("Hahahaah", 200, 700);
    text("Hahahaah", 140, 250);
    text("Hahahaah", 300, 400);
    text("Hahahaah", 600, 300);
    text("Hahahaah", 700, 600);
    text("Hahahaah", 350, 800);
    popMatrix();
 }
   
}




