
/*
4. Narrate
Write a program that tells a non-linear story based on A Grimm’s fairy tale.
Use the original illustrations by Gustave Dore to illustrate the story. You can choose one of the following stories:
Donkey-Skin, The Sleeping Beauty in the Woods, Little Red Riding-Hood, Bluebeard, Puss in Boots, Cinderella, Hop o’ my Thumb.

Name: Kuo-Ang Huang
UID: 703-783-811
*/

int scene = 0;
boolean pchk = false;
int d = 0;
int dflag = 0;
int ang = 0;
int oscflag = 0;
int shakeX = 0;
int shakeY = 0;

int posX = 0;
int posY = 0;
int boxX = 0;
int boxY = 0;
int bsizeX = 0;
int bsizeY = 0;
String txt1, txt2, txt3, txt4;

int Cchk = 0;
int Dchk = 0;
int Hchk = 0;

PFont mytxt, mytxt1;

PImage bgp1, bgp2, bgp3, red2, red3, mom1, pie1, grandpa1, aunt1, flower1, house, wolf2, boy1, grandma1;

void setup()
{ 
  size(640, 480);
  smooth();
  background(255);
  
  mytxt = loadFont("Porkys-24.vlw");
  mytxt1 = loadFont("ComicSansMS-Bold-14.vlw");
  
  textFont(mytxt);
  
  bgp1 = loadImage("red_riding_hood-1.png");
  bgp2 = loadImage("red_riding_hood-2.png");
  bgp3 = loadImage("red_riding_hood-3.png");
  red2 = loadImage("red2.png");
  red3 = loadImage("red3.png");
  mom1 = loadImage("mom1.png");
  pie1 = loadImage("pie1.png");
  grandpa1 = loadImage("grandpa1.png");
  aunt1 = loadImage("aunt1.png");
  flower1 = loadImage("flower1.png");
  house = loadImage("house.jpg");
  wolf2 = loadImage("wolf2.png");
  boy1 = loadImage("boy1.png");
  grandma1 = loadImage("grandma1.png");
  noCursor();
  
}

