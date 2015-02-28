
static Token[] equationU;
static Token[] equationV;
int[] colorFreq; 
PImage wheel;
PImage myImage;
int underCount = 0;
int tempWidth = 0;
int temptempHeight = 0;
static float maxmapX = -100000000;
static float maxmapY = -100000000;
static float minmapX = 100000000;
static float minmapY = 100000000;
final static int VAR_X = 10;
final static int VAR_Y = 11;
final static int NUM = 1;
final static int BIN_OP = 2;
final static int UN_OP = 3;
final static int CONDENSED = -1;
final static int EMPTY = 0;

static int curX = 0;
static int curY = 0;

int eqUSize = 7;
int eqVSize = 5;
float compX = 0.0;
float compY = 0.0;
Token[] tempU = new Token[100];
Token[] tempV = new Token[100];
boolean testFlag = true;

static float lowHue = -10000;
static float lowSat = -10000;
static float lowBrt = -10000;
static float hiHue = 10000;
static float hiSat = 10000;
static float hiBrt = 10000;
static float maxD = -10;
static int domain = 10;


void setup()
{
  size(600, 600);
  //println("SETUP");
  tempWidth = width;
  tempHeight = height;
  colorFreq = new int[tempWidth*tempHeight];
  equationU = new Token[100];
  equationV = new Token[100];
  for (int i = 0; i < 100; i++)
  {
    equationU[i] = new Token();
    equationV[i] = new Token();
  }
  colorMode(HSB, 360, 1, 1);
  for (int kol = 0; kol < (tempWidth*tempHeight); kol++)
  {
    colorFreq[kol] = 0;
  }
  background(0);

  equationU[0] = new Token("x", VAR_X);
  equationU[1] = new Token("2", NUM);
  equationU[2] = new Token("^", BIN_OP);
  equationU[3] = new Token("y", VAR_Y);
  equationU[4] = new Token("2", NUM);
  equationU[5] = new Token("^", BIN_OP);
  equationU[6] = new Token("-", BIN_OP);
  equationU[7] = new Token("x", VAR_X);
  equationU[8] = new Token("+", BIN_OP);
  equationV[0] = new Token("2", NUM);
  equationV[1] = new Token("x", VAR_X);
  equationV[2] = new Token("*", BIN_OP);
  equationV[3] = new Token("y", VAR_Y);
  equationV[4] = new Token("*", BIN_OP);





  for (int loopX = 0; loopX < tempWidth; loopX++)
  {
    for (int loopY = 0; loopY < tempHeight; loopY++)
    {
      float evalX = map(loopX, 0, tempWidth, -domain, domain);
      float evalY = map(loopY, 0, tempWidth, -domain, domain);
      for (int reset = 0; reset < 100; reset++)
      {
        tempU[reset] = new Token();
        tempV[reset] = new Token();
      }    
      for (int reset = 0; reset < 100; reset++)
      {
        tempU[reset] = new Token(equationU[reset]);        
        tempV[reset] = new Token(equationV[reset]);
      }      
      float tempcompX = evalEqn(tempU, evalX, evalY);
      float tempcompY = evalEqn(tempV, evalX, evalY);
      if (tempcompX > maxmapX)
      {
        maxmapX = tempcompX;
      }
      if (tempcompX < minmapX)
      {
        minmapX = tempcompX;
      }
      if (tempcompY > maxmapY)
      {
        maxmapY = tempcompY;
      }
      if (tempcompY < minmapY)
      {
        minmapY = tempcompY;
      }
      float tempD = sqrt(tempcompY*tempcompY + tempcompX * tempcompX);
      if (tempD > maxD)
      {
        maxD = tempD;
      }
    }
  }

  //println("min X: "+minmapX+", max X:"+ maxmapX);
  //println("min Y: "+minmapY+", max Y:"+ maxmapY);







  myImage = createImage(600, 600, RGB);
  myImage.loadPixels();
  for (int l = 0; l < myImage.pixels.length; l++)
  {
    myImage.pixels[l] = color(0, 0, 0, 100);
  }
  myImage.updatePixels();
  println("SETUP COMPLETE");



  myImage.loadPixels();
  //myImage(myImage, 0, 0);
  image(myImage, 0, 0);
  println("myImage created");
  while (curX < 600)
    //for (int curX = 0; curX < 600; curX++)
  {      
    for (curY = 0; curY < 600; curY++)
    {        
      for (int reset = 0; reset < 100; reset++)
      {     
        tempU[reset] = new Token();
        tempV[reset] = new Token();
      }
      //println("reset");
      for (int temp = 0; temp < eqUSize; temp++)
      {
        tempU[temp] = new Token(equationU[temp]);
      }
      for (int temp2 = 0; temp2 < eqVSize; temp2++)
      {
        tempV[temp2] = new Token(equationV[temp2]);
      }
      //println("equations copied");
      float mapY = map(curY, 0, tempHeight, -domain, domain);
      float mapX = map(curX, 0, tempWidth, -domain, domain);
      //println("x,y mapped");
      compX = evalEqn(tempU, mapX, mapY);
      compY = evalEqn(tempV, mapX, mapY);
      //println("x,y computed");
      float newmapX = map(compX, -domain, domain, 0, tempWidth); 
      float newmapY = map(compY, -domain, domain, 0, tempHeight); 
      //println("new map");
      float arg2 = PI+(-1*atan2(compY, compX));
      float arg = round(arg2/(PI/6.0))*(PI/6.0);
      float radius = sqrt(compX * compX + compY * compY);
      float diameter = map(sqrt(compX * compX + compY * compY), 0, domain, 0, tempWidth);
      //println("polar converted");
      int pixelTo = 0;
      int pixelFrom = 0;

      pixelFrom = max(0, min(round(curX + curY*tempWidth), tempWidth*tempHeight-1));
      //println("pixelFrom computed");
      int temppixTo = 0;
      temppixTo = (int)((newmapX + newmapY * tempWidth));  
      //println("pixTo calculated");
      boolean firstFlag = (boolean)(temppixTo < (tempWidth * tempHeight));
      boolean secondFlag = (boolean)(temppixTo > 0);
      boolean changePix = (boolean)(firstFlag && secondFlag);
      //println("flags good");
      ////println(changePix);
      if (changePix == true)
      {
        //println("");
        //println("inside if");
        myImage.loadPixels();
        //println("myImage loaded");
        colorFreq[pixelFrom]++;
        int myFreq = colorFreq[temppixTo]; 

        float myHue = (degrees(arg)+180)%360;
        myImage.pixels[pixelFrom] =  color(myHue, 3*(diameter/(tempWidth / 3.0)) - .25, 3-((diameter/(tempWidth / 3))));
        //println("myImage updated");
      }
      ////println("notIf");
      myImage.updatePixels();
      //image(myImage, 0, 0);
      //println("image pixels updated & loaded");
    }
    curX++;
  }
  if (curX >= 600)
  {
    myImage.updatePixels();
    myImage.loadPixels();
    image(myImage, 0, 0);
    //background(myImage);
  }
}

