
PImage Wanted;
PImage Window;

color sky = color(135,206,250);
color brown = color(139,69,19);
color cRed = color(255,30,30);
color cBlue = color(0,30,255);
color darkBlue = color(0,0,200);
color darkBrown = color(119,49,0);
color cGreen = color(0,255,0);
color white = color(255,255,255);
color grey = color(120,120,120);
color darkGrey = color(50,50,50);

float counter = 0;
float counter2 = 0;
float counter3 = 0;
float counter4 = 0;
float shake = 3;
float counter5 = 0;
float counter6 = 0;

float counter7=0;
float counter8=0;
float counter9=0;

float counter10=0;
float counter11=0;
float counter12=0;

void setup() 
{
  size(500, 500);
  smooth();
  Wanted = loadImage("Wanted.JPG");
  Window = loadImage("Window.JPG");
}

void draw() 
{
  float currentTime = millis() / 1000.0;
  background(sky);
  if(currentTime < 19)
  {
    background(brown);
    fill(darkBrown);
    noStroke();
    rect(0,470,500,30);
    image(Wanted, 320, 150);
    image(Window, 130, 120);
    image(Window, -70, 120);
    //red square
    fill(cRed);
    if(currentTime<4)
    {
      counter++;
      translate(-30+counter,400);
      noStroke();
      fill(cRed);
      rect(0,0,70,70);
      translate(30-counter,-400);
    }
    if(currentTime>=4 && currentTime<10)
    {
      rect(205,400,70,70);
    }
    if(currentTime>=10 && currentTime<11)
    {
      counter2++;
      fill(cBlue);
      stroke(darkBlue);
      ellipse(366,435,70,70);
      ellipse(460,440,70,70);
      fill(cRed);
      noStroke(); 
      counter4=counter4+.166666;
      translate(205-counter2/2,400-counter4);
      rect(0,0,70-(counter2/6),70+(counter2/6));
      translate(205+counter2/2,-400+counter4);     
    }
    if(currentTime>=11 && currentTime<14)
    {
      counter3++;
      fill(cBlue);
      stroke(darkBlue);
      ellipse(366,435,70,70);
      ellipse(460,440,70,70);
      fill(cRed);
      noStroke();
      if(counter3>4)
      {
        shake=-1*shake;
        counter3=0;
      }
      translate(175+shake,390);
      rect(0,0,60,80);
      translate(175-shake,-390);
    }
    if(currentTime>=14 && currentTime<15)
    {
      counter6++;
      fill(cBlue);
      stroke(darkBlue);
      ellipse(366,435,70,70);
      ellipse(460,440,70,70);
      fill(cRed);
      noStroke();
      if(counter5<30)
      {
        counter5++;
      }
      translate(175-(counter6*6),390+(counter5));
      rect(0,0,60+counter5,80-counter5);
      translate(175-(counter6*6),390+(counter5));
    }
      
    //blue circles
    fill(cBlue);
    stroke(darkBlue);
    if(currentTime<7.5)
    {
      ellipse(380,435,70,70);
      ellipse(460,440,70,70);
    }
    if(currentTime>=5 && currentTime<6.5)
    {
      noStroke();
      fill(brown);
      rect(0,0,500,500);
      scale(2);
      image(Wanted,70,70);
    }
    if(currentTime>=7.5 && currentTime<8.5)
    {
      counter8++;
      fill(cBlue);
      stroke(darkBlue);
      ellipse(460,440,70,70);
      translate(380-(counter8/5),435);
      ellipse(0,0,70,70);
      translate(-380+(counter8/5),435);
    }
    if(currentTime>=7.5 && currentTime<10)
    {
      fill(cBlue);
      stroke(darkBlue);
      ellipse(366,435,70,70);
      ellipse(460,440,70,70);
      fill(cRed);
      noStroke();
    }
    if(currentTime>=15 && currentTime<16)
    {
      fill(cBlue);
      stroke(darkBlue);
      ellipse(366,435,70,70);
      ellipse(460,440,70,70);
    }
    if(currentTime>=16)
    {
      counter9++;
      fill(cBlue);
      stroke(darkBlue);
      translate(0-(counter9*6),0);
      ellipse(366,435,70,70);
      ellipse(460,440,70,70);
      ellipse(535,435,70,70);
      ellipse(595,450,70,70);
      ellipse(660,435,70,70);
      ellipse(710,445,70,70);
      ellipse(595,450,70,70);
      ellipse(770,435,70,70);
      ellipse(830,455,70,70);
      translate(0+(counter9*6),0);
    }
  }
  if(currentTime>=19 & currentTime<24)
  {
    counter11++;
    noStroke();
    fill(cGreen);
    rect(0,450,500,50);
    fill(white);
    translate(0+(counter11/2.5),0);
    ellipse(180,100,80,30);
    ellipse(210,85,50,50);
    ellipse(180,90,30,30);
    ellipse(400,80,160,50);
    ellipse(400,60,70,50);
    ellipse(360,60,50,20);
    ellipse(-20,100,50,20);
    ellipse(10,90,60,15);
    ellipse(0,90,40,30);
    translate(0-(counter11/2.5),0);
    fill(grey);
    stroke(darkGrey);
    rect(0,0,30,450);
  }
  if(currentTime>=20 & currentTime<24)
  {
    if(counter10<60)
    {
      counter10++;
    }
    translate(500-(counter10*7),380);
    fill(cRed);
    rect(0,0,70,70);
    fill(cBlue);
    ellipse(130,35,70,70);
    ellipse(210,35,70,70);
    ellipse(290,35,70,70);
    ellipse(370,35,70,70);
    ellipse(450,35,70,70);
    ellipse(530,35,70,70);
    ellipse(610,35,70,70);
    ellipse(690,35,70,70);
    ellipse(770,35,70,70);
    ellipse(850,35,70,70);
    translate(-500+(counter10*7),380);
  }
  if(currentTime>=24)
  {
    background(grey);
    fill(cRed);
    noStroke();
    rect(150,150,200,200);
    if(currentTime>=25.5)
     {
       fill(darkGrey);
       if(counter12<260)
       {
         counter12++;
       }
       translate(500-counter12*2,0);
       rect(0,0,10,500);
       rect(30,0,10,500);
       rect(60,0,10,500);
       rect(90,0,10,500);
       rect(120,0,10,500);
       rect(150,0,10,500);
       rect(180,0,10,500);
       rect(210,0,10,500);
       rect(240,0,10,500);
       rect(270,0,10,500);
       rect(300,0,10,500);
       rect(330,0,10,500);
       rect(360,0,10,500);
       rect(390,0,10,500);
       rect(420,0,10,500);
       rect(450,0,10,500);
       rect(480,0,10,500);
       rect(510,0,10,500);
       rect(530,0,10,500);
       translate(-500+counter12*2,0);
     }
  }    
}

