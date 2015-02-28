
  /* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/54745*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
  float armLength = 140;  // arm length
  float shoulderLength = 7;    // shoulder length
  int recursions = 7;       //ilo\u015b\u0107 recursion

  int symmetricalDivisions = 6;
  private long seed;
  private int currentRecursions = 1;
  private int velocity = 1;

  public void setup()
  {
    size(700, 700);
    background(0);
    noStroke();
    smooth();
    fill(255);
    frameRate(29);
    platekS(width / 2, height / 2, armLength, shoulderLength, symmetricalDivisions, recursions);
  }

  public void draw()
  {
    randomSeed(seed);
    background(0);
    symmetricalDivisions = int(random(6)+3);

    platekS(width / 2, height / 2, armLength, shoulderLength, symmetricalDivisions, currentRecursions);

    currentRecursions += velocity;
    if (currentRecursions > recursions)
    {
      currentRecursions = recursions;
      velocity = -1;
    }
    if (currentRecursions < 1)
    {
      currentRecursions = 1;
      velocity = 1;
    }
  }

  public void mousePressed()
  {
    currentRecursions = 1;
    seed = millis();
  }

  public void platekS(float X1, float Y1, float H, float B, int symmetricalDivisions, int inRecursions)
  {
    int[] tabsymmetricalDivisions = new int[inRecursions];
    float[] tabH = new float[inRecursions];
    float[] tabB = new float[inRecursions];
    float[] tabalphaR = new float[inRecursions];

    tabsymmetricalDivisions[inRecursions - 1] = symmetricalDivisions;
    tabH[inRecursions - 1] = H;
    tabB[inRecursions - 1] = B;
    tabalphaR[inRecursions - 1] = 0;

    for (int i = inRecursions - 2; i >= 0; i--)
    {
      tabsymmetricalDivisions[i] = PApplet.parseInt(random(6) + 2);
      tabH[i] = tabH[i + 1] * random(0.5f, 0.7f);
      tabB[i] = tabB[i + 1] * random(0.4f, 0.5f);
      tabalphaR[i] = random(HALF_PI, PI - HALF_PI / 2);
      print(i + ": " + tabsymmetricalDivisions[i] + " " + tabH[i] + " " + tabB[i] + " " + tabalphaR[i] + "\n");
    }
    platekR(X1, Y1, tabH, tabB, tabalphaR, tabsymmetricalDivisions, inRecursions);
  }

  public void platekR(float X1, float Y1, float H[], float B[], float alphaR[], int symmetricalDivisions[], int inRecursions)
  {
    inRecursions--;
    if (inRecursions + 1 > 0 && symmetricalDivisions[inRecursions] != 0)
    {
      float alpha;
      if (alphaR[inRecursions] == 0)
        alpha = (TWO_PI - alphaR[inRecursions]) / (symmetricalDivisions[inRecursions]);
      else
        alpha = (TWO_PI - alphaR[inRecursions]) / (symmetricalDivisions[inRecursions] - 1);

      pushMatrix();
      translate(X1, Y1);
      rotate(-(TWO_PI - alphaR[inRecursions]) / 2);
      for (int i = 0; i < symmetricalDivisions[inRecursions]; i++)
      {

        rect(0, -B[inRecursions] / 2, H[inRecursions], B[inRecursions]);
        platekR(H[inRecursions], 0, H, B, alphaR, symmetricalDivisions, inRecursions);
        rotate(alpha);
      }
      popMatrix();
    }
  }


