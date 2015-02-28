
void keyPressed() {
  if ((key == 'a')||(key == 'A')) {
    MovingLeft = true;
  }
  if ((key == 'd')||(key == 'D')) {
    MovingRight = true;
  }
  if (((key == 'w')||(key == 'W'))&&(Ground)) {
    Jumping = true;
    Ground = false;
  }
  if ((key == 's')||(key == 'S')) {
    MovingDown = true;
  }
}

void keyReleased() {
  if ((key == 'a')||(key == 'A')) {
    MovingLeft = false;
  }
  if ((key == 'd')||(key == 'd')) {
    MovingRight = false;
  }
  //        if (((key == 'w')||(key == 'W'))&&(Ground) {
  //          Jumping = false;
  //        }
  if ((key == 's')||(key == 'S')) {
    MovingDown = false;
  }
}


