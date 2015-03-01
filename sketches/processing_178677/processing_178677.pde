
/*
This program generates random sentences from the list of words.

*/

String [] subject = { "Man", "Maxim", "His Kid", "Everyone" , "She", "Old Lady", "Woman", "Monkey"};
String [] verb = {"makes","enjoys","jumps","runs", "walks", "sleeps", "Smiles", "Loves"};
String [] object = {"mistakes", "Games", "on the Sofa", "for money","Fast", "on the bed", "back", "Banana"};


int i1=0;
int i2=0;
int i3=0;

int newline = 150;
int flag = 0;     // For switching between Right  click and left click

void setup()
{
  size(700,600);
  background(114,170,66);
  color(255);
  
  
  noStroke();
  

 
  
  //displaying the initial sentances 
 
}

void draw()
{
    i1 = round(random(0,(subject.length-1)));  // generating a Random element index for the Subject Array
    i2 = round(random(0,(subject.length-1)));  // generating a Random element index for the Verb Array
    i3 = round(random(0,(subject.length-1)));  // generating a Random element index for the Object Array
 
  if(flag==0)
  {
    initial();
    noLoop();
  }
  if(flag==1)
  {
    background(24,154,79);
    text(subject[i1] + " " + verb [i2] +" " + object[i3], (width/2)-100 , height/2);
    
  }
  if(flag==(-1))
  {
    sentence(); 
  }
    textSize(30); 
    text("Random Sense" , (width/2)-100, 40);
    textSize(10); 
    text("Left Click - To Randomize" +" " + " --||--||-- " + " " +"Right Click - To Stop", (width/2)-150, 60);
    textSize(20);   
    
}

void mousePressed()
{
  if(mouseButton==LEFT)
  {
     flag = 1;
     loop();
  }
  if(mouseButton==RIGHT)
  {
    flag = -1;
    noLoop();
  } 
  if(mouseButton==CENTER)
  {
    flag=0;
   // noLoop();
  }
}

void sentence()
{
   background(114,170,66);
   text(subject[i1] + " " + verb [i2] +" " + object[i3], (width/2)-100 , height/2);  
}

void initial()
{
  background(114,170,66);
  textSize(15);
  for(int a = 0; a < subject.length; a++)
  {
    
    text(subject[a] + " " + verb [a] +" " + object[a], (width/2)-100 , newline);
    newline = newline + 40;
  }
 
}

  



