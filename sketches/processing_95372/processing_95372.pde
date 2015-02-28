
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}import arb.soundcipher.*;
import arb.soundcipher.constants.*;

int value=1;
int change=0;
int note;
int [] noteArray=new int[4];

int r,g,b;
SCScore aNewScore=new SCScore();

void setup()
{
  size(400,400);
  frameRate(1);
}

void draw()
{
  change=value;
  if (mouseX<width/2&&mouseY;<height/2)
  {
    value=1;
    note=(int)random(127);
    aNewScore.addNote(0,note, 100, 1);
    noteArray[0]=note;
    aNewScore.play();
  }    
  else if (mouseX>=width/2&&mouseY;<height/2)
  {
    value=2;
    note=(int)random(127);
    aNewScore.addNote(1,note, 80, 0.25);
    noteArray[1]=note;
    aNewScore.play();
  }
  else if (mouseX<width/2&&mouseY;>=height/2)
  {
    value=3;
    note=(int)random(127);
    aNewScore.addNote(2,note, 110, 0.5);
    noteArray[2]=note;
    aNewScore.play();
  }
  else
  {
    value=4;
    note=(int)random(127);
    aNewScore.addNote(3,note, 100, 1);
    noteArray[3]=note;
    aNewScore.play();
  }
  
  if(value==1&&change;!=1)
  {
    r=(int)random(255);
    g=(int)random(255);
    b=(int)random(255);
    fill(r,g,b);
  }
  rect(0,0,width/2,width/2);
  println("Change contains the previous number that value held:"+change);
  println("Value holds the current quandrant number:"+value);
}
