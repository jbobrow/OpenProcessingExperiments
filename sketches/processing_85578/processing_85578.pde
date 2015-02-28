
PImage cityscape;
boolean mouseIsDown;
boolean keyIsDown;
PFont myFont;
int alphavalue;

void setup()
{
background(255);
size(1440,900);
smooth();
mouseIsDown = false;
keyIsDown = false;
frameRate(7);
myFont = loadFont("ThinkMoreforSolution-48.vlw");
stroke(20);
cityscape = loadImage("nyc.jpg");
image(cityscape, 0, 0);
}

void draw()
{
  
  String[] subtitlePart1 = { 
  "Damn...", 
  "Days go on and on...", 
  "...And they don't end.",
  "All my life needed was a sense of someplace to go.",
  "I don't believe that one should devote his life to morbid self-attention...",
  "I believe that someone should become a person like other people.",
  "Loneliness has followed me my whole life, everywhere.",
  "In bars, in cars... sidewalks, stores, everywhere.",
  "There's no escape.",
  "I'm God's lonely man...",
  "My life has taken another turn again.",
  "The days move along with regularity, over and over..."
  };
  
  String[] subtitlePart2 = { 
  "And suddenly... there is change...",
  "I gotta get in shape now.",
  "From now on, it'll be 50 pushups each morning.",
  "Fifty pull-ups.",
  "From now on, it'll be total organization. Every muscle must be tight.",
  "The idea had been growing in my brain for some time.",
  "True force.",
  "All the king's men cannot put it back together again.",
  "Listen, you screwheads.",
  "Here is a man who would not take it anymore.",
  "A man who stood up against the scum, the dogs, the filth.",
  "Here is someone who stood up.",
  "Now I see clearly...",
  "My whole life is pointed in one direction.",
  "I see that now, and never has been any choice for me..."
  };
  
int colors;  
if(mouseIsDown == true)
{
  colors = (255);
  fill(colors, colors, colors);
  textFont(myFont, random(33,100));
  text(subtitlePart1[int(random(0,12))], int(random(0,1340)), mouseY);
}

if(keyIsDown == true)
{
  colors = (255);
  fill(colors, colors, colors-90);
  textFont(myFont, random(33,100));
  text(subtitlePart2[int(random(0,15))], int(random(0,1340)), mouseY);
}
}


void mousePressed()
{
  mouseIsDown = true;
}

void mouseReleased()
{
  mouseIsDown = false;
}

void keyPressed()
{
  keyIsDown = true;
}

void keyReleased()
{
  keyIsDown = false;
}