void draw()
{
  posX = mouseX;
  posY = mouseY;
  int tposX = constrain(posX, 140, 340);
  
  background(220, 110, 30);
//===========================================Scenes============================================
  if(scene == 0)
  {
    textFont(mytxt);
    fill(200, 20, 20);
    text("Another Story of Little Red Riding Hood", 100, 200);
    boxX = 280;
    boxY = 400;
    bsizeX = 80;
    bsizeY = 40;
    textFont(mytxt1);
    txt1 = "START";
    button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 1);
  }
  else if(scene == 1)
  {
     image(red3, 40, 120, 150, 200);
     image(pie1, 300-d, 100+d, 100, 50);
     image(mom1, 400, 30, 180, 130);     
     dcount(100);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("Little Red Riding Hood's mom asks Red to send a pie to her grandma living in the forest.  Red picks the pie and... ", 80, 350, 500, 100);
     
     bsizeX = 120;
     bsizeY = 70;
     txt1 = "departs to the grandma's house ";
     txt2 = "goes to aunt's house to play ";
     txt3 = "strolls around in the town ";
     
     button3(bsizeX, bsizeY, 80, 400, 280, 400, 480, 400, txt1, txt2, txt3, 5, 4, 2);
  }
  else if(scene == 2)
  {
     image(red3, 350, 320-d, 150, 200);
     image(grandpa1, 350, -80+d, 150, 200);
     dcount(100);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("While Red is strolling in the town, she meets her grandpa.  Grandpa asks Red where she is going... ", 30, 40, 200, 200);
     
     bsizeX = 110;
     bsizeY = 50;
     txt1 = "Tell him ";
     txt2 = "Don't tell him ";
     
     button2(bsizeX, bsizeY, 50, 130, 50, 200, txt1, txt2, 3, 3);
     
     if(pover(posX, posY, 50, 130, bsizeX, bsizeY))
       Cchk = 1;
     else if(pover(posX, posY, 50, 200, bsizeX, bsizeY))
       Cchk = 0;
  }
  else if(scene == 3)
  {
     image(red3, 350, 220, 150, 200);
     image(grandpa1, 350, 20, 150, 200);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("Grandpa tells Red that her aunt is looking for her... ", 30, 40, 200, 200);
     
     bsizeX = 140;
     bsizeY = 70;
     txt1 = "I will be late to the grandma's house ";
     txt2 = "If aunt is looking for me... ";
     
     button2(bsizeX, bsizeY, 50, 100, 50, 200, txt1, txt2, 5, 4);
  }
  else if(scene == 4)
  {
     image(pie1, 170, 220, 100, 50);
     pushMatrix();
     translate(225, 400);
     rotate(radians(-15+(ang/2)));
     image(red3, -75, -150, 150, 200);
     popMatrix();
     image(aunt1, 150, 40, 150, 150);
     oscount(60);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("Red's aunt makes a pie and wants Red to send it to her grandma too ", 370, 40, 200, 200);
     
     bsizeX = 120;
     bsizeY = 70;
     txt1 = "No problem ";
     txt2 = "One pie is heavy enough... ";
     
     button2(bsizeX, bsizeY, 400, 110, 400, 200, txt1, txt2, 5, 5);
     
     if(pover(posX, posY, 400, 110, bsizeX, bsizeY))
       Dchk = 1;
     else if(pover(posX, posY, 400, 200, bsizeX, bsizeY))
       Dchk = 0;
  }
  else if(scene == 5)
  {
     pushMatrix();
     translate(150+d, 220);
     rotate(radians(-15+(ang/2)));
     image(bgp1, -100, -160, 200, 312);
     popMatrix();
     dcount(300);
     oscount(60);
     
     textFont(mytxt1);
     fill(0, 60, 30);
     text("While Red is singing and walking in the forest, a big bad wolf jumps out.  \"Hello, Little Red.  Where are you going?\" , said the big bad wolf. ", 80, 30, 500, 200);
     
     bsizeX = 120;
     bsizeY = 70;
     txt1 = "I am going to my grandma's house ";
     txt2 = "Who will tell you ";
     
     button2(bsizeX, bsizeY, 150, 400, 350, 400, txt1, txt2, 7, 6);
  }
  else if(scene == 6)
  {
     image(bgp1, 210, 70, 200, 312);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("Red ignores the big bad wolf, and the big bad wolf seems to get angry.  He asks Red again where she is going... ", 80, 30, 500, 200);
     
     bsizeX = 120;
     bsizeY = 70;
     txt1 = "I will never tell you ";
     txt2 = "OK, OK, I am going to my grandma's house ";
     
     button2(bsizeX, bsizeY, 150, 400, 350, 400, txt1, txt2, 30, 7);
  }
  else if(scene == 7)
  {
     shake(18);
     image(bgp2, 210+shakeX, 90+shakeY, 200, 312);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("After Little Red Riding Hood tells the big bad wolf that she is going to her grandma's house.  The big bad wolf runs like wind to the grandma's house and swallows the grandma.  He then dresses as a grandma and lies on the bed to wait for Red coming. ", 80, 30, 500, 200);
     
     bsizeX = 70;
     bsizeY = 40;
     boxX = 280;
     boxY = 420;       
     String txt = "Next ";
     button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt, 8);
  }
  else if(scene == 8)
  {
     image(red3, tposX, 100, 150, 200);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("There are two roads in front of the Little Red Riding Hood.  Red chooses... ", 90, 400, 500, 200);
     
     bsizeX = 60;
     bsizeY = 40;
     txt1 = "Left ";
     txt2 = "Right ";
     
     button2(bsizeX, bsizeY, 60, 200, 520, 200, txt1, txt2, 9, 10);
  }
  else if(scene == 9)
  {
     image(red3, tposX, 100, 150, 200);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("There are two roads in front of the Little Red Riding Hood again.  Red chooses... ", 90, 400, 500, 200);
     
     bsizeX = 60;
     bsizeY = 40;
     txt1 = "Left ";
     txt2 = "Right ";
     
     button2(bsizeX, bsizeY, 60, 200, 520, 200, txt1, txt2, 8, 12);
  }
  else if(scene == 10)
  {
     image(red3, tposX, 100, 150, 200);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("There are two roads in front of the Little Red Riding Hood again.  Red chooses... ", 90, 400, 500, 200);
     
     bsizeX = 60;
     bsizeY = 40;
     txt1 = "Left ";
     txt2 = "Right ";
     
     button2(bsizeX, bsizeY, 60, 200, 520, 200, txt1, txt2, 11, 12);
  }
  else if(scene == 11)
  {
     pushMatrix();
     translate(310, 180);
     rotate(radians(110+(ang/2)));
     image(flower1, -75, -65, 150, 150);
     popMatrix();
     oscount(60);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("While Little Red Riding Hood is finding a road to her grandma's house, a strange flower attracts Red attention.  ", 80, 350, 500, 200);
     
     bsizeX = 130;
     bsizeY = 70;
     txt1 = "Pick the flower up and put it on a pie ";
     txt2 = "The flower looks like poisoned... ";
     
     button2(bsizeX, bsizeY, 150, 400, 350, 400, txt1, txt2, 12, 12);
     
     if(pover(posX, posY, 150, 400, bsizeX, bsizeY))
       Hchk = 1;
     else if(pover(posX, posY, 350, 400, bsizeX, bsizeY))
       Hchk = 0;
  }
  else if(scene == 12)
  {
     image(house, 210, 90, 200, 300);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("Finally, Little Red Riding Hood arrives grandma's house.  The grandma wolf asks Red to come in when Red knocks the door.  Red sees her grandma and goes closer to the bed. ", 80, 30, 500, 200);
     
     bsizeX = 70;
     bsizeY = 40;
     boxX = 280;
     boxY = 400;       
     String txt = "Next ";
     button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt, 13);
  }
  else if(scene == 13)
  {
     image(bgp3, 210, 130, 200, 312);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("\"Oh grandma, what long arms you have!\" ", 170, 30, 500, 200);
     text("\"All the better to hug you with, my dear.\" ", 210, 45, 500, 200);
     text("\"Oh grandma, what big eyes you have!\" ", 170, 60, 500, 200);
     text("\"All the better to see you with, my dear.\" ", 210, 75, 500, 200);
     text("\"Oh grandma, what great big teeth you have!\" ", 170, 90, 500, 200);
     text("\"They are all the better to EAT YOU WITH!.\" ", 210, 105, 500, 200);
     
     bsizeX = 120;
     bsizeY = 60;
     if(Cchk == 0)
     {
         if(Hchk == 0)
         {
            boxX = 50;
            boxY = 150;       
            txt1 = "SCREAMmmmm... ";
            button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 30);
         }
         else
         {
            txt1 = "SCREAMmmmm... ";
            txt2 = "Throw the flowered pie ";
            
            button2(bsizeX, bsizeY, 50, 150, 50, 250, txt1, txt2, 30, 31);
         }
     }
     else
     {
         if(Hchk == 0)
         {
            txt1 = "SCREAMmmmm... ";
            txt2 = "HELP!!! ";
            
            button2(bsizeX, bsizeY, 50, 150, 450, 150, txt1, txt2, 30, 33);
         }
         else
         {
            txt1 = "SCREAMmmmm... ";
            txt2 = "Throw the flowered pie ";
            txt3 = "HELP!!! ";
            txt4 = "Eat the flowered pie ";
            
            button4(bsizeX, bsizeY, 50, 150, 50, 250, 450, 150, 450, 250, txt1, txt2, txt3, txt4, 30, 31, 33, 34);
         }
     }
  }
