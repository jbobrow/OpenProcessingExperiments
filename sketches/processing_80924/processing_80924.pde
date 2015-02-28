
String[] MyLines;
String[] Names = new String[7];
float[] WordOrig = new float[7];
float[] AvgLength = new float[7];
int[][] WordNumbers = new int[7][20];

color[] MyColors = new color[7];
PFont MyFont;

void setup()
{
  size(1200, 750);
  background(255, 255, 255);
  MyLines = loadStrings("NewsData.csv");
  MyFont = loadFont("Vrinda-Bold-16.vlw");
  
  ImportData();
  BuildColors();
  
  PImage Temp = createImage(width, height, ARGB);
  PImage Background = loadImage("newspaper.jpg");
  Background.resize(width, height);
  
  Background.loadPixels();
  Temp.loadPixels();
  int h = 0;
  int w;
  while(h < height)
  {
    w = 0;
    while(w < width)
    {
      color mine = Background.pixels[h*width + w];
      Temp.pixels[h*width + w] = color(red(mine), green(mine), blue(mine), 75);
      w++;
    }
    h++;
  }
  
  image(Temp, 0, 0);
  GridsDotsTextEtc();
  DrawShapes();
  
  save("Final.jpg");
  
}

//-------------------------------------------------------
void draw()
{
  
}

//-------------------------------------------------------
void ImportData()
{
  int k;
  int t = 0;
  while(t < 7)
  {
    //this chunk gets the names in
    int j = 0;
    while(MyLines[t].charAt(j) != ',')
    {
      j++;
    }
    Names[t] = MyLines[t].substring(0, j);
    j++;
    
    // and this chunk gets the Word diversity stat in
    k = j;
    String temp;
    while(MyLines[t].charAt(j) != ',')
    {
      j++;
    }
    temp = MyLines[t].substring(k, j);
    WordOrig[t] = float(temp);
    j++;
    
    //this one does the Average Word lengths
    k = j;
    while(MyLines[t].charAt(j) != ',')
    {
      j++;
    }
    temp = MyLines[t].substring(k, j);
    AvgLength[t] = float(temp);
    j++;
    
    //and this does the word numbers, so that we can make the distributions
    int i = 0;
    while(i < 20)
    {
      k = j;
      while(j < MyLines[t].length() && MyLines[t].charAt(j) != ',')
      {
        j++;
      }
      WordNumbers[t][i] = int(MyLines[t].substring(k, j));
      j++;
      i++;
    }
    //println(AvgLength[t]);
    //println(Names[t]);
    t++;

  }
}

//-----------------------------------------------------------
void BuildColors()
{
  float Min = 0;
  float Max = 0;
  int i = 0;
  while(i < 7)
  {
    if(Min == 0)
    {
      Min = WordOrig[i];
    }
    else
    {
      if(WordOrig[i] < Min)
      {
        Min = WordOrig[i];
      }
    }
    if(WordOrig[i] > Max)
    {
      Max = WordOrig[i];
    }
    i++;
  }
  
  i = 0;
  while(i < 7)
  {
    int o = int(map(WordOrig[i], Min, Max, 50, 200));
    MyColors[i] = color(0, 255, 0, o);
    
    //println(green(MyColors[i]));
    i++;
  }
  // map(50 = Min, 200 = Max)
  //println(Min);
  //println(Max);
  
}

//------------------------------------------------------------
void GridsDotsTextEtc()
{
  fill(0, 0, 0);
  
  // This does the Dots at the bottom, and numbers??
  textFont(MyFont, 16);
  int i = 0;
  while(i < 20)
  {
    ellipse(i*50 + 200, 725, 5, 5);
    text(i, i*50+200 + 3, 725);
    i++;
  }
  
  //This does the horizontal lines, and the names
  textFont(MyFont, 16); 
  i = 0;
  while(i < 7)
  {
    line(0, (i+1)*100, width, (i+1)*100);
    
    text(Names[i], 25, 50+i*100);
    i++;
  }
  
  //This does the vertical line
  line(150, 0, 150, height);
  
  fill(75, 0, 255);
  text("The graphs show how many words of the given size", 800, 315);
  text("the source used, relative to other word sizes.", 800, 330);
  text("A deeper shade of green indicates that the source", 800, 345);
  text("used a wider variety of words than for a source", 800, 360);
  text("with a lighter shade of green.", 800, 375);
  
  textFont(MyFont, 32);
  text("Analysis of Articles Written about the Conflict in Gaza", 250, 50);
  fill(0, 0, 0);
  
  //This does the border!
  strokeWeight(10);
  line(0, 0, width, 0);
  line(width, 0, width, height);
  line(0, 0, 0, height);
  line(0, height, width, height);
  strokeWeight(1);
}

//------------------------------------------------------------
void DrawShapes()
{
  // map(number, 0, 200, 0, 100)
  int i = 0;
  while(i < 7)
  {
    fill(MyColors[i]);
    beginShape();
    vertex(200, 100*(i+1));
    int f = 0;
    while(f < 20)
    {
      vertex(200 + f*50, 100*(i+1) - map(WordNumbers[i][f], 0, 200, 0, 100));
      f++;
    }
    vertex(1150, 100*(i+1));
    endShape();
    i++;
  }
}


















