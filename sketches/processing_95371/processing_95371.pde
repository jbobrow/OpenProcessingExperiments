
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

int value = 1;
int change = 0;

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
   aNewScore.addNote(0.0, aRandomNote, 100.0, 1.0);
   aNewScore.play();
   fill(r, g, b);
  }
  rect(0, 0, width/2, width/2);
  println("Change contains the previous number that value held: " + change);
  println("Value holds the current quandrant number : " + value);
}
