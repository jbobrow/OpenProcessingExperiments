
//Homework 10
//Amy Friedman
//amyfried
//copyright Amy Friedman Pittsburgh, PA November 2013
//Israel Through the Ages

//image from 2011 from ameu.org
//blank map comes from freeusandworldmaps.com
//other maps were editted by me
//research on information comes from mapsofwar.com
//text font Timeburner created by NimaVisual

//click on the slider and move it up and down using the mouse 
//you will see the power in control of israel change overtime
//click the today button to view an up to date map of israel showing the palestinian territory

float xpic, ypic, wdpic, htpic, szNow;
float barX, barY, barWd, barHt;
PImage blankIsrael, israelNow;
int slideY;

float BCE,CE;
PFont words;
void setup()
{
  size(500,500);
 
 words= createFont("TimeBurner",30);
 textFont(words);
 imageMode(CENTER);
 blankIsrael = loadImage("Israelblank.jpg"); 
 israelNow = loadImage("now.png");
 
 xpic=width*.65;
 ypic=height*.5;
 wdpic=width*.71;
 htpic=height;
 szNow = 75;
 
 barX=width*.12;
 barY=height*.05;
 barWd= 20;
 barHt= height*.9;
 slideY=25;
 
BCE= 1550;
CE= 0;
}

void draw()
{
  background(255);
  standardScreen();
  controlBar();
  israelToday();
  timeInformation();
}

void timeInformation()
{
  textSize(15);
  fill(0);
  
  if (slideY<height*.5)
  {
    text(+BCE, width*.17, slideY+10);
  }
  
   if (slideY>barY && slideY<height*.5 && mousePressed)
   {
     float bceTime = (mouseY-25)*1550/225; //1550 is year and 225 is spaces in between top of bar to middle of bar 
     BCE= 1550 - bceTime;  
    
     if (bceTime<0)
     {BCE=0;}
     mapChangesBCE();
   }
   
  if (slideY==height*.5 )
  {
    text(+CE, width*.17, slideY);
  }
   if (slideY>height*.5 )
  {
    text(+CE, width*.17, slideY);
  }
  if(height*.5<slideY && barHt>slideY && mousePressed)
  {
    
    float yearToday = 2013;
    float ceTime= (mouseY-250)*yearToday/199;
    CE= 0 + ceTime;
    
    if (ceTime>yearToday)
    { CE=2013;}
    mapChangesCE();
  }
}

void mapChangesBCE()
{
  textSize(25);
  if (BCE>1000 && BCE<1550)
  { 
    PImage egypt = loadImage("1egypt.jpg");
    image(egypt, xpic, ypic, wdpic, htpic);
    text("Kingdom of Egypt", width*.3, height*.15);
  }
  
  else if (BCE==1000 ||BCE>740)
  {
    PImage kingdomisrael = loadImage("2israel.jpg");
    image(kingdomisrael, xpic, ypic, wdpic, htpic);
    text("Kingdom of Israel", width*.3, height*.15);
  }
    else if (BCE==740 ||BCE>587)
  {
    PImage assyrian = loadImage("3assyrian.jpg");
    image(assyrian, xpic, ypic, wdpic, htpic);
    text("Assyrian Empire", width*.3, height*.15);
  }
      else if (BCE==587 ||BCE>539)
  {
    PImage baby = loadImage("4babylonian.jpg");
    image(baby, xpic, ypic, wdpic, htpic);
    text("Babylonian Empire", width*.3, height*.15);
  }
      else if (BCE==539 ||BCE>333)
  {
    PImage persian = loadImage("5persian.jpg");
    image(persian, xpic, ypic, wdpic, htpic);
    text("Persian Empire", width*.3, height*.15);
  }
      else if (BCE==333 ||BCE>63)
  {
    PImage maced = loadImage("6macedonian.jpg");
    image(maced, xpic, ypic, wdpic, htpic);
    text("Macedonian Empire", width*.3, height*.15);
  }
        else if (BCE==63 ||BCE>0)
  {
    PImage roman = loadImage("7roman.jpg");
    image(roman, xpic, ypic, wdpic, htpic);
    text("Roman Empire", width*.3, height*.15);
  }
}

