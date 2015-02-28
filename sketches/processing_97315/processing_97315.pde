

PFont font;

int[] numbers = {
  0, 0, 0, 0, 0, 0
};
CacheBox[] boxArray = new CacheBox[numbers.length];
boolean pressed = true;
boolean firstPressed = false;
int currentPosition = 0;
public static int widthAndHeight = 50;
boolean atEnd = false;
int[] horNumbers = new int[12];
HorizontalBox[] horArray = new HorizontalBox[horNumbers.length];
boolean firstTime = true;

void setup()
{
  size(850, 600);

  font = createFont("Arial", 25, true);

  textFont(font);  

  for (int i = 0; i < horNumbers.length; i++)
  {
    horNumbers[i] = (int) random(0, 20);
  }

  for (int i = 0; i < boxArray.length; i++)
  {
    boxArray[i] = new CacheBox(widthAndHeight * 3, widthAndHeight*(i+1) + widthAndHeight * 2, numbers[i]);
  }

  for (int i = 0; i < horArray.length; i++)
  {
    horArray[i] = new HorizontalBox(widthAndHeight *(i+1) + 2*widthAndHeight, widthAndHeight, horNumbers[i]);
  }
}

void mousePressed()
{
  if (firstTime)
  {
    firstTime = false;
  }
  else
  {
    pressed = true;
    firstPressed = true;
    if (!atEnd)
      currentPosition++;
  }
}

void draw()
{
  if (firstTime)
  {
    background(150, 60, 172);
    fill(30, 10, 15);
    text("The function of a cache in computers is to alleviate the stack of either\nredundant data or data which will not be accessed for a while\n"
      +"(the next time which the data will be accessed is determined by the\nprogram using the data). In order to efficiently store the data in the\n"
      +"cache, numerous algorithms have been developed to handle data\nbeing passed from the stack to the cache. The algorithms differ\n"
      +"mainly from their method of deleting information on the stack to\nmake room for other data. The cache implementation in this example\n"
      +"uses the Least Recently Used algorithm (LRU) which removes the\nvalue in the cache which was added to the cache the furthest in the\n"
      +"past. Other algorithms have been developed which communicate\nwith the actual software storing the data and ask when they plan on\n"
      +"using the data again. Thus, the cache will store only the data that will\nbe used in the near future.", 20, 50);
    fill(255, 255, 255);
    text("Click to Continue", 340, 560);
  }
  else
  {
    textSize(25);
    background(255, 150, 100);
    if (pressed && !atEnd || !firstPressed)
    {
      for (int i = 0; i < boxArray.length; i++)
      {
        if (firstPressed)
          boxArray[i].moveBox(widthAndHeight);
        boxArray[i].display();
      }

      if (currentPosition < horArray.length)
      {
        int currentValue = horArray[currentPosition].getNumber();
        boolean equalsNumberInCache = false;
        for (int i = 0; i < boxArray.length; i++)
        {
          if (boxArray[i].getNumber() == currentValue)
          {
            boxArray[i].changeNumber(currentValue);
            boxArray[i].changed(currentPosition);
            equalsNumberInCache = true;
            horArray[currentPosition].setReference(i);
            break;
          }
        }
        if (!equalsNumberInCache)
        {
          int lastChanged = 0;
          for (int i = 0; i < boxArray.length; i++)
          {
            if (boxArray[i].getWhenChanged() < boxArray[lastChanged].getWhenChanged())
            {
              lastChanged = i;
              horArray[currentPosition].setReference(i);
            }
          }
          boxArray[lastChanged].changeNumber(currentValue);
          boxArray[lastChanged].changed(currentPosition);
          horArray[currentPosition].setReference(lastChanged);
        }
      }
      else
      {
        atEnd = true;
      }
      pressed = false;
    }
    else
    {
      for (int i = 0; i < boxArray.length; i++)
      {
        boxArray[i].display();
      }
    }

    for (int i = 0; i < horArray.length; i++)
    {
      if (horArray[i].getReference() != -1 && boxArray[horArray[i].getReference()].getNumber() != horArray[i].getNumber())
        horArray[i].setReference(-1);
      horArray[i].display();
    }

    fill(23, 100, 200);
    textSize(15);
    text("Stack Index Reference", 10, 32);
    textSize(35);
    text("Stack", 10, 80);
    textSize(35);
    text("Cache", 10, 300);
  }
}


