
/* 
 * Creative Coding -  Postcard
 *
 * by John Pickard - 8th July 2014
 *
 */
 
PFont myFont;

PImage allotment;

char [] greetings = {'H','e','l','l','o',' ',
                   'f','r','o','m',' ',
                   'o','u','r',' ',
                   'L','a','n','c','a','s','h','i','r','e',' ',
                   'A','l','l','o','t','m','e','n','t','!'};
                   
int [] letterPosn;

int seconds;
int i;

float textWidth1;
float textAscent1;

float xPos;
float xPosFixed;

float imageX;

float xPosDrop;
float yPos;

Boolean written = false;

String theText;
String dropText;

void setup() {
  size(1024, 400);
  
  i = 0;
  imageX = 0;
  
  myFont = loadFont("OpenDyslexic-Regular-200.vlw");    // load the font
  textFont(myFont);    // sets the currect font to myFont
  noStroke();
  
  allotment = loadImage("allotmentpanorama.jpg");
  
  textWidth1 = 0;
  textAscent1 = 0;
  xPos = 0;
  xPosFixed = width/2;
  xPosDrop = width/2;
  
  dropText = "";
 
}
 
void draw() {
 background(255);
 
 allotment.resize(1024,400);  // this stretches the image
                              // in the Y direction
 
 image(allotment,0,0);
  
 fill(255,255,0);
 
 // set up the clock
 theText = nf(hour(),2) + 
           " : " +
           nf(minute(),2) +
           " : " +
           nf(second(),2);
 
 textSize(10);
 
 text(theText, 10, textAscent() + 4); 
 
 fill(255,0,0);
 theText = "Hello from our Lancashire Allotment!";

 textSize(20);
   
 textWidth1 = textWidth(theText) * 0.1;
 textAscent1 = textAscent();
 
 // dropping letters
 
 if (yPos < height/2  && i < greetings.length) 
 {
   yPos += random(-1,3);
   text(greetings[i], xPosDrop, yPos - textAscent());
 }
 else
 {
   yPos = 0;
   if (i < greetings.length)
   {
     dropText = dropText + str(greetings[i]);
     xPosFixed = xPosFixed - (textWidth(greetings[i]) * 0.5); 
     i++;
   }
 }

 text(dropText,xPosFixed,height/2);
   
 // scrolling banner
 
 //xPos = xPos - 0.5;
 xPos = xPos - random(-0.5,1);
 text(theText, xPos, height/2 + textAscent1);
 
 if (xPos <  -textWidth(theText))
 {
   xPos = width;
 }
 
}


