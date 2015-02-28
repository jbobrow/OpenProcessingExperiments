
//here, use an if statement to compare the position of an object with the edge of the screen
boolean objectIsOffscreenLeft(int whichObject) {
  if (objectXPositions[whichObject] < 0) {
    return true;
  }
  else {
    return false;
  }
}


boolean objectIsOffscreenRight(int whichObject) {
  if (objectXPositions[whichObject] > width) {
    return true;
  }
  else {
    return false;
  }
}


boolean objectIsOffscreenTop(int whichObject) {
  if (objectYPositions[whichObject] < 0) {
    return true;
  }
  else {
    return false;
  }
}

//this function acts just like the ones above, but it is written
//in a more terse form. Note that when the if statements above are true,
//we return a value of true, and otherwise we return false.
//so here, we just return the value of the if statement, which is equivalent.
boolean objectIsOffscreenBottom(int whichObject) {
  return (objectYPositions[whichObject] > height);
}


