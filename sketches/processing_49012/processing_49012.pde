
abstract class Actor {
  PVector loc;
  PVector bbox;
  
  abstract void drawArt();
  abstract void collide(Actor body);
}

