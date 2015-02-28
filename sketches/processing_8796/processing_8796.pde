
import toxi.geom.*;
import toxi.geom.util.*;

ArrayList lightSwarm;
ArrayList soundSwarm;
PFont font;
boolean debug = false;
void setup()
{
  size(900, 450);
  smooth();
  lightSwarm = new ArrayList();
  soundSwarm = new ArrayList();
  
  font = loadFont("04b-03-8.vlw");
  textFont(font);
  textAlign(CENTER);
  
  for (int i = 0; i < 7 ; i++)
  {
    lightSwarm.add(new Creature(color(40, 40, 240), lightSwarm, soundSwarm));
    soundSwarm.add(new Creature(color(240, 40, 40)  , soundSwarm, lightSwarm));
  }
}

void draw()
{
  background(0);
  
  for (int i = 0; i < lightSwarm.size() ; i++)
  {
    Creature c = (Creature)lightSwarm.get(i);
    c.update();
    c.draw();
  }
  
  for (int i = 0; i < soundSwarm.size() ; i++)
  {
    Creature c = (Creature)soundSwarm.get(i);
    c.update();
    c.draw();
  }
  
}

void keyPressed()
{
  if (key == 'd')
  {
    debug = !debug;
  }
}

