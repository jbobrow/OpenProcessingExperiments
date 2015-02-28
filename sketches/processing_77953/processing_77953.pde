
PFont font;
PFont font2;
float MoveX =0;
float MoveX2 =250;
float reMoveX =-50;
float moveUP =250;

float AL =0;

float YFall= 0;

float Fmove =20;
float Fmove2 =30;
float Fmove3 =25;
float Fmove4 =20;
float Fmove5 =30;
float Fmove6 =25;

float Sloc = 100;
float S1loc = 150;
float S2loc = 0;
float S3loc = 500;
float S4loc = 0;
float S5loc = 0;
float S6loc = 500;
float S7loc = 500;

float SlocM = 5;
float S1locM = 10;
float S2locM = 30;
float S3locM = -25;
float S4locM = 28;
float S5locM = 45;
float S6locM = 15;
float S7locM = -25;


float x = 100; //X coordinate of text
float y = 250; //y cooridnate of text

float x2 = 250; //X coordinate of text
float y2 = 250 ; //y cooridnate of text

float Tsize = 5; // Text Size variable
float Tsize2 = 5;
float Tsize3 = 30;
float dirX = 5;
float dirY = 10;
float dirX2 = 5;
float dirY2 = 1;
String a = "What do I look like to the outsider's eye?";
String b = "Am I?";
String c = "Reclusive?";
String d = "Aloof?";
String e = "Stressed?";
String f = "Do I Appear...";
String g = "CRAZY!?";
String h = ".";
String i = ".";
String j = ".";
String k = "...No Seriously?";
String l = "D0 I?";
String m = "SEEM?";
String n = "P-p-p-pAraNoId?!";
String o = "What if there's > to me";
String p = "Open the door.";
String q = "What am I Really Like?";
String r = "I can be...";
String r2 = "Be...";
String s = "C";
String s1 = "R";
String s2 = "E";
String s3 = "A";
String s4 = "T";
String s5 = "I";
String s6 = "V";
String s7 = "E";
String t = "H";
String t2 = "A";
String t3 = "P";
String t4 = "P";
String t5 = "Y";
String u = "FUNNY";
String u2 = "HA!";
String u3 = "HA!";
String u4 = "HA!";
String u5 = "HA!";
String u6 = "HA!";
String u7 = "HA!";
String u8 = "HA!";
String u9 = "HA!";
String u10 = "HA!";
String u11 = "HA!";
String u12 = "HA!";
String v = "Cool";
String w = "There's much more too me,";
String XX = "But are you willing to learn more?";
String YY = "Move beyond my cover";
String z = "So I may as well.";
String end ="End~";
float opacity = 0;
int frames = 0;


void setup()
{
  size(500, 500);
  font = loadFont("JasmineUPCBold-30.vlw");
  textFont(font);
}

