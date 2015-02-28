

PFont comic;
float timer = 0;
float x = 0;
PImage logo;
float angle = 0;
float speed = 1;
PImage meme;


void setup()
{
  size(700,700);
  background(0);
 logo = requestImage("pink.jpg");
 meme = requestImage("c.png");
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
     text("I'M JUJU", 20, 35);
   
   }
   
     if (timer == 10)
   {
     textFont(comic);
     textAlign(CENTER,CENTER);
     fill(255);
     textSize(30);
     text("I LOVE PRINCESS STORIES",220,50);
   }
   
     if (timer == 20)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("BECAUSE I'M A GIRL",140,85);
   }
   
    if (timer == 30)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("& MY FAVORITE COLOR IS",400,85);
   }
   
   if (timer == 40)
   {
     textFont(comic);
     fill(#E57FDA);
     textSize(20);
     text("PINK!!! PINK!! PINK!",100,110);
   }
   
     if (timer == 50)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("I ALSO LOVE SHOPPING SOOO0OO MUCH",410,110);
   }
   
     if (timer == 60)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("BECAUSE",85,135);
   }
   
     if (timer == 70)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("I LIKE TO BUY STYLISH CLOTHES, SHOES, MAKEUP...",410,135);
   }
   
   if (timer == 80)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("SO I SPENT A LOTTTTT OF",170,160);
   }
   
   
   if (timer == 90)
   {
     textFont(comic);
     fill(#10C447);
     textSize(30);
     text("MONEY$$$$$$$$$$$$",490,160);
   }
   
    if (timer == 100)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("& I LOVE ART",90,190);
   }
   
    if (timer == 110)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("BECAUSE I'M A GRAPHICS DESIGNER MAJOR!!!",400,190);
   }
   
   
    if (timer == 120)
   {
     textFont(comic);
     fill(255);
     textSize(25);
     text("SO",35,215);
   }
   
   if (timer == 130)
   {
     textFont(comic);
     fill(255);
     textSize(17);
     text("I ALWAYS                           LIKE TO DRAW,",355,215);
   }
 
    if (timer == 140)
   {
     textFont(comic);
     fill(255);
     textSize(15);
     text("READ",22,240);
   }
   
   if (timer == 150)
   {
     textFont(comic);
     fill(255);
     textSize(18);
     text("            OIL, AND WATER",450,237);
   }
   
   if (timer == 160)
   {
     textFont(comic);
     fill(#1BA2D1);
     textSize(10);
     text("COLORS",20,255);
   }
   
    if (timer == 170)
   {
     textFont(comic);
     fill(255);
     textSize(16);
     text("ABOUT",220,230);
   }
   
    if (timer == 180)
   {
     textFont(comic);
     fill(255);
     textSize(14);
     text("PENCILE COLORS",480,255);
   }
   
    if (timer == 190)
   {
     textFont(comic);
     fill(255);
     textSize(13);
     text("ART",220,250);
   }
   
   if (timer == 200)
   {
     textFont(comic);
     fill(255);
     textSize(18);
     text("LEARNING",470,272);
   }
   
   
   if (timer == 210)
   {
     textFont(comic);
     fill(255);
     textSize(16);
     text("ABDUT",450,290);
   }
   
   
    if (timer == 220)
   {
     textFont(comic);
     fill(255);
     textSize(15);
     text("ART & ARTIST",470,310);
   }
   
   if (timer == 230)
   {
     textFont(comic);
     fill(255);
     textSize(16);
     text("ART IS MY",460,322);
   }
   
   
   if (timer == 240)
   {
     textFont(comic);
     fill(#D11B40);
     textSize(15);
     text("LIFE",430,340);
   }
     
   
   if (timer == 260)
   {
     textFont(comic);
     fill(255);
     textSize(14);
     text("I ALSO LOVE MUSIC",490,355);
   }
   
   
   
   if (timer == 270)
   {
     textFont(comic);
     fill(255);
     textSize(15);
     text("BUT I LISTEN TO",475,370);
   }
   
     if (timer == 280)
   {
     textFont(comic);
     fill(255);
     textSize(14);
     text("DIFFERENT SONGS EVERYDAY",510,385);
   }
   
 //    if (timer == 290)
//   {
//     textFont(comic);
//     fill(255);
//     textSize(20);
//     text("AND",376,380);
//   }
   
     if (timer == 300)
   {
     textFont(comic);
     fill(255);
     textSize(15);
     text("ALSO I LOVE",440,400);
   }
   
    if (timer == 310)
   {
     textFont(comic);
     fill(255);
     textSize(15);
     text("SCHOOL",410,420);
   }
   
    if (timer == 320)
   {
     textFont(comic);
     fill(#0DDECE);
     textSize(20);
     text("SO",390,440);
   }
   
 if (timer == 330)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("I",380,460);
   }
   
    if (timer == 340)
   {
     textFont(comic);
     fill(#EA2125);
     textSize(20);
     text("L",360,480);
   }
   
   if (timer == 350)
   {
     textFont(comic);
     fill(#EA2125);
     textSize(20);
     text("O",340,500);
   }
   
  if (timer == 360)
   {
     textFont(comic);
     fill(#EA2125);
     textSize(20);
     text("V",320,520);
   }
   
    if (timer == 370)
   {
     textFont(comic);
     fill(#EA2125);
     textSize(20);
     text("E",310,540);
   }
   
     if (timer == 380)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("H",300,560);
   }
   
     if (timer == 390)
   {
     textFont(comic);
     fill(255);
     textSize(30);
     text(".",290,570);
   }
   
   if (timer == 400)
   {
     textFont(comic);
     fill(255);
     textSize(20);
     text("W",300,600);
   }
   
    if (timer == 230)
   {
     textFont(comic);
     fill(255);
     textSize(30);
     text("#",15,280);
   }
   
    if (timer == 260)
   {
     textFont(comic);
     fill(255);
     textSize(28);
     text("##",24,300);
   }
    if (timer == 290)
   {
     textFont(comic);
     fill(255);
     textSize(30);
     text("##",25,330);
   }
   if (timer == 290)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("##",25,360);
   }
   
    if (timer == 300)
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
     text("#####",30,440);
   } 
   
    if (timer == 370)
   {
     textFont(comic);
     fill(255);
     textSize(36);
     text("######",25,470);
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
     text("##############",45,620);
   } 
   
   if (timer == 550)
   {
     textFont(comic);
     fill(255);
     textSize(35);
     text("###############",50,650);
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
     fill(random(#ED78E7));
     textSize(60); 
     pushMatrix();
     translate(215, 50);
     rotate(angle);
     text("PrOjEcTs   8",260,0); 
     popMatrix();     
   }    
   
   
     if (timer > 770)
   {
     textFont(comic);     
     fill(random(260), random(#EAFF08), random(260));
     textSize(70); 
     pushMatrix();
     translate(215, 50);
     rotate(angle);
     text("CoOl", 550,0); 
     popMatrix();     
   }    
   
    if (timer == 700)
   {
    
     image(meme, 150 , 0);
    
   }
   
}




