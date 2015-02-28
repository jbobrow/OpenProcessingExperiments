
//George F, CP 1 (4-5)
//TRON
void setup()
{
  size(200, 200);
  background(0);
}

//Main Bools
boolean menu=true;
boolean game=false;
boolean rules=false;
boolean action=false;
//Color Changes
int rplay = 255;
int gplay = 255;
int bplay = 255;
int rrules = 255;
int grules = 255;
int brules = 255;
int rback = 255;
int gback = 255;
int bback = 255;
int rmenu = 255;
int gmenu = 255;
int bmenu = 255;
int rrestart = 255;
int grestart = 255;
int brestart = 255;
//movement
int x= 20;
int y= 80;
int direction = 1;
int changey=0;
int changex=1;
int cx= 180;
int cy= 80;
int cxchange=-1;
int cychange=0;
int compDir=8;

void draw()
{
  //background(0);
  menu();  
  rules();
  game();
  textAlign(CENTER);
  textSize(10);
  fill(255);
  text("A GeorgeF Production", 100, 195);
}

void menu()
{
  if (menu==true && game==false && rules==false)
  {
    background(0);
    //title
    fill(0, 0, 255);
    textSize(30);
    text("TRON", 100, 30);
    //play
    stroke(255);
    noFill();
    rect(50, 50, 100, 30);
    fill(rplay, gplay, bplay);
    text("PLAY", 100, 75);
    //rules
    stroke(255);
    noFill();
    rect(50, 100, 100, 30);
    fill(rrules, grules, brules);
    text("RULES", 100, 125);
    //rollover
    if (mouseX < 151 && mouseX > 49 && mouseY < 81 && mouseY > 49)
    {
      rplay=0;
      bplay=0;
    }
    else
    {
      rplay=255;
      bplay=255;
    }
    if (mouseX < 151 && mouseX > 49 && mouseY < 131 && mouseY > 99)
    {
      rrules=0;
      brules=0;
    }
    else
    {
      rrules=255;
      brules=255;
    }
    //click
    if (mousePressed && mouseX < 151 && mouseX > 49 && mouseY < 131 && mouseY > 99)
    {
      menu=false;
      rules=true;
    }
    if (mousePressed && mouseX < 151 && mouseX > 49 && mouseY < 81 && mouseY > 49)
    {
      menu=false;
      game=true;
      action=true;
      x= 20;
      y= 80;
      direction = 1;
      changey=0;
      changex=1;
      cychange=0;
      cxchange=-1;
      background(0);
    }
  }
}

void rules()
{

  if (menu==false && rules==true && game==false)
  {
    background(0);
    fill(0, 0, 255);
    textSize(15);
    text("CONTROLS/INSTRUCTIONS", 100, 20);
    fill(255);
    textSize(13);
    text("Use WASD to move.", 100, 40);
    text("Don't crash into your own trail.", 100, 60);
    text("Don't crash into other trails.", 100, 80);
    text("Don't fall off the arena.", 100, 100);
    noFill();
    rect(50, 150, 100, 30);
    textSize(30);
    fill(rback, gback, bback);
    text("BACK", 100, 175);
    //rollover
    if (mouseX < 151 && mouseX > 49 && mouseY < 181 && mouseY > 149)
    {
      rback=0;
      bback=0;
    }
    else
    {
      rback=255;
      bback=255;
    }
    //click
    if (mousePressed && mouseX < 151 && mouseX > 49 && mouseY < 181 && mouseY > 149)
    {
      menu=true;
      rules=false;
    }
  }
}

void game()
{
  frameRate(30);
  if (menu==false && rules==false && game==true) 
  {
    noFill();
    stroke(255, 0, 0);
    rect(10, 10, 180, 140);
    noFill();
    stroke(255);
    rect(25, 160, 50, 20);
    textSize(15);
    fill(rmenu, gmenu, bmenu);
    text("MENU", 50, 175);
    noFill();
    rect(115, 160, 70, 20);
    textSize(15);
    fill(rrestart, grestart, brestart);
    text("RESTART", 150, 175);
    //rollover
    if (mouseX < 76 && mouseX > 24 && mouseY < 181 && mouseY > 159)
    {
      rmenu=0;
      bmenu=0;
    }
    else
    {
      rmenu=255;
      bmenu=255;
    }
    if (mouseX < 186 && mouseX > 114 && mouseY < 181 && mouseY > 159)
    {
      rrestart=0;
      brestart=0;
    }
    else
    {
      rrestart=255;
      brestart=255;
    }
    //click
    if (mousePressed && mouseX < 76 && mouseX > 24 && mouseY < 181 && mouseY > 159)
    {
      game=false;
      menu=true;
      background(0);
      x= 20;
      y= 80;
      direction = 1;
      changey=0;
      changex=1;
      cx=180;
      cy=80;
      cxchange=0;
      cychange=0;
      action=false;
    }
    if (mousePressed && mouseX < 186 && mouseX > 114 && mouseY < 181 && mouseY > 159)
    {
      background(0);
      x= 20;
      y= 80;
      direction = 1;
      changey=0;
      changex=1;
      cx=180;
      cy=80;
      cxchange=-1;
      cychange=0;
      action=true;
    }
    if (action==true)
    {
      //player movement
      point(x, y);
      x=x+changex;
      y=y+changey;
      if (key=='w' && direction != 4)
      {
        changex=0;
        changey=-1;
        direction=2;
      }
      else if (key=='a' && direction != 1)
      {
        changex=-1;
        changey=0;
        direction=3;
      }
      else if (key=='s' && direction != 2)
      {
        changex=0;
        changey=1;
        direction=4;
      }
      else if (key=='d' && direction != 3)
      {
        changex=1;
        changey=0;
        direction=1;
      }
      if (get(x, y) != color(0)) 
      {
        fill(255);
        text("Game Over! You Lose!", 100, 100);
        action=false;
      }
      //computer movement
      stroke(0, 0, 255);
      point(cx, cy);
      cx=cx+cxchange;
      cy=cy+cychange;
      if (compDir==6)
      {
        cxchange=1;
        cychange=0;
        if(get(cx+4,cy) != color(0))
        {
          compDir=9;  
        }
      }
      if (compDir==7)
      {
        cxchange=0;
        cychange=-1;
        if(get(cx,cy-4) != color(0))
        {
          compDir=6;  
        }
      }
      if (compDir==8)
      {
        cxchange=-1;
        cychange=0;
        if(get(cx-4,cy) != color(0))
        {
          compDir=7;  
        }
      }
      if (compDir==9)
      {
        cxchange=0;
        cychange=1;
        if(get(cx,cy+4) != color(0))
        {
          compDir=8;  
        }
      }
      if (get(cx, cy) != color(0))
      {
        fill(255);
        text("Congrats! You Win!", 100, 100); 
        action=false;
      }
    }
  }
}
