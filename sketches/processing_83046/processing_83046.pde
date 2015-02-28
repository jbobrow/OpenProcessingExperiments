

// http://processing.org/learning/basics/mousefunctions.html 

// a,b,c,d,e,f for imagine name 
// x,Y; M,N;P,Q; E,F  mouseX, mouseY coordinators
// rxn for boolean 

import ddf.minim.*;

Minim minim=new Minim(this);

AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;


// A,B,C for classic enolate reaction 
PImage a, b, c, d, e, f, g, h, i; // images for classic enolate reaction 
PImage a1, a2, a3, a4, a5, a6;
PImage coverP;

// Text

PFont font;

// most basic atom coordinator 

float X=178;
float Y=169;
float C=5;// size of changes

// LDA Position  
float M=510;
float N=90;
float D=4;

// oxygen positon 
float MN= 504;
float Mn=281;

// hydrogen 2 postion 
float HN =337;
float Hn =513;

// carbon 1position  
float CN=148;
float Cn=473;

float CM=151;
float Cm=282;


// Bases Postion 
float P=575;
float Q=119;
float B=4;


boolean rxn=false; 

// default the acidic position, basic position 
boolean acidicPosition =false;
boolean basicPosition=false;


void setup () {
  size(700, 700, P2D);
  smooth();
  stroke (5);
  player1 = minim.loadFile("rec-8.mp3", 2048);
  player1.play();
  
  
        player2 = minim.loadFile("rec-3.mp3", 2048);
       //  player2.play();
        player3 = minim.loadFile("rec-4.mp3", 2048);
        player4 = minim.loadFile("rec-5.mp3", 2048);
        player5 = minim.loadFile("rec-6.mp3", 2048);
        player6 = minim.loadFile("rec-7.mp3", 2048);
       
  noLoop();
  background(#FFFFFF);

  font = loadFont("ArialMT-12.vlw"); 
  textFont(font);
  fill(50);
  text(" Base", 500, 90);
 
  font = loadFont("AbadiMT-CondensedExtraBold-80.vlw"); 
  text("The Classic Enolate Reaction!!!", 80, 120);
  text("Metasebia Aberra & ShuMing Huang", 20, 45);
text("Organic Chemistry II", 25, 65);





  // ********* load images for enolate reaction 
  a=loadImage ("a.jpg");
  b=loadImage ("b.jpg");
  c=loadImage ("c.jpg");
  d=loadImage ("d.jpg");
  e=loadImage ("e.jpg");
  f=loadImage ("f.jpg");
  g=loadImage ("g.jpg");

  ///// load images for arrows
  a1=loadImage ("a1.jpg");
  a2=loadImage ("a2-1.jpg");
  a3=loadImage ("a3.jpg");
  a4=loadImage ("a4.jpg");
  a5=loadImage ("a5.jpg");
 
}

void draw () {

  
 // println(mouseX+ ","+mouseY);
 loop();

  float mx=constrain (mouseX, 351, 360);
  float my=constrain (mouseY, 132, 140);
 
  
    LDA();
  
  
     if (keyPressed) {   
    if (key == 'E' || key == 'e') {
      exit();
    }
  
    
  }
}


void LDA() {
   image (a, 325, 100);
  image (b, 525, 400);

  if ( (mouseX> M-D && mouseX < M+D) && (mouseY >N-D && mouseY < N+D)) {
    image (a1, 397, 156);
    image (c, 472, 259);
    image (a2, 430, 343);
      player2.play();    
  } 

  if ( (mouseX> MN-C && mouseX < MN+C) && (mouseY >Mn-C && mouseY < Mn+C)) {
    image (d, 280, 450);
      player3.play(); 
  }
  if ( (mouseX> HN-C && mouseX < HN+C) && (mouseY >Hn-C && mouseY < Hn+C)) {
    image (a3, 134, 489);
    image (e, 80, 430);  
      player4.play(); 
  }
  if ( (mouseX> CN-C && mouseX < CN+C) && (mouseY >Cn-C && mouseY < Cn+C)) {
    image (a4, 130, 303);
    image (f, 80, 430);  
    image (d, 80, 230);   
    player5.play();     
  }
  if ( (mouseX> CM-C && mouseX < CM+C) && (mouseY >Cm-C && mouseY < Cm+C)) {
      image (g, 80, 230);     
      image (a5, 200, 150);  
      player6.play();   
          
  }
  
 
}   

void mouseClicked() {
 int z=0;
 if (z !=255) {
   z=z+1;
 noStroke();
 fill(255,z);
 rect(0,0,400,400); 
 }

}

void stop()
{
  player1.close();
   player2.close();
   player3.close();
    player4.close();
     player5.close();
 player6.close();


 minim.stop();
  super.stop();
}



