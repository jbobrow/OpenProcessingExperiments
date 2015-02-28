
//Annie Ranttila
//Assignment 10, Carnegie Mellon University, Fall 2013
//all information and logos from: http://www.usgbc.org/articles/infographic-leed-world

float [] projectsno = {4212, 1156, 808, 638, 405, 332, 299, 194, 188};
float [] GSMno = {62.3, 66.5, 46.1, 18.1, 6.9, 7.9, 6.1, 8.9, 15};
PImage logo;
PFont font, font1;

void setup()
{
  size(800,800);
  logo = loadImage("LEED.jpg");
  font = loadFont("Archer-BoldItalic-48.vlw");
  font1 = loadFont("Archer-Book-32.vlw");
}

void draw()
{
  textFont(font, 48);
  drawBackground();
  drawText();
  drawShapes();
 // moveShapes();
 // drawLines();
}

void drawBackground()
{
  image(logo, 0, 0,width+60, height);
  fill (56, 124, 46, 50);
  rect(width/2, height/2, width, height);
}

void drawShapes()
{
 
    noStroke();
    fill(42, 95, 35 );
    rectMode(CENTER);
    textFont(font, 48);
    textAlign(CENTER);
    if(mouseY<height/9) 
      {
        int i=0;
       rect (width*.33, height*.5 ,width/4, projectsno[i]/10);
       rect (width*.66, height*.5 ,width/4, GSMno[i]);
       text("Canada", width/2, height*.85); 
       fill(255);
       text("4,212", width/3, height*.5+12);
       text("62.3", width*.666, height*.5+12);
      }
     else if(mouseY>height/9 && mouseY<2*height/9) 
      {
        int i=1;
       rect (width*.33, height*.5 ,width/4, projectsno[i]/10);
       rect (width*.66, height*.5 ,width/4, GSMno[i]);
       text("China", width/2, height*.85); 
       fill(255);
       text("1,156", width/3, height*.5+12);
       text("66.5", width*.666, height*.5+12);
      }
      else if(mouseY>2*height/9 && mouseY<3*height/9) 
      {
        int i=2;
       rect (width*.33, height*.5 ,width/4, projectsno[i]/10);
       rect (width*.66, height*.5 ,width/4, GSMno[i]);
       text("United Arab Emirates", width/2, height*.85); 
       fill(255);
       text("808", width/3, height*.5+12);
       text("46.1", width*.666, height*.5+12);
      }
      else if(mouseY>3*height/9 && mouseY<4*height/9) 
      {
        int i=3;
       rect (width*.33, height*.5 ,width/4, projectsno[i]/10);
       rect (width*.66, height*.5 ,width/4, GSMno[i]);
       text("Brazil", width/2, height*.85); 
       fill(255);
       text("638", width/3, height*.5+12);
       text("18.1", width*.666, height*.5+12);
      }
      else if(mouseY>4*height/9 && mouseY<5*height/9) 
      {
        int i=4;
       rect (width*.33, height*.5 ,width/4, projectsno[i]/10);
       rect (width*.66, height*.5 ,width/4, GSMno[i]);
       text("India", width/2, height*.85); 
       fill(255);
       text("405", width/3, height*.5+12);
       text("6.9", width*.666, height*.5+12);
      }
       else if(mouseY>5*height/9 && mouseY<6*height/9) 
      {
        int i=5;
       rect (width*.33, height*.5 ,width/4, projectsno[i]/10);
       rect (width*.66, height*.5 ,width/4, GSMno[i]);
       text("Mexico", width/2, height*.85); 
       fill(255);
       text("322", width/3, height*.5+12);
       text("7.9", width*.666, height*.5+12);
      }
       else if(mouseY>6*height/9 && mouseY<7*height/9) 
      {
        int i=6;
       rect (width*.33, height*.5 ,width/4, projectsno[i]/10);
       rect (width*.66, height*.5 ,width/4, GSMno[i]);
       text("Germany", width/2, height*.85); 
       fill(255);
       text("299", width/3, height*.5+12);
       text("6.1", width*.666, height*.5+12);
      }
       else if(mouseY>7*height/9 && mouseY<8*height/9) 
      {
        int i=7;
       rect (width*.33, height*.5 ,width/4, projectsno[i]/10);
       rect (width*.66, height*.5 ,width/4, GSMno[i]);
       text("Turkey", width/2, height*.85); 
       fill(255);
       text("194", width/3, height*.5+12);
       text("6.1", width*.666, height*.5+12);
      }
       else if(mouseY>8*height/9) 
      {
        int i=8;
       rect (width*.33, height*.5 ,width/4, projectsno[i]/10);
       rect (width*.66, height*.5 ,width/4, GSMno[i]);
       text("Republic of Korea", width/2, height*.85); 
       fill(255);
       text("188", width/3, height*.5+12);
       text("15", width*.666, height*.5+12);
      }
  
}

void drawText()
{
//  fill(70, 70, 70, 70);
//  rect (width*.33, height/2 ,width/4, 421.2);
//  rect (width*.66, height/2 ,width/4, 421.2);
  textFont(font1, 32);
  fill(50,50,50, 10);
  rect (width/2, .5*height*.1111 ,width, height*.11111);
  fill(50,50,50,20);
  rect (width/2, 1.5*height*.1111 ,width, height*.11111);
    fill(50,50,50, 30);
  rect (width/2, 2.5*height*.1111 ,width, height*.11111);
    fill(50,50,50, 40);
  rect (width/2, 3.5*height*.1111 ,width, height*.11111);
    fill(50,50,50, 50);
  rect (width/2, 4.5*height*.1111 ,width, height*.11111);
    fill(50,50,50, 60);
  rect (width/2, 5.5*height*.1111 ,width, height*.11111);
    fill(50,50,50, 70);
  rect (width/2, 6.5*height*.1111 ,width, height*.11111);
    fill(50,50,50, 80);
  rect (width/2, 7.5*height*.1111 ,width, height*.11111);
    fill(50,50,50,90);
  rect (width/2, 8.5*height*.1111 ,width, height*.11111);
  fill(42, 95, 35 );
  text("1", width/11, .5*height*.1111);
  text("2", width/11, 1.5*height*.1111);
  text("3", width/11, 2.5*height*.1111);
  text("4", width/11, 3.5*height*.1111);
  text("5", width/11, 4.5*height*.1111);
  text("6", width/11, 5.5*height*.1111);
  text("7", width/11, 6.5*height*.1111);
  text("8", width/11, 7.5*height*.1111);
  text("9", width/11, 8.5*height*.1111);
  text("LEED Projects", 260,100, width/4, 1.5*height*.1111);
  text("GSM in Millions", 540, 100, width/4, 1.5*height*.1111);
  text("Top 9 Countries for LEED", width/2, height*.9+10);
  text("behind United States", width/2, height*.9+60);
}


