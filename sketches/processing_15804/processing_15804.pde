
void checkPrize2()
{
 if(abs(u - prizeX) < 15 && abs(v - prizeY) < 15)
  {
    bScore += 20;
    placePrizeRandomly();
  }

  if(abs(u - prizeX3) < 15 && abs(v - prizeY3) < 15)
  {
    bScore += 15;
    placePrizeRandomly();
  }


  if(abs(u - prizeX4) < 15 && abs(v - prizeY4) < 15)
  {
    bScore += 10;
    placePrizeRandomly();
  }

  if(bScore > 350)
  {
    screenNumber=6;
  }

prizeY = prizeY +4;

 prizeY3 = prizeY3 +4;

  prizeY4 = prizeY4 +4;

  prizeY5 = prizeY5 +4;

  prizeY6 = prizeY6 +4;
  prizeY7 = prizeY7 +4;

  prizeY8 = prizeY8 +4;


 if(prizeY > height) prizeY = +1;
  if(prizeY3 > height) prizeY3 = +1;
  if(prizeY4 > height) prizeY4 = +1;
  if(prizeY5 > height) prizeY5 = +1;
  if(prizeY6 > height) prizeY6 = +1;
  if(prizeY7 > height) prizeY7 = +12;
  if(prizeY8 > height) prizeY8 = +250;
}


