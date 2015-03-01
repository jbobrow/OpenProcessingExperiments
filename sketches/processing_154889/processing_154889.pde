
PFont font;

void setup ()
{
  size (600, 600);
  loadJson ();
  setArrays();
  setMinMaxVals();

  font = createFont ("Arial", 14);
  textFont (font, 14);
  textAlign (LEFT, TOP);
}

void draw ()
{
  background(#57385c);

  for (int i = 0; i < tagsPerPhoto.length; i++)
  {
    float y = map (i, 0, tagsPerPhoto.length, 10, height - 10);
    float x = 50;
    String n = names [i] + ": " + str (tagsPerPhoto [i].length) + " photos";
    text (n, 50, y);

    int tagCounter = 0;

    for (int j = 0; j < tagsPerPhoto [i].length; j++)
    {
      tagCounter += tagsPerPhoto  [i] [j].length;
    }

    float x2 = x + textWidth (n);
    String t = " with " + str (tagCounter) + " tags";
    text (t, x2, y);
  }
}


