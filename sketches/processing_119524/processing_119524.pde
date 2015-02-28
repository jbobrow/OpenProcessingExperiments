
PFont comic;
float timer = 0;
float x = 0;
PImage logo;
float angle = 0;
float speed = 1;
PImage meme;


void setup()
{
  size(400,700);
  background(0);
 logo = requestImage("logo.jpg");
 meme = requestImage("meme.png");
  comic = createFont("Comic Sans MS",64);
}
 
void draw()
{
  timer += 1;
  angle += 0.1;
  x += speed;

     if (timer == 5)
   {
     
     textFont(comic);
     fill(255);
     textSize(30);
     text("I'M ALEX VILLAGOMEZ", 20, 35);
   
   }
   
     if (timer == 10)
   {
     textFont(comic);
     textAlign(CENTER,CENTER);
     fill(255);
     textSize(40);
     text("I LOVE WATCHING",200,50);
   }
   
     if (timer == 20)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("THE NATIONAL",90,85);
   }
   
    if (timer == 30)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("BASKETBALL",320,85);
   }
   
   if (timer == 40)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("ASSOCIATION",80,110);
   }
   
     if (timer == 50)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("& SHOOTING",320,110);
   }
   
     if (timer == 60)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("HOOPS @ THE",85,135);
   }
   
     if (timer == 70)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("PARK WITH",320,135);
   }
   
   if (timer == 80)
   {
     textFont(comic);
     fill(255);
     textSize(30);
     text("MY",38,160);
   }
   
   
   if (timer == 90)
   {
     textFont(comic);
     fill(255);
     textSize(30);
     text("FRIENDS",315,160);
   }
   
    if (timer == 100)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("BUT",30,190);
   }
   
    if (timer == 110)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("LATELY",345,190);
   }
   
   
    if (timer == 120)
   {
     textFont(comic);
     fill(255);
     textSize(25);
     text("I",35,215);
   }
   
   if (timer == 130)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("HAVE",355,215);
   }
 
    if (timer == 140)
   {
     textFont(comic);
     fill(255);
     textSize(12);
     text("NOT",22,240);
   }
   
   if (timer == 150)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("HAD",360,237);
   }
   
   if (timer == 160)
   {
     textFont(comic);
     fill(255);
     textSize(10);
     text("ANY",20,255);
   }
   
    if (timer == 170)
   {
     textFont(comic);
     fill(255);
     textSize(12);
     text("TIME",270,255);
   }
   
    if (timer == 180)
   {
     textFont(comic);
     fill(255);
     textSize(10);
     text("2 WATCH",365,255);
   }
   
    if (timer == 190)
   {
     textFont(comic);
     fill(255);
     textSize(13);
     text("GAMES",272,270);
   }
   
   if (timer == 200)
   {
     textFont(comic);
     fill(255);
     textSize(18);
     text("DUE",370,272);
   }
   
   
   if (timer == 210)
   {
     textFont(comic);
     fill(255);
     textSize(40);
     text("TO",272,290);
   }
   
   
    if (timer == 220)
   {
     textFont(comic);
     fill(255);
     textSize(22);
     text("THE",370,295);
   }
   
   if (timer == 230)
   {
     textFont(comic);
     fill(255);
     textSize(23);
     text("FACT",274,322);
   }
   
   
   if (timer == 240)
   {
     textFont(comic);
     fill(255);
     textSize(15);
     text("THAT",375,322);
   }
     
   
   if (timer == 260)
   {
     textFont(comic);
     fill(255);
     textSize(30);
     text("I AM",280,350);
   }
   
   
   
   if (timer == 270)
   {
     textFont(comic);
     fill(255);
     textSize(30);
     text("AT",375,350);
   }
   
     if (timer == 280)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("WORK",280,380);
   }
   
     if (timer == 290)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("AND",376,380);
   }
   
     if (timer == 300)
   {
     textFont(comic);
     fill(255);
     textSize(15);
     text("SCHOOL",280,400);
   }
   
    if (timer == 310)
   {
     textFont(comic);
     fill(255);
     textSize(15);
     text("EVERY",375,400);
   }
   
    if (timer == 320)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("S",290,420);
   }
   
 if (timer == 330)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("I",280,440);
   }
   
    if (timer == 340)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("N",280,460);
   }
   
   if (timer == 350)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("G",290,480);
   }
   
  if (timer == 360)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("L",305,495);
   }
   
    if (timer == 370)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("E",325,500);
   }
   
     if (timer == 380)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("D",355,497);
   }
   
     if (timer == 390)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("A",370,475);
   }
   
   if (timer == 400)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("Y",375,445);
   }
   
    if (timer == 410)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("!",380,420);
   }
   
    if (timer == 420)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("W",283,505);
   }
   
   if (timer == 430)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("H",300,520);
   }
   
     if (timer == 440)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("E",325,525);
   }
   
   if (timer == 450)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("N",345,525);
   }
   
      if (timer == 460)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("I",380,505);
   }
   
    if (timer == 470)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("A",283,537);
   }
   
    if (timer == 480)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("M",305,543);
   }
   
    if (timer == 490)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("D",335,544);
   }
   
    if (timer == 500)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("O",353,544);
   }
   
   if (timer == 510)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("N",370,542);
   }
   
    if (timer == 520)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("E",390,542);
   }
   
   if (timer == 530)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("WITH",340,567);
   }
   
   if (timer == 540)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("THIS",345,600);
   }
   
   if (timer == 550)
   {
     textFont(comic);
     fill(255);
     textSize(16);
     text("QUARTER",349,629);
   }
   
   if (timer == 560)
   {
     textFont(comic);
     fill(255);
     textSize(18);
     text("I'LL BE",354,649);
   }
   
    if (timer == 570)
   {
     textFont(comic);
     fill(255);
     textSize(18);
     text("HAPPY",355,670);
   }
   
     if (timer == 580)
   {
     textFont(comic);
     fill(255);
     textSize(19);
     text("!!!!!!!!!!!",355,687);
   }
   
    if (timer == 230)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("#",15,320);
   }
   
    if (timer == 260)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("##",25,350);
   }
   
    if (timer == 290)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("###",25,380);
   } 
   
    if (timer == 310)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("####",25,410);
   } 
   
   
    if (timer == 340)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("#####",25,440);
   } 
   
    if (timer == 370)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("######",20,470);
   } 
   
   
   if (timer == 400)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("#######",25,500);
   } 
   
   if (timer == 430)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("##########",25,530);
   } 
   
   if (timer == 460)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("############",25,560);
   } 
   
   if (timer == 490)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("##############",25,590);
   } 
   
   if (timer == 520)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("##############",25,620);
   } 
   
   if (timer == 550)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("###############",25,650);
   } 
   
   if (timer == 580)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("#################",25,680);
   } 
   
   
  if (timer == 650)
   {
     image(logo, 0 , 0);
   }
   
   
   
     
    if (timer > 670)
   {
     textFont(comic);       
     fill(random(255));
     textSize(80); 
     pushMatrix();
     translate(215, 50);
     rotate(angle);
     text("PrOjEcTs",260,0); 
     popMatrix();     
   }    
   
   
     if (timer > 770)
   {
     textFont(comic);     
     fill(random(260), random(260), random(260));
     textSize(80); 
     pushMatrix();
     translate(215, 50);
     rotate(angle);
     text("wOrK", 550,0); 
     popMatrix();     
   }    
   
    if (timer == 700)
   {
    
     image(meme, 150 , 0);
    
   }
   
}



