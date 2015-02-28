
void walk()
{
  if (rightkey) {
    //x=x+10; tiles move right; looks like player moves left
    if (level==3) x=x-7.5;
    else x=x-5;
    /*if (x>275)
     {
     x = 275;
     }*/
  }
  if (leftkey) 
  {
    //x=x-10;
    if (level==3) x=x+7.5;
    else x=x+5;
    /*if (x<25)
     {
     x = 25;
     }*/
  }
  if (upkey) 
  {
    //y=y-10; tiles move down; looks like player moves up
    if (level==3) y=y+7.5;
    else y=y+5;
    /*if (y<25)
     {
     y = 25;
     }*/
  }
  if (downkey) 
  {
    //y=y+10;
    if (level==3) y=y-7.5;
    else y=y-5;
    /*if (y>275)
     {
     y = 275;
     }*/
  }
}

void keyPressed ()
{
  if (keyCode == RIGHT) {
    rightkey = true;
  }
  if (keyCode == LEFT) {
    leftkey = true;
  }
  if (keyCode == UP) {
    upkey = true;
  }
  if (keyCode == DOWN) {
    downkey = true;
  }
  if (keyCode == ENTER) {
    enterkey = true;
  }
}

void keyReleased ()
{
  if (keyCode == RIGHT) {
    rightkey = false;
    rightjustreleased = true;
    leftjustreleased = false;
  }
  if (keyCode == LEFT) {
    leftkey = false;
    leftjustreleased = true;
    rightjustreleased = false;
  }
  if (keyCode == UP) {
    upkey = false;
    upjustreleased = true;
    downjustreleased = false;
  }
  if (keyCode == DOWN) {
    downkey = false;
    downjustreleased = true;
    upjustreleased = false;
  }
  if (keyCode == ENTER) {
    enterkey = false;
  }
}


