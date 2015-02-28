
  PFont font;
color Red = color(255,0,0);
color Orange = color(255,100,0);
color Yellow = color(255,255,0);
color LGreen = color(100,255,0);
color Green = color(0,200,0);
color LBlue = color(0,100,255);
color Blue = color(0,0,255);
color LPurple = color(255,0,255);
color Purple = color(200,0,255);
color Pink = color(255,100,150);
color White = color(255,255,255);
color Black = color(100);
int e = 150;
int g = 170;
int a = 175;

int b = 210;
int c = 225;
int h = 230;
int d = 250;
int i = 250;
int k = 285;
int f = 300;
int j = 320;

int AA = 25;
int A = 50;
int B = 75;
int C = 100;

void setup(){
  size(400,400);
  noFill();
  background(Black);  
  noStroke();

}

void draw(){
  font = loadFont("AngsanaNew-32.vlw");
  textFont(font,20);

  if(keyPressed){
    if(key == 'H' || key == 'h'){
      fill(Red);
      text("H",40,100);
      fill(Pink);
      text("h",230,100);
      fill(White);
      text("Hit Right when you're done",150,400); 
    }
    
    else if(key == 'A' || key == 'a'){
      fill(Orange);
      text("a",60,100);
      text("a",270,100);
      fill(White);
      text("Hit Right when you're done",150,400);
    }
    
    else if(key == 'P' || key == 'p'){
      fill(Yellow);
      text("p",80,100);
      fill(LGreen);
      text("p",100,100);
      fill(White);
      text("Hit Right when you're done",150,400);
    }
    
    else if(key == 'Y' || key == 'y'){
      fill(Green);
      text("y",120,100);
      fill(Yellow);
      text("y",290,100);
      fill(White);
      text("Hit Right when you're done",150,400);
    }
    
    else if(key == 'B' || key == 'b'){
      fill(LBlue);
      text("B",165,100);
      fill(White);
      text("Hit Right when you're done",150,400);
    }
    
    else if(key == 'I' || key == 'i'){
      fill(Blue);
      text("i",190,100);
      fill(LBlue);
      text("i",190,150);
      fill(White);
      text("Hit Right when you're done",150,400); 
    }
    
    else if(key == 'R' || key == 'r'){
      fill(LPurple);
      text("r",200,100);
      fill(Green);
      text("r",170,150);
      fill(White);
      text("Hit Right when you're done",150,400);
    }
    
    else if(key == 'T' || key == 't'){
      fill(Purple);
      text("t",215,100);
      fill(White);
      text("Hit Right when you're done",150,400);
    }
    
    else if(key == 'D' || key == 'd'){
      fill(Red);
      text("d",250,100);
      fill(White);
      text("Hit Right when you're done",150,400);  
    }
    
    else if(key == 'E' || key == 'e'){
      fill(LGreen);
      text("E",150,150);
      fill(White);
      text("Hit Right when you're done",150,400);  
    }
    
    else if(key == 'N' || key == 'n'){
      fill(Blue);
      text("n",205,150);
      fill(White);
      text("Hit Right when you're done",150,400);  
    }
    
    else if (key == CODED) {
    if (keyCode == RIGHT) {
      fill(Black);
      rect(0,375,400,400);
            stroke(0);
      //head
      line(a,b,c,b);
      line(a,d,c,d);
      line(a,b,a,d);
      line(c,d,c,b);
      //body 
      line(a,b+A,c,b+A);
      // 175,265,225,265
      line(a,d+B,c,d+B);
      // 175,325,225,325
      line(a,b+A,a,d+B);
      // 175,265,175,325
      line(c,d+B,c,b+A); // 225,325,225,265
      //arms
      line(e,b+A,g,b+A);
      line(e,b+A,e,f);    
      line(g,b+A,g,f);  
      line(e,f,g,f);
  
      line(h,b+A,h,f);
      line(i,b+A,i,f);
      line(h,b+A,i,b+A);
      line(h,f,i,f);   

//legs
  line(c,k+A,c,f+B);
  line(c-AA-5,k+A,c-AA-5,f+B);
  line(c-A,k+A,c-AA-5,k+A); 
  line(c,k+A,c-AA+5,k+A); 
  
  line(c-A,k+A,c-A,f+B);
  line(c-AA+5,k+A,c-AA+5,f+B);
  line(c-A,f+B,c-AA-5,f+B);
  line(c,f+B,c-AA+5,f+B);
  
  fill(0);
  ellipse(a+15,b+15,5,5);  
  ellipse(a+35,b+15,5,5);
  fill(White);
  ellipse(325,200,160,75);
  noStroke();
  triangle(325,200,250,225,325,230);
  fill(Black);
  text("You're",300,190);
  text("the best mentor!!!",250,210);
    }
  }

  }

 fill(White);
 
  text("Hangman ;)",150,50);
  text("_",40,100);
  text("_",60,100);
  text("_",80,100);
  text("_",100,100);
  text("_",120,100);
  text("_",165,100); 
  text("_",185,100);
  text("_",200,100);
  text("_",215,100);
  text("_",230,100);
  text("_",250,100);
  text("_",270,100);
  text("_",290,100);
  text("_",150,150);
  text("_",170,150);
  text("_",190,150);
  text("_",205,150);
  text("!!!",220,150);


}             

                                                                                                                                                                                                                 
