
//Home: 0 = menu, 1 = gameplay, 2 = pause, 3 = options, 4 = credits
int home = 0;
void draw() {
//random temporary size
  size(300, 300);
  if(home === 0) {
    background(255);
    //i need to know how big should the screen be and how big should the text be
    //or should there be a logo replacing the screen instead?
  }
  if(home === 1) {
    //decide on a variable to 'start game?'
  }
  if(home === 2) {
    //should there be a little box in the middle that is prompted or should
    //everything be blackscreened?again, the font?
  }
  if(home === 3) {
    //what kind of options should there be? music?
    //how about options to make the game crazier(lots of apples/addition of bombs
    //unlocked upon reaching a certain level?)
  }
  if(home === 4) {
    //font?
  }
  }
}

//more ideas on things:
/*
-upon level completion eatApple should be returned to true

if(applesExisting === 0) {
  -new level (do whatever you want)
}

appleGenerate = new function() {
  if(eatApple == false && applesGenerated <= level) {
  return rect(floor(math.random()*300), floor(math.random()*300, 10, 10);
  applesGenerated++;
  applesExisting = applesGenerated;
  }
}

if(snake gets to apple) {
  eatApple = true;
  applesExisting --;
}

*/
