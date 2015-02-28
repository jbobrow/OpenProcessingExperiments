
class R {

  int newwidth = 430;
  float barY = 400;
  float barX = constrain(mouseX, 95, 370) - 60;


  // Constructor
  R(){
  }


  void display(){

    imageMode(CENTER);
    image(ball, x, y, radius, radius);
    imageMode(CORNER);

    x =  x + speedX * directionX;
    y =  y + speedY * directionY;

    float barY = 400;
    float barX = constrain(mouseX, 95, 370) - 60;

    image(bar1, barX, barY);

    for(float i = 0; i < bar1.width; i++) { //hitting bar

        if(dist(x, y, barX+i, barY) < radius - bar1.height / 2){
        directionY = directionY * -1;
        speedY = random(3, 6);

        if(dist(x, y, barX, barY) < radius){
          directionX = directionX * -1;
        }
        else if(dist(x, y, barX+bar1.width, barY) < radius){
          directionX = directionX * -1;
        }
      }
    }


    if ((x > newwidth - radius) || (x < radius + 30)) { //bouncing off the walls
      directionX = directionX * -1;
    }

    if (y < radius + 30) { //bouncing off the top
      directionY = directionY * -1;
    }

    if(y > height + radius + 50 || eggbool || waterbool || bowlbool) { //GAMEOVER
      image(bg, 0, 0);
      c1.disappear(490, 159);

      if(eggbool){
        if(y < 400){
          x = -20;
          y = -20;
        }
        image(uhoheggs, 0, 0);
      }
      if(waterbool){
        if(y < 400){
          x = -20;
          y = -20;
        }
        image(uhohwater, 0, 0);
      }
      if(bowlbool){
        if(y < 400){
          x = -20;
          y = -20;
        }
        image(uhohball, 0, 0);
      }
    }

    if(y > height + radius + 50 && (neckbool == false || headbool == false ||
      wheelbool == false || buttonbool == false || antennabool == false ||
      drinkbool == false || eyebool == false)) { //GAMEOVER
      noTint();
      fade = fade + 10;
      tint(255, fade);
      image(bg, 0, 0);
      c1.disappear(490, 159);

      image(unfinished, 0, 0);
    }

    if((neckbool && headbool && wheelbool && buttonbool && antennabool && drinkbool && eyebool)) {
      noTint();
      fade = fade + 10;
      tint(255, fade);
      image(bg, 0, 0);
      c1.disappear(490, 159);
      image(win, 0, 0);
    }

    if((yy > 400 && yy2 > 400 && yy3 > 400 && yy4 > 400 && yy5 > 400 && yy6 > 400 && yy7 > 400 && yy8 > 400 && yy9 > 400 && yy10 > 400) &&
      (neckbool == false || headbool == false || wheelbool == false ||
      buttonbool == false || antennabool == false || drinkbool == false || eyebool == false)) {
      noTint();
      fade = fade + 10;
      tint(255, fade);
      image(bg, 0, 0);
      c1.disappear(490, 159);
      image(unfinished, 0, 0);
    }
  }
}

