
//I went ahead and decided to code 

// looked up some help on the halo from learningprocessing.com by Daniel Shiffman

float r = 100;
float rad = 0.0;
PFont bodyfont;
PFont halofont;
PFont eyelinefont;
PFont eyefont;
PImage backdrop;
String halotext = "It's easy to chase a dream beyond the waking world.";
String eyelinetext = "Things are not as they seem.";
char[] letters;
String[] eyewords = {"Echo", "Back", "Again", "And"};
int whichWord = 0;

void setup()
{
size(600,800);
bodyfont = loadFont("Eureka-90.vlw");
halofont = loadFont("AmericanTypewriter-24.vlw");
eyelinefont = loadFont("CourierNew36.vlw");
eyefont = loadFont("ArialMT-12.vlw");
//DON'T USE "textFont" HERE, IT'LL SET THEM ALL, INSERT IT INTO THE  VOID DRAW SECTION
letters = halotext.toCharArray();
backdrop = requestImage("backdrop.jpg");
//There shouldn't be any other things that need to be added, but be sure to double check holmes
}

void draw()
{
image(backdrop,0,0,width,height);


//Rotating Halo Text
rad = rad + 0.5;
pushMatrix();
  translate(width/2, height/2);
  rotate(rad);
  textFont(halofont);
  textAlign(CENTER);
  smooth();
  noStroke();
 
  noFill();
  ellipseMode(CENTER);
  ellipse(0,0,r*2,r*2);
  float arclength = 0;
    for (int i = 0; i < halotext.length(); i++)
      {
        char currentChar = halotext.charAt(i);
        float w = textWidth(currentChar);
        arclength += w/2;
        float theta = PI + arclength / r;
          pushMatrix();
            translate(r*cos(theta), r*sin(theta));
            rotate(theta + PI/2);
            fill(#FFFFFF);
            text(currentChar,0,0);
          popMatrix();
   arclength += w/2;
      }
popMatrix();
//end of rotating text

//Text outline of person
pushMatrix();
  fill(#000000);
  textFont(bodyfont);  
  textAlign(CENTER);
  textSize(25);
  text("Ideas", 300, 370);
  text("Musings", 300, 385);
  text("Thoughts", 300, 400);
  text("Concepts", 300, 415);
  text("Speech", 300, 430);
  text("Words", 300, 445);
  text("It's", 300, 460);
  text("Concrete", 300, 475);
  text("Built of substance", 300, 490);
  text("And ultimately intangible", 300, 505);
  text("Embodied of its own volition", 300, 520);
  text("Just... filler, filler, filler, filler,", 300, 535);
  text("filler, filler, filler, filler, filler,", 300, 550);
  text("filler, filler, filler, filler, filler,", 300, 565);
  text("filler, filler, filler, filler, filler,", 300, 580);
  text("filler, filler, filler, filler, filler,", 300, 595);
  text("filler, filler, filler, filler, filler,", 300, 610);
  text("filler, filler, filler, filler, filler,", 300, 625);
  text("filler, filler, filler, filler, filler,", 300, 640);
  text("filler, filler, filler, filler, filler,", 300, 655);
  text("filler, filler, filler, filler, filler,", 300, 670);
  text("filler, filler, filler, filler, filler,", 300, 685);
  text("filler, filler, filler, filler, filler,", 300, 700);
  text("filler, filler, filler, filler, filler,", 300, 715);
  text("filler, filler, filler, filler, filler,", 300, 730);
  text("filler, filler, filler, filler, filler,", 300, 745);
  text("all those you knew way back when,", 300, 760);
  text("where you've been and may never go again", 300, 775);
  text("Or something along those lines...", 300, 790);

popMatrix();
//end of person outline

//passing text at eyelevel
pushMatrix();
  fill(#000000);
  textFont(bodyfont);  
  textAlign(CENTER);
  textSize(25);
  text("Just... filler, filler, filler, filler,", 300, 535);
  text("filler, filler, filler, filler, filler,", 300, 550);
  text("filler, filler, filler, filler, filler,", 300, 565);
  text("filler, filler, filler, filler, filler,", 300, 580);
  text("filler, filler, filler, filler, filler,", 300, 595);
  text("filler, filler, filler, filler, filler,", 300, 610);
  text("filler, filler, filler, filler, filler,", 300, 625);
  text("filler, filler, filler, filler, filler,", 300, 640);
  text("filler, filler, filler, filler, filler,", 300, 655);
  text("filler, filler, filler, filler, filler,", 300, 670);
  text("filler, filler, filler, filler, filler,", 300, 685);
  text("filler, filler, filler, filler, filler,", 300, 700);
  text("filler, filler, filler, filler, filler,", 300, 715);
  text("filler, filler, filler, filler, filler,", 300, 730);
  text("filler, filler, filler, filler, filler,", 300, 745);
  text("filler, filler, filler, filler, filler,", 300, 760);
popMatrix();
//end of passing text at eyelevel

//eye text
pushMatrix();
  fill(#ff0403);
  textFont(eyefont);
  textAlign(CENTER);
  frameRate(3);
  whichWord++;
     if (whichWord == eyewords.length)
         {
            whichWord = 0;
         }

//The position will change to be eyelevel.
  text(eyewords[whichWord], width/2, 400);
popMatrix();
//end eye text
}