void draw()
{
  smooth();
  frameRate(30);
  background(0);
  text(a, 50, 250); //X and Y cooridnates

  if (millis()> 4000)
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text(b, 150, 250);
  }

  if (millis()> 7000)
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textSize(20);
    text(c, 0, 250);
  }

  if (millis()> 8000)
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text(d, 350, 20);
  }
  if (millis()> 9000) //Stressed
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textSize(100);
    text(e, x, y);
    x += dirX;
    y += dirY;
    if (x >105 || x < 95)
    {
      dirX = -dirX;
    }
    if (y> 255 || y<245)
    {
      dirY =- dirY;
    }
  }    

  if (millis()> 11000) //11 seconds
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255, opacity);
    opacity += 1;
    textSize(50);
    text(f, 200, 250);
  }
  if (millis()> 14000) //11 seconds
  {
    fill(0, 3);
    rect(0, 0, width, height);
    fill(255);
    textSize(50);
    text(g, random(400), random(250)); //CRAZY
  }

  if (millis()> 17000) //17 seconds
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textSize(50);
    text(h, 250, 250);
  }
  if (millis()> 17750) //17.5 seconds
  {
    textSize(50);
    text(i, 260, 250);
  }
  if (millis()> 18500) //18.5 seconds
  {
    textSize(50);
    text(j, 270, 250);
  }
  if (millis()> 20000) //20 seconds
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textSize(22);
    text(k, 250, 250);
  }
  if (millis()> 21000) //20 seconds
  {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textSize(Tsize);
    Tsize +=3;
    text(l, 150, 400);
  }


  if (millis()> 24000)
  {
    textSize(30);
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text(m, 350, 20);
  }
  if (millis()> 25000)
  {
    textSize(30);
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text(n, x2, y2);
    x2 += dirX2;
    y2 += dirY2;
    if (x2 >350 || x2 < 50)
    {
      dirX2 = -dirX2;
    }
    if (y2 > 252 || y2 <248)
    {
      dirY2 = -dirY2;
    }
  }


  if (millis()> 27000) //more to me
  {
    textSize(40);
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text(o, 100, 250);
  }
  if (millis()> 29000) //open the door
  {
    textSize(30);
    fill(0);
    rect(0, 0, width, height);
    fill(0, 100, 220);
    rect(0, 0, 250, 500);
    rect(250, 0, 250, 500);
    fill(255);
    text(p, MoveX2, 250);
  }
  if (millis()> 32000) //open the door
  {
    textSize(50);
    fill(250, 220, 100);
    rect(0, 0, width, height);
    fill(255);
    text(q, 100, 250);
    fill(0, 50, 220);
    rect(MoveX, 0, 250, 500);
    rect(MoveX2, 0, 250, 500);
    fill(255);
    text(p, MoveX2, 250);
    MoveX += reMoveX;
    MoveX2 += reMoveX;
  }

  if (millis()> 34000) //I can be
  {
    textSize(40);
    fill(250, 220, 100);
    rect(0, 0, width, height);
    fill(255);
    text(r, 250, 250);
  }
  if (millis()> 35000) //be...
  {
    textSize(40);
    fill(250, 220, 100);
    rect(0, 0, width, height);
    fill(255);
    text(r2, 245, 250);
  }
  if (millis()> 36000) //C-R-E-A-T-I-V-E
  {
    textSize(40);
    fill(250, 220, 100);
    rect(0, 0, width, height);
    fill(255);
    text(s, Sloc, 250); //Horizontal move in //stop at 200
    text(s1, S1loc, 250); //Hor move in     //stop at 220
    text(s2, 240, S2loc); //vert move      //stop at 240
    text(s3, 260, S3loc); //vert move     //stop at 260
    text(s4, S4loc, 250); // hor move      //stop at 280 
    text(s5, S5loc, 250);  //hor move    //stop at 300
    text(s6, 320, S6loc); //ver move    //stop at 320
    text(s7, 340, S7loc); //ver move    //stop at 340
    Sloc += SlocM;
    S1loc += S1locM;
    S2loc += S2locM;
    S3loc += S3locM;
    S4loc += S4locM;
    S5loc += S5locM;
    S6loc += S6locM;
    S7loc += S7locM;
    if (Sloc>=200) //EACH 15 apart horizontally
    {
      Sloc = 200;
    }
    if (S1loc>=220)
    {
      S1loc = 220;
    }
    if (S2loc>=250)
    {
      S2loc = 250;
    }
    if (S3loc<=250)
    {
      S3loc = 250;
    }
    if (S4loc>=280)
    {
      S4loc = 280;
    }
    if (S5loc>=300)
    {
      S5loc = 300;
    }
    if (S6loc>=250)
    {
      S6loc = 250;
    }
    if (S7loc<=250)
    {
      S7loc = 250;
    }
  }

  if (millis()> 38000) //Happy
  {
    textSize(60);
    fill(250, 220, 100);
    rect(0, 0, width, height);
    fill(0);
    ellipse(200, 180, 30, 50);
    ellipse(300, 180, 30, 50);
    text(t, 160, 290);
    text(t2, 200, 310);
    text(t3, 240, 330);
    text(t4, 280, 310);
    text(t5, 330, 290);
    noFill();
    strokeWeight(5);
    ellipse(250, 250, 300, 300);
  }

  if (millis()> 39000) //I can be
  {
    strokeWeight(1);
    textSize(200);
    fill(250, 220, 100);
    rect(0, 0, width, height);
    fill(255);
    text(u, 50, 250); //FUNNY
    fill(250, 220, 100);
    textSize(20);
    for (int i =0; i <300; i++)
    {
      text(u2, Fmove, 210);
      text(u3, Fmove2, 150);
      text(u4, Fmove3, 170);
      text(u5, Fmove4, 190);
      text(u6, Fmove5, 230);
      text(u7, Fmove6, 250);
      Fmove = Fmove + 20;
      Fmove2 = Fmove + 30;
      Fmove3 = Fmove + 50;
      Fmove4 = Fmove + 20;
      Fmove5 = Fmove + 60;
      Fmove6 = Fmove + 55;
      if (Fmove >500 ||
        Fmove2 >500 ||
        Fmove3 >500 ||
        Fmove4 >500 ||
        Fmove5 >500 ||
        Fmove6 >500)
      {
        Fmove =50;
        Fmove2 =20;
        Fmove3=70;
        Fmove4 =90;
        Fmove5 =50;
        Fmove6 =20;
      }
    }
  }
  if (millis()> 40000) //Cool
  {
    textSize(30);
    fill(20, 50, 250);
    rect(0, 0, width, height);
    fill(255);
    for (int ww = 1; ww <500; ww+=40)
    {
      text(v, ww, YFall);
      YFall = YFall + .9;
    } 
    if (YFall >= 500)
    {
      YFall = 0;
    }
  }

  if (millis()> 43000) //So Much More To Me
  {
    textSize(30);
    fill(0, AL);
    rect(0, 0, width, height);
    AL= AL + 35;
    fill(255);
    text(w, 100, 250);
  }
  if (millis()> 46000) //x But are you willing to learn?
  {
    textSize(30);
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text(XX, 150, 250);
  }

  if (millis()> 48000) //y Go beyond the cover
  {
    textSize(50);
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text(YY, 150, 250);
  }
    if (millis()> 50000) //x So I may as well Tsize3
  {
    textSize(Tsize3);
    Tsize3 =Tsize3 - 1;
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text(z, 150, moveUP);
    moveUP = moveUP -20;
  }
    if (millis()> 53000) //end
  {
    textSize(20);
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    text(end, 450, 470);
  }
}



