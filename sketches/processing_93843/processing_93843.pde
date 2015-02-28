
import ddf.minim.*;

Minim minim;

AudioSample step1;
AudioSample step2;
AudioSample step3;
AudioSample point1;

PFont font;
PImage[] rocks = new PImage[101];
PImage[] papers = new PImage[100];
PImage[] scissors = new PImage[65];

boolean bDisplayRock1;
boolean bDisplayRock2;
boolean bDisplayPaper1;
boolean bDisplayPaper2;
boolean bDisplayScissor1;
boolean bDisplayScissor2;


boolean bDisplay;
int startTime;
final int DISPLAY_DURATION = 2000;
int scoreTimer;

int play1;
int play2;
int score1 = 0;
int score2 = 0;
int newScore1 = 0;
int newScore2 = 0;

int pos1x = 300;
int pos1y = 200;

int pos2x = 700;
int pos2y = 200;

void setup()
{
  size(800, 600);
  
  font = loadFont("CourierNew36.vlw");
  textFont(font);
  
  for(int l = 0; l<rocks.length; l++){
rocks[l] = loadImage("rock" + l + ".jpg");
}

for(int m = 0; m<papers.length; m++){
  papers[m] = loadImage("paper" + m +".jpg");
}

for(int n = 0; n < scissors.length; n++){
  scissors[n] = loadImage("scissor" + n + ".jpg");
}

minim = new Minim(this);
step1 = minim.loadSample("step1.wav", 512);
step2 = minim.loadSample("step2.wav", 512);
step3 = minim.loadSample("step3.wav", 512);
point1 = minim.loadSample("point1.wav", 512);
}

void draw()
{
  background (0,0,150);
  stroke (100);
  fill (200,0,0);
  textSize(84);
  imageMode(CENTER);
  


  
 fill (120,0,0);
  
  delay(750);
  step1.trigger();
  delay(750);
  step2.trigger();
  delay(750);
  step3.trigger();
  delay(750);
  point1.trigger();
  
  
  
  String [] play11 = {"rock", "paper", "scissors"};
String [] play22 = {"rock", "paper", "scissors"}; 
   play1 = int(random(play11.length));
 play2 = int(random(play22.length));

  
 if(play1 == 0)
 {
   bDisplayRock1 = true;

 }

if(play1 == 1)
{
  bDisplayPaper1 = true;
 
}

if(play1 == 2)
{
  bDisplayScissor1 = true;

}

if(play2 == 0)
{
  bDisplayRock2 = true;
  
}

if(play2 == 1){
  bDisplayPaper2 = true;
  
}

 if(play2 == 2){
   bDisplayScissor2 = true;
   
 }

 
 if(bDisplayRock1)
  {
    int i = int(random(rocks.length));
image(rocks[i], pos1x -90, pos1y +180);
    if(millis() - startTime > DISPLAY_DURATION)
    
    {
      bDisplayRock1 = false;
    }
  }
  
 else{
  
   if(bDisplayPaper1)
  {
    int j = int(random(papers.length));
image(papers[j], pos1x-90, pos1y+180);
    if(millis() - startTime > DISPLAY_DURATION)
    
    {
      bDisplayPaper1 = false;
    }
  }
  
  else{
  
   if(bDisplayScissor1)
  {
    int k = int(random(scissors.length));
image(scissors[k], pos1x-90, pos1y+180);
    if(millis() - startTime > DISPLAY_DURATION)
    
    {
      bDisplayScissor1 = false;
    }
  }
  }
 }
  
    if(bDisplayRock2)
  {
    int i2 = int(random(rocks.length));
image(rocks[i2], pos2x - 70, pos2y + 180);
    if(millis() - startTime > DISPLAY_DURATION)
    
    {
      bDisplayRock2 = false;
    }
  }else{
  
   if(bDisplayPaper2)
  {
    int j2 = int(random(papers.length));
image(papers[j2], pos2x - 70, pos2y + 180);
    if(millis() - startTime > DISPLAY_DURATION)
    
    {
      bDisplayPaper2 = false;
    }
  }else{
  
    if(bDisplayScissor2)
  {
    int k2 = int(random(scissors.length));
image(scissors[k2], pos2x - 70, pos2y + 180);
    if(millis() - startTime > DISPLAY_DURATION)
    
    {
      bDisplayScissor2 = false;
    }
  }
  }
  }
  


   fill ( 200,0,0);
 // text(play11[play1], pos1x - 70, pos1y + 200);
 // text(play22[play2], pos2x - 70, pos2y + 200);
  
  
  
  


//rock v paper = paper wins - p2 + 1
if(play1 == 0 && play2 == 1) {
  score2++;
}
//rock v sissors = rock wins - p1 + 1
if(play1 == 0 && play2  == 2) {
  score1++;
 
}
// paper v rock = paper wins - p1 + 1
if(play2 == 0 && play1 == 1) {
 score1++;
  
}
//sissors v rock = rock wins - p2 +1
if(play2 == 0 && play1 == 2){
  score2++;
  
}
// paper v sissors = sissors wins - p2 +1
if(play1 == 1 && play2 == 2){
  score2++;
 
}
// sissors v paper = sissors wins - p1 +1
if(play1 == 2 && play2 == 1){
  score1++;
  
}


text(score1, pos1x - 120, pos1y - 70);
  text(score2, pos2x - 120, pos2y - 70);

 delay(10);
}

