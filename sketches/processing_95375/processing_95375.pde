
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

int value = 1;
int change = 0;
int[] noteArray = new int[4];

int r, g, b;
SCScore aNewScore = new SCScore();
double aRandomNote;

void setup()
{
 size(400, 400);
 frameRate(1);
 aNewScore.tempo(60);
 
}

void draw()
{
 change = value;
 if(mouseX < width/2 && mouseY < height/2)
  value = 1;
 else if(mouseX >= width/2 && mouseY < height/2)
  value = 2;
 else if(mouseX < width/2 && mouseY >= height/2)
  value = 3;
 else
  value = 4;
  
  if(value == 1 && change != 1)
  {
   r = (int)random(255);
   g = (int)random(255);
   b = (int)random(255);
   aRandomNote = random(127);
   noteArray[0] = (int)aRandomNote;
   aNewScore.addNote(0.0, noteArray[0], 100.0, 1.0);
   aNewScore.play();
   fill(r, g, b);
   rect(0, 0, width/2, width/2);
  }
  
  else if(value == 2 && change != 2)
  {
   r = (int)random(255);
   g = (int)random(255);
   b = (int)random(255);
   aRandomNote = random(127);
   noteArray[1] = (int)aRandomNote;
   aNewScore.addNote(1.0,noteArray[1], 80.0, 0.25);
   aNewScore.play();
   fill(r, g, b);
   rect(width/2, 0, width/2, width/2);
  }
  
  else if(value == 3 && change != 3)
  {
   r = (int)random(255);
   g = (int)random(255);
   b = (int)random(255);
   aRandomNote = random(127);
   noteArray[2] = (int)aRandomNote;
   aNewScore.addNote(2.0, noteArray[2], 110.0, 0.5);
   aNewScore.play();
   fill(r, g, b);
   rect(0, width/2, width/2, width/2);
  }
  
  else if(value == 4 && change != 4)
  {
   r = (int)random(255);
   g = (int)random(255);
   b = (int)random(255);
   aRandomNote = random(127);
   noteArray[3] = (int)aRandomNote;
   aNewScore.addNote(3.0, noteArray[3], 100.0, 1.0);
   aNewScore.play();
   fill(r, g, b);
   rect(width/2, width/2, width/2, width/2);
  }
  
 
  
  println("Change contains the previous number that value held: " + change);
  println("Value holds the current quandrant number : " + value);
}