void mapChangesCE()
{
  textSize(25);
  if (CE==0 || CE<476)
  {
    PImage roman = loadImage("7roman.jpg");
    image(roman, xpic, ypic, wdpic, htpic);
    text("Roman Empire", width*.3, height*.15);
  }
  else if (CE==476 || CE<611)
  {
    PImage byz = loadImage("8byzantine.jpg");
    image(byz, xpic, ypic, wdpic, htpic);
    text("Byzantine Empire", width*.3, height*.15);
  }
    else if (CE==611 || CE<750)
  {
    PImage sass = loadImage("9sassanid.jpg");
    image(sass, xpic, ypic, wdpic, htpic);
    text("Sassanid Empire", width*.3, height*.15);
  }
      else if (CE==750 || CE<1079)
  {
    PImage cal = loadImage("10caliphate.jpg");
    image(cal, xpic, ypic, wdpic, htpic);
    text("The Caliphate", width*.3, height*.15);
  }
      else if (CE==1079 || CE<1098)
  {
    PImage sel = loadImage("11seljuk.jpg");
    image(sel, xpic, ypic, wdpic, htpic);
    text("Seljuk Empire", width*.3, height*.15);
  }
        else if (CE==1098 || CE<1291)
  {
    PImage crusader = loadImage("12crusaders.jpg");
    image(crusader, xpic, ypic, wdpic, htpic);
    text("The Crusader Kingdoms", width*.3, height*.15);
  }
          else if (CE==1291 || CE<1517)
  {
    PImage saladin = loadImage("13saladin.jpg");
    image(saladin, xpic, ypic, wdpic, htpic);
    text("Saladin's Empire", width*.3, height*.15);
  }
            else if (CE==1517 || CE<1923)
  {
    PImage ottoman = loadImage("14ottoman.jpg");
    image(ottoman, xpic, ypic, wdpic, htpic);
    text("Ottoman Empire", width*.3, height*.15);
  }
              else if (CE==1923 || CE<1947)
  {
    PImage gbmandate = loadImage("15mandate.jpg");
    image(gbmandate, xpic, ypic, wdpic, htpic);
    text("British Mandate for Palestine", width*.3, height*.15);
  }
                else if (CE==1948 || CE<1967)
  {
    PImage state = loadImage("16state.jpg");
    image(state, xpic, ypic, wdpic, htpic);
    text("State of Israel", width*.3, height*.15);
  }
                  else if (CE==1967 || CE<1978)
  {
    PImage extend = loadImage("17extend.jpg");
    image(extend, xpic, ypic, wdpic, htpic);
    text("Israel & Occupied Territory", width*.3, height*.15);
  }
  else if (CE==1979 || CE<2000)
  {
    PImage withdraw = loadImage("18withdrawl.jpg");
    image(withdraw, xpic, ypic, wdpic, htpic);
    text("Withdrawal of Israel", width*.3, height*.15);
  }
    else if (CE==2000 || CE<2013|| CE==2013)
  {
    PImage now = loadImage("19now.jpg");
    image(now, xpic, ypic, wdpic, htpic);
    text("Israel", width*.3, height*.15);
  }
}
  
void controlBar()
{
  
  fill(0,0,255);//want this to be a colored rectangle from white to black
  rect(barX, barY, barWd, barHt);
  fill(0);
  rect(barX, slideY, barWd, barHt*.022);
  textSize(13);
  text("1550 BCE", barX*.1, barY+barY*.4);
  text("2013 CE", barX*.2, barY+barHt*.99);

  
  if ( mousePressed )
  {
    slideY = int(constrain(mouseY, height*.05, height*.93 ) );
  }
  
  
}

void standardScreen()
{
  textSize(15);
  text("Year: ", width*.01, height*.04);
  image(blankIsrael, xpic, ypic, wdpic, htpic);
}

void israelToday()
{
  float szNow = 75;

  fill(255,0,0);
  ellipse(width*.38, height*.92, szNow,szNow);
  fill(255);
  textSize(20);
  text("Today", width*.32, height*.935);
  
}

void mousePressed()
{
  //make it work so that image stays
  if (mouseX < width*.38+szNow*.5 && mouseX>width*.38-szNow*.5 && mouseY>height*.92-szNow*.5)
  { 
    background(255);
    image(israelNow, xpic, ypic, wdpic*.5, htpic);
    noLoop();
  }
}

void mouseReleased()
{
  loop();
}


