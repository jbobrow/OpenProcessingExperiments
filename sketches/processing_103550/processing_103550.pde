
/*This is a comment.
This program is going to draw one to two to three on circles that move... yeah.
My dataset comes from http://www.census.gov/population/international/data/idb/worldpoptotal.php about world population by year since 1950 to 2050. Yes, they are predictions.
*/

//the array years for the data points year
int[] years = new int[101];
//the array pops for the data points population number
//No, I did not manually type them in.
//I used microsoft excel and word plus copy and pasting.
float [] pops = {
2.557628654,
2.594919657,
2.636732631,
2.681994386,
2.730149884,
2.782001154,
2.835182293,
2.891211793,
2.947979287,
3.000544325,
3.04282838,
3.083799968,
3.139919051,
3.209631895,
3.280981862,
3.350186115,
3.420416498,
3.490051163,
3.562007503,
3.6368258,
3.712338708,
3.789941225,
3.866158404,
3.941664971,
4.016159586,
4.088619689,
4.159715844,
4.231636519,
4.303675842,
4.378583227,
4.450924299,
4.533807914,
4.613830568,
4.694935057,
4.773643742,
4.855387634,
4.939332441,
5.025796394,
5.113007284,
5.199760484,
5.287166778,
5.370142696,
5.455057523,
5.537583721,
5.618516091,
5.699516291,
5.779912412,
5.858582659,
5.936039484,
6.013121531,
6.089810661,
6.16658298,
6.243351444,
6.31982233,
6.396726866,
6.473525274,
6.551256997,
6.629668134,
6.708196774,
6.786381274,
6.863770931,
6.940712355,
7.017543964,
7.09521798,
7.172800105,
7.250104524,
7.327047197,
7.403533981,
7.479340547,
7.554324522,
7.628361509,
7.701503831,
7.773787217,
7.845094405,
7.915343988,
7.984471678,
8.052555718,
8.119653594,
8.185704067,
8.250680127,
8.314556118,
8.377397726,
8.439275616,
8.500179665,
8.560091213,
8.618975745,
8.676879132,
8.733854464,
8.789875606,
8.84491029,
8.898921851,
8.951939549,
9.003999017,
9.05506167,
9.10508346,
9.154029673,
9.201933427,
9.248825693,
9.294674737,
9.339454816,
9.383147855
};
//x and y start and ends for the graph
int xStart = 100;
int xEnd = 500;
int yStart = 500;
int yEnd = 100;
//to use for doing the drawData() frame by frame
int curData = 0;

//Going to start zero as 1940 and ending with 2100
float fiveZeroX = map(1950, 1940, 2060, xStart, xEnd);
float fiveZeroY = map(2.557628654, 0, 10, yStart, yEnd);

void setup()
{
  size(600, 600);
  //to assign values in the years array
  for (int arrayValue = 0; arrayValue<years.length; arrayValue++) {
    years[arrayValue] = arrayValue + 1950;
  }
  background(255);
  //Axis
  stroke(0);
  line(xStart, yEnd, xStart, yStart);
  line(xStart, yStart, xEnd, yStart);
  //Title
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("World Population Growth by Year", 300, 50);
  //Axis labels
}

void draw()
{
  frameRate(30);
  textSize(32);
  if(curData > 0)
  {
    fill(255);
    noStroke();
    String yearStringBefore = Integer.toString(years[curData-1]);
    text(yearStringBefore, width/2, height/2);
  }
  fill(128);
  String yearString = Integer.toString(years[curData]);
  text(yearString, width/2, height/2);
  drawData(years[curData], pops[curData]);
  curData += 1;
  if(curData >= 101)
  {
    noLoop();
  }
  textSize(32);
  fill(128);
  text(yearString, width/2, height/2);
}

void drawData(int year, float pop)
{
  float x = map(year, 1940, 2060, xStart, xEnd);
  float y = map(pop, 0, 10, yStart, yEnd);
  fill(100, 255, 150);
  stroke(0);
  ellipse(x, y, 10, 10);
}

void axisLabels(int year)
{
  
}