//==============================================Endings============================================================================
  else if(scene == 30)
  {
     shake(9);
     image(red3, 100+shakeX, 150+shakeY, 100, 150);
     pushMatrix();
     translate(450-d, 230);
     rotate(radians(-30));
     image(wolf2, -60, -110, 120, 220);
     popMatrix();
     dcount(150);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("The big bad wolf grips Little Red Riding Hood without hesitance and says, \"My cute small meatttt.\"  While Red is screaming, the big bad wolf opens his mouth and swallows Red into his stomach. ", 80, 50, 500, 200);
     
     bsizeX = 90;
     bsizeY = 40;
     boxX = 280;
     boxY = 400;       
     txt1 = "The End ";
     button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 0);
     chkreset();
  }
  else if(scene == 31)
  {
     tint(255, 1.5*d);
     image(boy1, 220, 140, 200, 200);
     tint(255, 255-1.5*d);
     image(wolf2, 230, 130, 120, 220);
     dcount(170);
     noTint();
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("Little Red Riding Hood dodges the big bad wolf's attack and throws the flowered pie into the wolf's mouth.  Suddenly, the big bad wolf feels cursed and spits Red's grandma out.  The wolf's body shoots out thousands light and transforms into a little nice boy. ", 80, 30, 500, 200);
     
     bsizeX = 90;
     bsizeY = 40;
     boxX = 280;
     boxY = 400;
     if(Dchk == 0)
     {      
       txt1 = "The End ";
       button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 0);
       chkreset();
     }
     else
     {       
       txt1 = "????? ";
       button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 32);
     }
  }
  else if(scene == 32)
  {
     pushMatrix();
     translate(110, 220);
     rotate(radians(-15+(ang/2)));
     image(red3, -75, -100, 150, 200);
     popMatrix();
     pushMatrix();
     translate(310, 220);
     rotate(radians(-15+(ang/2)));
     image(boy1, -100, -100, 200, 200);
     popMatrix();
     pushMatrix();
     translate(510, 230);
     rotate(radians(-15+(ang/2)));
     image(grandma1, -100, -100, 200, 200);
     popMatrix();
     oscount(60);
 
     textFont(mytxt1);
     fill(0, 60, 30);
     text("The little nice boy says thanks to Little Red Riding Hood.  He has been transformed into a big bad wolf by an evil wizard.  Grandma, nice boy and Red enjoy the left pie, and they become good friends. ", 80, 30, 500, 200);
     
     bsizeX = 90;
     bsizeY = 40;
     boxX = 280;
     boxY = 400;       
     txt1 = "The End ";
     button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 0);
     chkreset();
  }
  else if(scene == 33)
  {
     pushMatrix();
     translate(60, 180);
     rotate(radians(-2*d));   
     scale(1.1 - float(d)/360.0);
     image(wolf2, -30, -55, 60, 110);
     popMatrix();
     shake(9);
     image(red3, 300+shakeX, 120+shakeY, 150, 200);
     image(grandma1, 430+shakeX, 120+shakeY, 200, 200);
     image(grandpa1, 100, 120, 200, 200);
     dcount(360);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("After Little Red Riding Hood left the town, grandpa decided to see grandma too.  Before grandpa arrives the grandma's house, he hears the scream of Red.  Grandpa rushes into the grandma's house and sees the big stomach wolf.  Grandpa uses his head to kill the wolf and saves the grandma and Red. ", 80, 20, 500, 200);
     
     bsizeX = 90;
     bsizeY = 40;
     boxX = 280;
     boxY = 400;       
     txt1 = "The End ";
     button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 0);
     chkreset();
  }
   else if(scene == 34)
  {
     pushMatrix();
     translate(200, 220);
     scale(1.0 + float(d)/400);
     image(red3, -75, -100, 150, 200);
     popMatrix();
     pushMatrix();
     translate(400-d/2, 220+d/2);
     scale(1.0 - float(d)/300);
     image(wolf2, -60, -110, 120, 220);
     popMatrix();
     dcount(200);
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("Little Red Riding Hood kicks the wolf's mouth back and eats the flowered pie.  Red's body grows so fast.  When the big bad wolf sees Red again, Red becomes a giant.  Red catches the wolf and squeezes her grandma out.  After Red kills the wolf, she starts crying because she doesn't know how to transform back... ", 80, 30, 500, 200);
     
     bsizeX = 90;
     bsizeY = 40;
     boxX = 280;
     boxY = 400;  
     if(Dchk == 0)
     {    
       txt1 = "The End ";
       button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 0);
       chkreset();
     }
     else
     {      
       txt1 = "Wouaaa.. ";
       button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 35);
     }
  }
  else if(scene == 35)
  {    
     image(red3, 240, 120, 150, 200);
     pushMatrix();
     translate(310+d, 410);
     rotate(radians(120));
     image(wolf2, -30, 55, 60, 110);
     popMatrix();
     image(grandma1, 380, 120, 200, 200);
     image(pie1,  350-d, 330, 120, 60);
     image(grandpa1, 40, 120, 200, 200);
     dcount(100);     
    
     textFont(mytxt1);
     fill(0, 60, 30);
     text("Grandpa sees the Giant Red Riding Hood after he arrives grandma's house.  He tells Red to calm down and starts preparing a magic medicine.  Grandpa puts the medicine on the left pie and let Red eat it.  Amazingly, Red's body transforms back to the normal size.  Grandpa, grandma and Red have a delicious wolf dinner at the night. ", 80, 20, 500, 200);
     
     bsizeX = 90;
     bsizeY = 40;
     boxX = 280;
     boxY = 400;       
     txt1 = "The End ";
     button(posX, posY, boxX, boxY, bsizeX, bsizeY, txt1, 0);
     chkreset();
  }
  
  image(red2, posX -15, posY -15, 30, 30);
 
}

