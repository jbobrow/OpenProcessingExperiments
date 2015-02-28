
//Sebastian Moya-Martinez
/*The goal of this sketch was to create a canvas that reacts to
user input through the keyboard while triggering sine wave tones
mapped to specific keys. The general theme of my sketch is the
circle. Sine waves are circles occuring over time, so I found them
to be the appropriate tone to reflect a circle being drawn. The 
canvas initates as black, but you must choose a background using
the 'u', 'i', and 'p' keys. Circles are drawn using keys 'q'->'t'
on the top row of the keyboard, keys 'a'->'g' on the middle row,
and keys 'z'->'b' on the bottom row. Each circle is mapped to a 
sine wave tone of an FMaj7 chord*/


//global variables
import ddf.minim.*;
Minim minim;
AudioSample A1; AudioSample C2; AudioSample E2; AudioSample F2;
AudioSample A2; AudioSample C3; AudioSample E3; AudioSample F3;
AudioSample A3; AudioSample C4; AudioSample E4; AudioSample F4;
AudioSample A4; AudioSample C5; AudioSample E5; AudioSample F5;
AudioSample Saw1; AudioSample Saw2; AudioSample Saw3;
int d = 125; //circle dimensions
int sw = 10; //stroke weight
color backgroundColor = color(#405977);



void setup()   
{
   minim = new Minim(this);
   A1 = minim.loadSample("A1.wav");
   A2 = minim.loadSample("A2.wav");
   A3 = minim.loadSample("A3.wav");
   A4 = minim.loadSample("A4.wav");
   C2 = minim.loadSample("C2.wav");
   C3 = minim.loadSample("C3.wav");
   C4 = minim.loadSample("C4.wav");
   C5 = minim.loadSample("C5.wav");
   E2 = minim.loadSample("E2.wav");
   E3 = minim.loadSample("E3.wav");
   E4 = minim.loadSample("E4.wav");
   E5 = minim.loadSample("E5.wav");
   F2 = minim.loadSample("F2.wav");
   F3 = minim.loadSample("F3.wav");
   F4 = minim.loadSample("F4.wav");
   F5 = minim.loadSample("F5.wav");
   Saw1 = minim.loadSample("Saw1.wav");
   Saw2 = minim.loadSample("Saw2.wav");
   Saw3 = minim.loadSample("Saw3.wav");
   size(850, 600);
   background(#405977);
   noFill();
}

void draw()
{  
  if(keyPressed == true) //code for drawing circles
  {
    strokeWeight(sw);
    //circles for keys q->t
    if(key == 'q'){ ellipse(145, 175, d, d); stroke(#218FBF);}
    if(key == 'w'){ ellipse(285, 175, d, d); stroke(#005D8A); }
    if(key == 'e'){ ellipse(425, 175, d, d); stroke(#2CBFFF); }
    if(key == 'r'){ ellipse(565, 175, d, d); stroke(#0B3040); }
    if(key == 't'){ ellipse(705, 175, d, d); stroke(#80DBFF);}
    //circles for keys a->h
    if(key == 'a'){ ellipse(75, 300, d, d); stroke(#60ADBF);}
    if(key == 's'){ ellipse(215, 300, d, d); stroke(#457D8A);}
    if(key == 'd'){ ellipse(355, 300, d, d); stroke(#80E7FF);}
    if(key == 'f'){ ellipse(495, 300, d, d); stroke(#203A40);}
    if(key == 'g'){ ellipse(635, 300, d, d); stroke(#73D0E5);}
    if(key == 'h'){ ellipse(775, 300, d, d); stroke(#8AE5C6);}
    //circles for keys z->b
    if(key == 'z'){ ellipse(145, 425, d, d); stroke(#0C213B);}
    if(key == 'x'){ ellipse(285, 425, d, d); stroke(#112F52);}
    if(key == 'c'){ ellipse(425, 425, d, d); stroke(#1E5391);}
    if(key == 'v'){ ellipse(565, 425, d, d); stroke(#2F81E3);}
    if(key == 'b'){ ellipse(705, 425, d, d); stroke(#003286);}
    
  } 
  else 
  {
  background(backgroundColor); 
  //when a key is released, the canvas background resets
   if ( key == BACKSPACE ) saveFrame("screenshot.png");
  }
}

void keyPressed()
{
  //code for triggering samples
  //keys q->t
  if ( key == 'q' ) F4.trigger();
  if ( key == 'w' ) A4.trigger();
  if ( key == 'e' ) C5.trigger();
  if ( key == 'r' ) E5.trigger();
  if ( key == 't' ) F5.trigger();
  //keys a->h
  if ( key == 'a' ) C3.trigger();
  if ( key == 's' ) E3.trigger();
  if ( key == 'd' ) F3.trigger();
  if ( key == 'f' ) A3.trigger();
  if ( key == 'g' ) C4.trigger();
  if ( key == 'h' ) E4.trigger();
  //keys z->b
  if ( key == 'z' ) A1.trigger();
  if ( key == 'x' ) C2.trigger();
  if ( key == 'c' ) E2.trigger();
  if ( key == 'v' ) F2.trigger();
  if ( key == 'b' ) A2.trigger();
  //sawtooth samples for background color change
  if ( key == 'i' ) Saw1.trigger();
  if ( key == 'o' ) Saw2.trigger();
  if ( key == 'p' ) Saw3.trigger();
 
  
  switch(key) //background color switch
  {
    case 'i':
    backgroundColor = color(#405977);
    break;
    case 'o':
    backgroundColor = color(#50A0FF);
    break;
    case 'p':
    backgroundColor = color(#0C2A4D);
    break;
  }
}


