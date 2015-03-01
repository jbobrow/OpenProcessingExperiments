
import rita.*;

RiMarkov markov;


void setup()
{    
  size(500, 500);
  
  RiText.defaultFontSize(18);

  new RiText(this, "tell me more.");

  // create a markov model w' n=3
  markov = new RiMarkov(3);  
  
  // load files into the model
  markov.loadFrom(new String[] { "reddit_personals_2.txt", "reddit_personals_1.txt" }, this);    
}

void draw()
{
  background(255);
  RiText.drawAll();
}

void mouseClicked() 
{   
  if (!markov.ready()) return; 
  
  RiText.disposeAll(); // clean-up old data

  String[] lines = markov.generateSentences(1);
  
 

  // lay out in rect (x=50 y=50, w=400, h=400)
  RiText.createLines(this, lines, 50, 50, 400, 400);
}