//=========================Mouse pressed check================================
void mousePressed()
{
  if(pover(posX, posY, boxX, boxY, bsizeX, bsizeY))
    pchk = true;
}

//============================================One button=======================================
void button(int posX, int posY, int boxX, int boxY, int bsizeX, int bsizeY, String txt, int chgscn)
{
  if(pover(posX, posY, boxX, boxY, bsizeX, bsizeY))
  {
    noStroke();
    fill(200, 20, 20);
    rect(boxX, boxY, bsizeX, bsizeY);
    fill(220, 200, 100);
    text(txt, boxX+15, boxY+15, bsizeX-20, bsizeY);
    if(pchk)
    {
      scene = chgscn;     
      d = 0;
      ang = 0;
      pchk = false;
    }
  }
  else
  {
    noStroke();
    fill(220, 100, 200);
    rect(boxX, boxY, bsizeX, bsizeY);
    fill(20, 20, 140);
    text(txt, boxX+15, boxY+15, bsizeX-20, bsizeY);
  }
}
//====================2 buttons set=======================================
void button2(int bsizeX, int bsizeY, int boxX1, int boxY1, int boxX2, int boxY2, String txt1, String txt2, int sc1, int sc2)
{
     if(pover(posX, posY, boxX1, boxY1, bsizeX, bsizeY))
     {
       boxX = boxX1;
       boxY = boxY1;       
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
     }
     else if(pover(posX, posY, boxX2, boxY2, bsizeX, bsizeY))
     {
       boxX = boxX2;
       boxY = boxY2;       
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
     }
     else
     {
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
     }
}

