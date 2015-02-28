
//Load Strings
//Different Vis Techniques
String[] lines;
int[] lineVals;
float xinc;
int border = 2;
int maxVal = 0;         //pie
int total;
int mode=1;

void setup()
{
  colorMode(HSB, 360, 100, 100);
  size(800, 300);
  //noStroke();
  smooth();
  lines = loadStrings("data.txt");
  //lines = loadStrings("http://www.mkontopoulos.com/wp-content/uploads/2011/07/data.txt");
  lineVals = new int[lines.length];

  for (int i=0; i<lineVals.length; i++)
  {
    lineVals[i] = int(lines[i]);  
    total += lineVals[i];        //pie
  }

  println(lineVals.length + " data items here");
  println("total: " + total);
  xinc = float(width)/lineVals.length;
}

void draw()
{
  background(50, 3, 97);

  if(mode==1)
    drawBars(lineVals);
  else if(mode==2)
    drawLineGraph(lineVals);
  else if(mode==3)
    drawPie(lineVals);
  else
    println(mode);
}

void drawBars(int[] vals)
{
  for (int i=0; i<vals.length; i++)
  {
    fill(vals[i]/2.0, 70, 80);
    float x = xinc*float(i);
    rect(x+border, height, xinc, -vals[i]);
  }
}

void drawLineGraph(int[] vals)
{
  float last_x = 0.0;
  float last_y = 0.0;

  for (int i=1; i<vals.length; i++)
  {
    stroke(vals[i]/2.0, 70, 80);
    float x = xinc*float(i);
    float y = height-vals[i];
    line(last_x, last_y, x, y);

    last_x = x;
    last_y = y;
  }
}

void drawPie(int[] vals)
{
  float lastAng = 0;

  for (int i = 0; i < vals.length; i++) {
    //normalize the value
    float norm_section = (float(vals[i]) / total);
    float section = norm_section * 360.0;  

    fill(vals[i]/2.0, 70, 80);
    arc(width/2, height/2, 300, 300, lastAng, lastAng+radians(section));
    lastAng += radians(section);
  }
}

void keyPressed()
{
  if (key=='1')
    mode=1;
  else if (key=='2')
    mode=2; 
  else if (key=='3')
    mode=3;
  else
    println(mode);
}


