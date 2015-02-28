
PFont font;

float y;//
float x = 100;

void setup () {
  size (250, 250);
  background (#FA4B00);
  smooth ();
  frameRate (40);
  
 
  
}
 
void draw () {
  // background lettersloop
  fill (#FA4B00, 100);
  rect (0, 0, width, height);
  noStroke ();
 font= loadFont("Impact-30.vlw");
 //type choice
 textFont(font);
 
  y += 1;
  x+= 0.5;
   
  //condition
  if (y >500) {
    y = 0;
  };


  
  fill (255);
// top left jumping letters, random y s, in rows
  fill(#7A5B3E);
  //adding colours to letters/numbers
  text("L", 125, random(y));
  fill(#CDBDAE);
  text("5", 125-10, random(y));
  fill(#FAFAFA);
  text("N", 125-20, random(y));
  fill(#1F1F1F);
  text("3", 125-30, random(y));
  text("S", 125-40, random(y));
   fill(#7A5B3E);
  text("6", 125-50, random(y));
  text("L", 125-60, random(y));
    fill(#FAFAFA);
  text("5", 125-70, random(y));
  fill(#1F1F1F);
  text("N", 125-80, random(y));
  text("3", 125-90, random(y));
    fill(#CDBDAE);
  text("S", 125-100, random(y));
   fill(#7A5B3E);
  text("6", 125-120, random(y));
    fill(#FAFAFA);
  text("L", 125-130, random(y));

//top right side
  text("L", 125, random(y));
  text("5", 125+10, random(y));
    fill(#CDBDAE);
  text("N", 125+20, random(y));
  fill(#1F1F1F);
  text("3", 125+30, random(y));
  text("S", 125+40, random(y));
   fill(#7A5B3E);
  text("6", 125+50, random(y));
  text("L", 125+60, random(y));
  text("5", 125+70, random(y));
  fill(#1F1F1F);
  text("N", 125+80, random(y));
  text("3", 125+90, random(y));
   fill(#7A5B3E);
  text("S", 125+100, random(y));
    fill(#FAFAFA);
  text("6", 125+120, random(y));
    fill(#CDBDAE);
  text("L", 125+130, random(y));

//bottom left  
  text("L", 125, 250-random(y));
    fill(#1F1F1F);
  text("5", 125-10, 250-random(y));
  text("N", 125-20, 250-random(y));
   fill(#7A5B3E);
  text("3", 125-30, 250-random(y));
  text("S", 125-40, 250-random(y));
    fill(#FAFAFA);
  text("6", 125-50, 250-random(y));
    fill(#CDBDAE);
  text("L", 125-60, 250-random(y));
  text("5", 125-70, 250-random(y));
    fill(#FAFAFA);
  text("N", 125-80, 250-random(y));
    fill(#1F1F1F);
  text("3", 125-90, 250-random(y));
   fill(#7A5B3E);
  text("S", 125-100, 250-random(y));
  text("6", 125-120, 250-random(y));
    fill(#FAFAFA);
  text("L", 125-130, 250-random(y));

//bottom right
  text("L", 125, 250-random(y));
  text("5", 125+10, 250-random(y));
  text("N", 125+20, 250-random(y));
  text("3", 125+30, 250-random(y));
    fill(#CDBDAE);
  text("S", 125+40, 250-random(y));
  text("6", 125+50, 250-random(y));
      fill(#1F1F1F);
  text("L", 125+60, 250-random(y));
  text("5", 125+70, 250-random(y));
    fill(#CDBDAE);
  text("N", 125+80, 250-random(y));
  text("3", 125+90, 250-random(y));
    fill(#CDBDAE);
  text("S", 125+100, 250-random(y));
    fill(#1F1F1F);
  text("6", 125+120, 250-random(y));
  text("L", 125+130, 250-random(y));


//white code on top
 fill(255);
 textMode(CENTER);
 text ("L5N3S6",10,120);


  };




