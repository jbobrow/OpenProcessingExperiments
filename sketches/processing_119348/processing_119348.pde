

float X1;
float Y1;
PFont Work;
PFont Play;
float mTimer = 0;
String [] words = new String[4];
float x;
void setup()
{
  size(500,700);
  background(0);
  Work = createFont("Helvetica",64);
  Play = createFont("MV Boli",64);
  words [0] = "work";
  words [1] = "projects";
  words [2] = "deadlines";
  words [3] = "studying";
}

void draw()
{
  mTimer += 1;
  imageMode(CENTER);
  if (mTimer == 120)
   {
     textFont(Play);
     textAlign(CENTER,CENTER);
     fill(200);
     textSize(40);
     text("relaxing",width/2,550);
   }
  if (mTimer == 200)
  {
    textFont(Play);
    textAlign(CENTER,CENTER);
    fill(255);
    pushMatrix();
    textSize(40);
    translate(308,500);
    rotate(radians(82));
    text("enjoy",0,0);
    popMatrix();
  }
  
  if (mTimer == 220)
  {
    textFont(Play);
    textAlign(CENTER,CENTER);
    fill(255);
    pushMatrix();
    textSize(40);
    translate(200,500);
    rotate(radians(275));
    text("happy",0,0);
    popMatrix();
  }
  
  if (mTimer == 240)
  {
    textFont(Play);
    textAlign(CENTER,CENTER);
    fill(255);
    pushMatrix();
    textSize(40);
    translate(310,350);
    rotate(radians(98));
    text("inspiration",0,0);
    popMatrix();
  }
  
  if (mTimer == 260)
  {
    textFont(Play);
    textAlign(CENTER,CENTER);
    fill(255);
    pushMatrix();
    textSize(40);
    translate(200,350);
    rotate(radians(265));
    text("motivates",0,0);
    popMatrix();
  }
  
  if (mTimer == 280)
   {
     textFont(Play);
     textAlign(CENTER,CENTER);
     fill(200);
     textSize(40);
     text("freeing",width/2+5,240);
   }
   
    if (mTimer == 320)
   {
     textFont(Play);
     textAlign(CENTER,CENTER);
     fill(11,255,0);
     textSize(40);
     text("Play",width/2,450);
   }
   
     if (mTimer == 620)
   {
     textFont(Work);
     textAlign(CENTER,CENTER);
     fill(255);
     textSize(100);
     text("WORK!",width/2,450);
   }
   
    if (mTimer >= 680)
   {
     x = int(random(0,4));
     textFont(Work);
     textAlign(CENTER,CENTER);
     fill(random(100,255));
     textSize(50);
     text(words[x],random(width),random(height));
   }
   
   
   
}



