
/* @pjs preload="pink lady.png; font = "AaarghNormal-48.vlw" ; */


float [] GDPpc ={14178,12455,52283,67869,28021,7336,3607,9795,4517,3340,944,649};
float [] percentages = {66.1,60.8,54.2,56.6,46.3,12.2,10.9,10.1,8,2.4,1,.1};
PImage back;
PFont font;
float s;

 
void setup()
  {
  size(800,800);
  background(0);
  back = loadImage("pink lady.png");
  font = loadFont("AaarghNormal-48.vlw");
  }
 
void draw()
  {
  textFont(font, 48);
  drawBackground();
  drawText();
  drawShapes();
  }
 
void drawBackground()
  {
  background(0);
  image(back,0,0,800,800);
  

  }
 
void drawShapes()
  {
    noStroke();
    fill(255,80);
    rectMode(CENTER);
    textFont(font, 48);
    textAlign(CENTER);
    if(mouseY<height/13)
      {
        int i=0;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Russia", width/2, height*.85);
       text("$14,178", width/3, height*.5+12);
       text("66.1%", width*.666, height*.5+12);
      }
       else if(mouseY>height/13 && mouseY<2*height/13)
       {
        int i=1;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Kazakhstan", width/2, height*.85);
       text("$12,455", width/3, height*.5+12);
       text("60.8%", width*.666, height*.5+12);
      }
      else if(mouseY>3*height/13 && mouseY<4*height/13)
       {
        int i=2;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Canada", width/2, height*.85);
       text("$52,283", width/3, height*.5+12);
       text("54.2%", width*.666, height*.5+12);
      }
      else if(mouseY>4*height/13 && mouseY<5*height/13)
      {
        int i=3;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Australia", width/2, height*.85);
       text("$67,869", width/3, height*.5+12);
       text("46.6%", width*.666, height*.5+12);
      }
      else if(mouseY>5*height/13 && mouseY<6*height/13)
      {
        int i=4;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Puerto Rico", width/2, height*.85);
       text("$28,021", width/3, height*.5+12);
       text("46.3%", width*.666, height*.5+12);
      }
       else if(mouseY>6*height/13 && mouseY<7*height/13)
      {
        int i=5;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("South Africa", width/2, height*.85);
       text("$7,336", width/3, height*.5+12);
       text("12.2%", width*.666, height*.5+12);
      }
      else if(mouseY>7*height/13 && mouseY<8*height/13)
      {
        int i=6;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Samoa", width/2, height*.85);
       text("$3,607", width/3, height*.5+12);
       text("10.9%", width*.666, height*.5+12);
      }
       else if(mouseY>8*height/13 && mouseY<9*height/13)
      {
        int i=7;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Mexico", width/2, height*.85);
       text("$9,795", width/3, height*.5+12);
       text("10.1%", width*.666, height*.5+12);
      }
       else if(mouseY>9*height/13 && mouseY<10*height/13)
       {
        int i=8;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Bosnia & Herzegovina", width/2, height*.85);
       text("$4,517", width/3, height*.5+12);
       text("8%", width*.666, height*.5+12);
      }
      else if(mouseY>10*height/13 && mouseY<11*height/13)
      {
        int i=9;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Guatemala", width/2, height*.85);
       text("$3,340", width/3, height*.5+12);
       text("2.4%", width*.666, height*.5+12);
      }
      else if(mouseY>11*height/13 && mouseY<12*height/13)
      {
        int i=10;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Cambodia", width/2, height*.85);
       text("$944", width/3, height*.5+12);
       text("1%", width*.666, height*.5+12);
      }
      else if(mouseY>12*height/13)
      {
        int i=11;
       rect (width*.33, height*.5 ,width/4, GDPpc[i]/120);
       rect (width*.66, height*.5 ,width/4, percentages[i]);
       fill(255);
       text("Burkina Faso", width/2, height*.85);
       text("$649", width/3, height*.5+12);
       text("0.1%", width*.666, height*.5+12);
      }  
}
 
void drawText()
  {
  textFont(font, 24);
  fill(255);
  text("Per Capita GDP in USD",160,100, width/4, 1.5*height*.1111);
  text("Percent of Females with Post-Secondary Educations", 440, 100, width/4, 1.5*height*.2111);
  textFont(font,14);
  text("Data from UN 2012 Gender Statstics", 150, height*.9+10);
  }




