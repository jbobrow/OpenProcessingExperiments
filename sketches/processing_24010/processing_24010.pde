
void correct()
{
  asteroidHit.trigger();
  textEntered = "";
  time = true;
  asteroidCounter -= 1;
  if(asteroidCounter == 0)
  {
    screenNumber = 1002;
  }
  if(asteroidCounter > 0)
  { 
    popupCorrect = true;
  }
  enter = false;
}

