
import rita.*;

int lineLength = 80;

RiText rts[];
RiMarkov markov;

void setup()
{
  RiText.setDefaultFont("BookmanOldStyle-16.vlw");
  size(670, 630);
  RiText.setDefaultAlignment(CENTER);
  new RiText(this, "click to create a poem", width/2, height/2);
  RiText.setDefaultAlignment(LEFT);
  markov = new RiMarkov(this, 2);  

  markov.loadFile("t1.txt");
}

void draw()
{
  background(255);
}

void mouseClicked()
{
  RiText.deleteAll();
  String[] lines = markov.generateSentences(8);
  for (int i = 0; i < 8; i++)
  {
    rts = RiText.createLines(this, lines[i], 20, 40+70*i, lineLength);
  }
}

