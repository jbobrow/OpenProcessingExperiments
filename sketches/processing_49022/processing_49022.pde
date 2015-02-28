
//Anne Nash 
//Fall 2011
//800 x 597

PImage pic;
BBox Box1;
BBox Box2;
BBox Box3;
BBox Box4;
BBox Box5;
BBox Box6;
BBox Box7;
BBox Box8;
BBox Box9;

int CLICK;
int fader;
  

void setup(){
  
  smooth();
  
  CLICK = 0;
  fader = 255;
  
  size(800,597);
  pic = loadImage("FootballGame.png");
  //image(pic,0,0);
  
  Box1 = new BBox(100,100,320,60,createFont("Times New Roman",22,true),"Relief, joy at Fort Bliss after announcement of Iraq withdrawal","October 22, 2011|From Martin Savidge, CNN");
  Box2 = new BBox(300,200,350,50,createFont("Georgia",18,true),"Fox News Wants Female Comedians to be, well, Foxy","OCTOBER 22, 20 11by Natalie McDonald");
  Box3 = new BBox(400,400,340,80,createFont("Georgia",29,true),"Great white shark kills US diver off Australia's coast","msnbc.com news services updated 10/22/2011 8:17:21 AM ET");
  Box4 = new BBox(100,240,300,45,createFont("Helvetica",18,true),"LIVEBLOG: NU takes on Penn State in front of Homecoming crowd","By Jonah Rosenblum and Robbie Levin | NU Football Live Blog: Penn State at Northwestern (10/22/2011) Saturday October 22, 2011");
  Box5 = new BBox(300,120,330,100,createFont("Arial",24,true),"Steve Jobs Biography Hints At What's To Come From Apple: Textbooks, TVs And More","huffington post First Posted: 10/22/11 01:46 PM ET ");
  Box6 = new BBox(160,300,290,60,createFont("Impact",20,true),"Celebrities Editorial | 'Serial Lover' Ryan Gosling For ELLE Magazine","Elle Magazine http://celebs-style.blogspot.com/2011/10/celebrities-editorial-serial-lover-ryan.html# 10/22/11");
  Box7 = new BBox(100,70,355,60,createFont("Arial",18,true),"November 4- Jerry Sandusky is indicted on 40 counts of sex crimes against young boys","( Handout/Reuters ) Published in: Chicago Tribune Year in Review");
  Box8 = new BBox(100,140,490,45,createFont("Verdana",18,true),"PATERNO TO RETIRE AFTER SEASON AMID SCANDAL","BY GENARO C. ARMAS nbcsports updated 11:25 a.m. ET Nov. 9, 2011");
  Box9 = new BBox(200,320,370,75,createFont("Times New Roman",25,true),"Relief, joy at Fort Bliss after announcement of Iraq withdrawal","October 22, 2011|From Martin Savidge, CNN");
  
  
}

