
/*
Dillon Marlatt 10/10/13
Tsunami Crown Vending Machine
 -------------------------------
 Wave Picture taken from allfreedownloads.com
 Font is Rick Mueller's Ocean View
 */

PImage skin, coin, can;
boolean changeInserted = false, amountAsked = false, amountAskedDiet = false,
  notEnoughChange = false, changeDrop = false, canDrop = false;
String avaliable;
float change;
int coinYPos, canYPos;

void setup()
{
  size(400, 600);
  skin = loadImage("vendingmachine.png");
  coin = loadImage("coin.png");
  can = loadImage("can.png");
  coinYPos = 375;
  canYPos = 440;
  textSize(15);
  fill(0, 255, 0);
}

void draw()
{
  image(skin, 0, 0);
  
  if (changeInserted)
    text(nf(change, 2, 2), 325, 160);
  else if (amountAsked)
    text("OUT", 325, 160);
  else if (amountAskedDiet)
    text("00.75", 325, 160);
  else if (notEnoughChange)
    text("NEED $", 320, 160);
    
  if(canDrop)
  {
    image(can, 170, canYPos);
    canYPos++;
    if(canYPos > 600)
    {
      canYPos = 440;
      canDrop = false;
    }
  }
  if(changeDrop)
  {
    image(coin, 360, coinYPos);
    coinYPos++;
    if(coinYPos > 600)
    {
      coinYPos = 375;
      changeDrop = false;
    }
  }
}

void mouseClicked()
{
  //Tsunami Smash Button
  if (mouseX > 305 && mouseX < 380 && mouseY > 187 && mouseY < 255)
  {
    changeInserted = false;
    amountAskedDiet = false;
    amountAsked = true;
  }
  //Diet Tsunami Smash Button
  if (mouseX > 305 && mouseX < 380 && mouseY > 273 && mouseY < 337)
  {
    if (changeInserted == false)
    {
      amountAsked = false;
      changeInserted = false;
      amountAskedDiet = true;
    }
    else if (changeInserted == true && change < .75)
    {
      amountAsked = false;
      changeInserted = false;
      amountAskedDiet = false;
      notEnoughChange = true;
    }
    else if (changeInserted == true && change >= .75)
    {
      canDrop = true;
      change-=.75;
      if (change > 0)
      {
        changeDrop = true;
        change = 0;
      }
    }
  }

  //Insert Bill($01.00)
  if (mouseX > 300 && mouseX < 350 && mouseY > 100 && mouseY < 125)
  {
    changeInserted = true;
    change+=1;
  }

  //Insert Coin($00.50)
  if (mouseX > 360 && mouseX < 380 && mouseY > 100 && mouseY < 125)
  {
    changeInserted = true;
    change+=.25;
  }

  //Coin Return
  if (mouseX > 322 && mouseX < 332 && mouseY > 369 && mouseY < 380)
  {
    if(changeInserted)
    {
      changeDrop = true;
      change = 0;
    }
  }
}