void draw()
{
  //println("in draw");
}






float evalEqn(Token[] equation, float x, float y)
{
  boolean evalFlag = true;
  int i = 0;
  int flag = equation[i].flag;
  while (flag != EMPTY)
  {
    if (flag == (VAR_X))
    {

      equation[i].token = ""+x;
      equation[i].flag = NUM;
    }
    if (flag == (VAR_Y))
    {

      equation[i].token = ""+y;
      equation[i].flag = NUM;
    }
    i++;
    if (equation[i] == null)
    {
      flag = EMPTY;
    }
    else
    {
      flag = equation[i].flag;
    }
  }
  while (evalFlag)
  {

    evalFlag = false;
    i = 0;
    flag = equation[i].flag;
    while (flag != EMPTY)
    {
      int j = 1;
      int k = 1;
      if (flag == (NUM))
      {
      }
      else if (flag == (UN_OP))
      {  

        while (equation[i-j].flag == CONDENSED) {

          j++;
        };

        equation[i].token = ""+evalUN(equation[i].token, float(equation[i-j].token));
        equation[i].flag = NUM;
        equation[i-j].token = ""+0;
        equation[i-j].flag = CONDENSED;
        evalFlag = true;
      }
      else if (flag == (BIN_OP))
      { 

        while (equation[i-j].flag == CONDENSED) {

          j++;
        };
        while (equation[i-j-k].flag == CONDENSED) {

          k++;
        };
        String operator = (String)equation[i].token;
        float in2 = float(equation[i-j].token);
        float in1 = float(equation[i-j-k].token);

        float returned = evalBin(operator, in1, in2);
        equation[i].token = ""+returned;
        equation[i].flag = NUM;
        equation[i-j].token = ""+0;
        equation[i-j-k].token = ""+0;
        equation[i-j].flag = CONDENSED;
        equation[i-j-k].flag = CONDENSED;
        evalFlag = true;
      }
      i++;
      if (equation[i] == null)
      {
        flag = EMPTY;
      }
      else
      {
        flag = equation[i].flag;
      }
    }
  }

  int result_ind = 0;
  while ( (equation[result_ind].flag!=EMPTY) && ((equation[result_ind].flag!=NUM)))
  {
    result_ind++;
  }
  float toReturn = float(equation[result_ind].token);
  return toReturn;
}
float evalUN(String OP, float Value)
{
  float toReturn = 0.0;
  if (OP.equals("-"))
  {
    toReturn =  ((-1)*Value);
  }
  if (OP.equals("sin"))
  {
    toReturn =  sin(Value);
  }
  if (OP.equals("tan"))
  {
    toReturn =  tan(Value);
  }
  if (OP.equals("cos"))
  {
    toReturn =  cos(Value);
  }
  else
  {
    toReturn =  Value;
  }
  ////println("Unary: "+toReturn);
  return toReturn;
}

float evalBin(String OP, float in1, float in2)
{
  float toReturn = 0.0;

  if (OP.equals("^"))
  {
    toReturn =  pow(in1, in2);
  }
  else if (OP.equals("+"))
  {
    toReturn =  (in1+in2);
  }
  else if (OP.equals("-"))
  {
    toReturn =  (in1 - in2);
  }
  else if (OP.equals("*"))
  {
    toReturn =  (in1 * in2);
  }
  else if (OP.equals("/"))
  {
    toReturn =  ((in1*1.0) / in2);
  }
  else
  {
    toReturn =  (-1.0);
  }
  return toReturn;
}


public class Token  
{
  public String token;
  public int flag;

  public Token()
  {
    token = "";
    flag = 0;
  }
  public Token(String in1, int in2)
  {
    token = in1;
    flag = in2;
  }
  public Token(Token inToken)
  {
    token = inToken.token;
    flag = inToken.flag;
  }
}