void draw(){
  
  image(pic,0,0);
  
  
  
  //fill(#00ee00,80);
  //rect(425,292,40,40);
  if( inBox(425,465,292,332) ){
    Box8.updateBBox( true );
    Box8.displayBBox();
  }
  
  Box1.updateBBox( inBox(70,120,390,410) );
  Box1.displayBBox();
  
  Box2.updateBBox( inBox(75,130,420,475) );
  Box2.displayBBox();
  
  Box3.updateBBox( inBox(140,185,405,460) );
  Box3.displayBBox();
  
  Box4.updateBBox( inBox(200,330,320,430) );
  Box4.displayBBox();
  
  Box5.updateBBox( inBox(290,450,440,560) );
  Box5.displayBBox();
  
  Box6.updateBBox( inBox(430,475,375,430) );
  Box6.displayBBox();
  
  Box7.updateBBox(inBox(10,55,280,480));
  Box7.displayBBox();
  
  Box8.updateBBox( inBox(425,465,292,332) ); // paterno to retire
  Box8.displayBBox();
  
  Box9.updateBBox( inBox(600,650,300,390) );
  Box9.displayBBox();
    
  float mb;
  mb = millis();
  if(CLICK == 0){
    background(#000000,255);
    PFont introFont = createFont("Helvetica",20,true);
    textFont(introFont);
    fill(#ffffff);
    if (mb>3000){
      text("Sometimes a moment is where we want to stay.",20,100);
    }
    if (mb>6000){
    text("An image glosses over the complexities of everyone’s story.",20,180);
    }
    if (mb>9000){
    text("In the following image, more than just a few people may wish they could return and bask in its retrospective simplicity.",20,260,760,200);
    }
    if (mb>14000){
    text("click",20,460);
    }
    
  } else if (CLICK==1){
    fill(#000000,fader);
    rect(0,0,width,height);
    PFont introFont = createFont("Helvetica",20,true);
    textFont(introFont);
    fill(#ffffff,fader);
    text("Sometimes a moment is where we want to stay.",20,100);
    text("An image glosses over the complexities of everyone’s story.",20,180);
    text("In the following image, more than just a few people may wish they could return and bask in its retrospective simplicity.",20,260,760,200);
    fader--;
    if (fader == -1){
      CLICK = 2;
    }
  }
   
  
  
}



class BBox{
  float Milisecond_on;
  float Milisecond_off;
  boolean State;
  PFont Font;
  String Sentence;
  String Source;
  float X;
  float Y;
  float W;
  float H;
  float Opacity;
  
  BBox(float x, float y, float w, float h, PFont f, String s, String s2){
    X = x;
    Y = y; 
    W = w;
    H = h;
    Font = f;
    Sentence = s;
    Source = s2;
    
    Milisecond_on = 0.0;
    Milisecond_off = 0.0;
    State = false;
    Opacity = 0.0;
  }
  
  void updateBBox(boolean Z){
    if(Z){
      if (Opacity<100){
        Opacity = Opacity+2;
      }
    } else {
      if (Opacity>0){
        Opacity = Opacity-2;
      }
    }
  }
  
  void displayBBox(){
    fill(#dddddd,Opacity*0.8);
    stroke(#eeeeee,Opacity*1.55);
    roundrect(X,Y,W,H,10);
    fill(#000000,Opacity*2.55);
    stroke(#000000,Opacity*2.55);
    textFont(Font);
    text(Sentence,X+2,Y+2,W,H);
    
    PFont SourceFont;
    SourceFont = createFont("courier",9,true);
    textFont(SourceFont);
    text(Source,100,580);
  }
  
}  


boolean inBox(int x1,int x2,int y1,int y2){
  if ((mouseX>x1)&&(mouseX<x2)&&(mouseY>y1)&&(mouseY<y2)){
    return true;
  } else {
    return false;
  }
}





void roundrect(float x, float y, float w, float h, float r)
{

  
  beginShape(); 
  
  vertex(x+w/2,y);
  vertex(x+w-r,y);
  bezierVertex(x+w-r+.707*r,y+r-.707*r,  x+w-r+.707*r-1,y+r-.707*r-1,  x+w-r+.707*r+1,y+r-.707*r+1);
  vertex(x+w,y+r);
  vertex(x+w,y+h/2);
  vertex(x+w,y+h-r);
  bezierVertex(x+w-r+.707*r,y+h-r+.707*r,  x+w-r+.707*r+1,y+h-r+.707*r-1,  x+w-r+.707*r-1,y+h-r+.707*r+1);
  vertex(x+w-r,y+h);
  vertex(x+w/2,y+h);
  vertex(x+r,y+h);
  bezierVertex(x+r-.707*r,y+h-r+.707*r,  x+r-.707*r+1,y+h-r+.707*r+1,  x+r-.707*r-1,y+h-r+.707*r-1);
  vertex(x,y+h-r);
  vertex(x,y+h/2);
  vertex(x,y+r);
  bezierVertex(x+r-.707*r,y+r-.707*r,  x+r-.707*r-1,y+r-.707*r+1,  x+r-.707*r+1,y+r-.707*r-1);
  vertex(x+r,y);
  vertex(x+w/2,y);

  endShape();
}

void mousePressed(){
  CLICK++;
}