//====================3 buttons set=======================================
void button3(int bsizeX, int bsizeY, int boxX1, int boxY1, int boxX2, int boxY2, int boxX3, int boxY3, String txt1, String txt2, String txt3, int sc1, int sc2, int sc3)
{
     if(pover(posX, posY, boxX1, boxY1, bsizeX, bsizeY))
     {
       boxX = boxX1;
       boxY = boxY1;       
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
       button(posX, posY, boxX3, boxY3, bsizeX, bsizeY, txt3, sc3);
     }
     else if(pover(posX, posY, boxX2, boxY2, bsizeX, bsizeY))
     {
       boxX = boxX2;
       boxY = boxY2;       
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
       button(posX, posY, boxX3, boxY3, bsizeX, bsizeY, txt3, sc3);
     }
     else if(pover(posX, posY, boxX3, boxY3, bsizeX, bsizeY))
     {
       boxX = boxX3;
       boxY = boxY3;       
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
       button(posX, posY, boxX3, boxY3, bsizeX, bsizeY, txt3, sc3);
     }
     else
     {
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
       button(posX, posY, boxX3, boxY3, bsizeX, bsizeY, txt3, sc3);
     }
}

//================4 buttons set============================================
void button4(int bsizeX, int bsizeY, int boxX1, int boxY1, int boxX2, int boxY2, int boxX3, int boxY3, int boxX4, int boxY4, String txt1, String txt2, String txt3, String txt4, int sc1, int sc2, int sc3, int sc4)
{
     if(pover(posX, posY, boxX1, boxY1, bsizeX, bsizeY))
     {
       boxX = boxX1;
       boxY = boxY1;       
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
       button(posX, posY, boxX3, boxY3, bsizeX, bsizeY, txt3, sc3);
       button(posX, posY, boxX4, boxY4, bsizeX, bsizeY, txt4, sc4);
     }
     else if(pover(posX, posY, boxX2, boxY2, bsizeX, bsizeY))
     {
       boxX = boxX2;
       boxY = boxY2;       
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
       button(posX, posY, boxX3, boxY3, bsizeX, bsizeY, txt3, sc3);
       button(posX, posY, boxX4, boxY4, bsizeX, bsizeY, txt4, sc4);
     }
     else if(pover(posX, posY, boxX3, boxY3, bsizeX, bsizeY))
     {
       boxX = boxX3;
       boxY = boxY3;       
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
       button(posX, posY, boxX3, boxY3, bsizeX, bsizeY, txt3, sc3);
       button(posX, posY, boxX4, boxY4, bsizeX, bsizeY, txt4, sc4);
     }
     else if(pover(posX, posY, boxX4, boxY4, bsizeX, bsizeY))
     {
       boxX = boxX4;
       boxY = boxY4;       
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
       button(posX, posY, boxX3, boxY3, bsizeX, bsizeY, txt3, sc3);
       button(posX, posY, boxX4, boxY4, bsizeX, bsizeY, txt4, sc4);
     }
     else
     {
       button(posX, posY, boxX1, boxY1, bsizeX, bsizeY, txt1, sc1);
       button(posX, posY, boxX2, boxY2, bsizeX, bsizeY, txt2, sc2);
       button(posX, posY, boxX3, boxY3, bsizeX, bsizeY, txt3, sc3);
       button(posX, posY, boxX4, boxY4, bsizeX, bsizeY, txt4, sc4);
     }
}

//======================Mouse over the button=======================================
boolean pover(int posX, int posY, int boxX, int boxY, int bsizeX, int bsizeY)
{
  return (posX >boxX && posX <boxX+bsizeX && posY >boxY && posY <boxY+bsizeY);
}

//======================Reset C, D, H chks after restart============================
void chkreset()
{
  Cchk = 0;
  Dchk = 0;
  Hchk = 0;
}

//======================D countor===================================================
void dcount(int range)
{
   if(dflag == 0)
   {
     d++;
     if(d >range+1)
      dflag = 1;
   }
   else
   {
     d--;
     if(d <-1)
       dflag = 0;
   }
}

//======================Angle countor==========================================
void oscount(int range)
{
   if(oscflag == 0)
   {
     ang++;
     if(ang >range+1)
      oscflag = 1;
   }
   else
   {
     ang--;
     if(ang <-1)
       oscflag = 0;
   }
}

//=====================Shake the picture=============================================
void shake(int f)
{
    shakeX = 2*round(sin(f*radians(d)));
    shakeY = 2*round(2*sin(2*f*radians(d)));
    dcount(360);
}

