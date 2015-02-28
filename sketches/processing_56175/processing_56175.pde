
/**
 * CS171 Basic Processing Example code.
 * Charts - how to create a time series or bar chart using data in tsv
 *
 * Written by Azalea Vo.
 */

// GLOBAL VARIABLES
Table charFreq;

// Min and Max varialbes
int charMin, charMax;
float freqMin, freqMax;

// Dimensions for our chart
float plotX1, plotY1;
float plotX2, plotY2;
float barWidth;

// Some useful initialized constants
String[] languages = {
  "English", "French", "German"
};
color[] barCols = {
  #F46D43, #35978F, #7FBC41, #FFFFFF
};
int numLangs = 3;

// Some Fonts
PFont titlefont;
PFont font;
PFont legendfont;

// For the data
String[] chars = new String[26];
int[] freq = new int[(numLangs + 1)*26];

void setup()
{
  // ???
  size(1000, 500);

  // Loading the data from TSV to arrays
  Table charFreq = new Table("charfreq.tsv");
  titlefont = loadFont("TrebuchetMS-Bold-24.vlw");
  legendfont = loadFont("TrebuchetMS-16.vlw");
  font = loadFont("ArialMT-10.vlw");
  textFont(font);

  // 26 chars
  charMin = 0;
  charMax = 26;

  plotX1 = 45;
  plotX2 = width - plotX1;
  plotY1 = 60;
  plotY2 = height - plotY1;
  smooth();

  // Need total to calculate frequency
  // Store both word and corresponding frequency
  for (int i = 0; i < charMax; i++)
  {
    int charBin = (numLangs +1) * i;
    chars[i] = charFreq.getString(i, 0);
    freq[charBin] = charFreq.getInt(i, 1);
    freq[charBin + 1] = charFreq.getInt(i, 2);
    freq[charBin + 2] = charFreq.getInt(i, 3);
    freq[charBin + 3] = 0;
  }

  // Initialize our min and max from above
  freqMin = 0;
  freqMax = 2000;

  // width of each histogram bar depends on binsize for scaling of x-axis
  barWidth = (plotX2-plotX1)/(charMax*4);
}

void draw()
{
  // ???
  background(224);

  fill(255);
  rectMode(CORNERS);
  noStroke();
  rect(plotX1, plotY1, plotX2, plotY2);

  strokeWeight(1);
  stroke(255);

  // Draw bar chart
  drawDataBars(); 

  // Hover effect
  update(mouseX, mouseY);

  // Label axes and legend
  drawLabels();
  drawLegend();

  // ???
  //drawTimeSeries();
}

// ???
void drawDataBars()
{
  rectMode(CORNERS);

  // Count number of bars
  int count = (numLangs + 1) * charMax;

  // Iterate through the data to draw each bar
  for (int row = 0; row < count; row++)
  {
    int offset = row % (numLangs + 1);
    if (offset < 3)
    {
      fill(barCols[offset]);

      int value = freq[row];

      // Scale to the size of chart area
      float x = map(row, charMin, (numLangs + 1)*charMax, plotX1, plotX2);
      float y = map(value, freqMin, freqMax, plotY2, plotY1);
      rect(x, y, x+barWidth, plotY2);
    }
  }
}

// ???
void drawLabels()
{
  fill(#4D4D4D);

  textFont(titlefont);
  textAlign(CENTER, CENTER);
  text("FREQUENCY OF CHARACTERS USED IN DIFFERENT LANGUAGES", width/2, plotY1/2);

  textFont(legendfont);
  text("Frequency", plotX1, plotY1/2 + barWidth);
  text("Character", (plotX2 + plotX1)/2, plotY2 + 3*barWidth);

  textFont(font);
  textAlign(RIGHT, CENTER);

  // y-axis: 10 intervals, use negative space for readability
  float interval = freqMax/10;
  for (float i = 0; i < freqMax + interval; i+=interval)
  {
    float y = map(i, freqMin, freqMax, plotY2, plotY1);
    text(int(i)/100 + "%", plotX1 - 10, y);

    stroke(255);
    line(plotX1, y, plotX2, y);
  }

  // ???
  for (int j = 0; j < charMax; j++)
  {
    float x = map(j, charMin, charMax, plotX1, plotX2) + 2*barWidth;
    text(chars[j], x, plotY2+barWidth, x);
  }
}

// ???
void drawLegend()
{
  // Legend rectangle
  stroke(#4D4D4D);
  fill(255);
  rect(plotX2 - 3*plotX1, plotY1 + barWidth, plotX2 - barWidth, 2*plotY1 + barWidth);

  textAlign(LEFT);
  textFont(legendfont);
  
  // Colored rectangle and text for legend
  for (int i = 0; i < numLangs; i++)
  {
    fill(#4D4D4D);
    text(languages[i], plotX2 - 2*plotX1, plotY1 + (2*i + 3)*barWidth);
    fill(barCols[i]);
    noStroke();
    rect(plotX2 - 3*plotX1 + barWidth, plotY1 + (2*i + 2)*barWidth, plotX2 - 2*plotX1 - barWidth, plotY1 + (2*i + 3)*barWidth);
  }
}

// ???
void update(int x, int y)
{
  if ((y > plotY1) && (y < plotY2) && (x > plotX1) && (x < plotX2))
  {
    // Find which bar and value
    int count = (numLangs + 1) * charMax;
    float barVal = map(x, plotX1, plotX2, 0, count);
    int bar = floor(barVal);
    int offset = bar % (numLangs + 1);

    // Draw this bar in a different color
    if (offset < numLangs)
    {
      int value = freq[bar];
      float xBar = map(bar, charMin, (numLangs + 1)*charMax, plotX1, plotX2);
      float yBar = map(value, freqMin, freqMax, plotY2, plotY1);
      fill(#4D4D4D);
      rect(xBar, yBar, xBar+barWidth, plotY2);

      // ???
      /*
      stroke(#4D4D4D);
       line(plotX1, yBar, plotX2, yBar);
       */

      // ???
      /*
      textAlign(RIGHT, CENTER);
       text(float(value)/100 + "% of " + languages[offset], plotX2 - barWidth, 3*plotY1 - 3*barWidth);
       */
    }
    
    // ???
    /*for (int i = 0; i < numLangs; i++)
    {
      int value = freq[bar - offset + i];
      float xBar = map((bar - offset + i), charMin, (numLangs + 1)*charMax, plotX1, plotX2);
      float yBar = map(value, freqMin, freqMax, plotY2, plotY1);
      fill(#4D4D4D);
      rect(xBar, yBar, xBar+barWidth, plotY2);
    }*/
  }
}

// ???
void drawTimeSeries()
{
  ellipseMode(CENTER);

  // ???
  int count = (numLangs + 1) * charMax;

  // ???
  for (int row = 0; row < count; row++)
  {
    int offset = row % (numLangs + 1);
    if (offset < 3)
    {
      fill(barCols[offset]);

      int value = freq[row];

      // ???
      float x = map(row, charMin, (numLangs + 1)*charMax, plotX1, plotX2);
      float y = map(value, freqMin, freqMax, plotY2, plotY1);
      ellipse(x, y, barWidth, barWidth);
    }
  }
}


