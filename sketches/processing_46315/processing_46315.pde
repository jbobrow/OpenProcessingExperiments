
//Load Strings
//Different Vis Techniques
String[] age, response;
int[] ageVals, responseVals, gamerVals;
float xinc;
int border = 2;
int maxVal = 0;         //pie
int total;
int mode=1;
 
void setup()
{
  colorMode(HSB, 360, 100, 100);
  size(800, 300);
  noStroke();
  smooth();
  age = loadStrings("age.txt");
  response = loadStrings("response.txt");
  gamerVals = int(loadStrings("gamer.txt"));
  //age = loadStrings("http://www.mkontopoulos.com/wp-content/uploads/2011/07/data.txt");
  ageVals = new int[age.length];
  responseVals = new int[response.length];
 
  for (int i=0; i<ageVals.length; i++)
  {
    for(int j=0; j<responseVals.length; j++)
    {
    ageVals[i] = int(age[i]); 
    responseVals[j] = int(response[j]);
    total += ageVals[i];        //pie
    }
  }
 
  println(ageVals.length + " data items here");
  println("total: " + total);
  xinc = float(width)/ageVals.length;
}
 
void draw()
{
  background(50, 3, 0);
 
 drawBars(ageVals, gamerVals, responseVals);
//  if(mode==1)
//    drawBars(ageVals, gamerVals, responseVals);
//  else if(mode==2)
//    drawLineGraph(ageVals);
//  else if(mode==3)
//    drawPie(ageVals);
//  else
//    println(mode);
}
 
void drawBars(int[] vals, int[] vals2, int[] vals3)
{
  for (int i=0; i<vals.length; i++)
  {
    for(int j=0; j<vals2.length; j++)
    {
      for(int k=0; k<vals3.length; k++)
      {
    fill(vals3[i]*50, 70, 80);
    float x = xinc*float(i);
    rect(x+border, height, vals2[i]*5, -vals[i]*2);
      }
    }
  }
}
 
//void drawLineGraph(int[] vals)
//{
//  float last_x = 0.0;
//  float last_y = 0.0;
// 
//  for (int i=1; i<vals.length; i++)
//  {
//    stroke(vals[i]/2.0, 70, 80);
//    float x = xinc*float(i);
//    float y = height-vals[i];
//    line(last_x, last_y, x, y);
// 
//    last_x = x;
//    last_y = y;
//  }
//}
// 
//void drawPie(int[] vals)
//{
//  float lastAng = 0;
// 
//  for (int i = 0; i < vals.length; i++) {
//    //normalize the value
//    float norm_section = (float(vals[i]) / total);
//    float section = norm_section * 360.0; 
// 
//    fill(vals[i]/2.0, 70, 80);
//    arc(width/2, height/2, 300, 300, lastAng, lastAng+radians(section));
//    lastAng += radians(section);
//  }
//}
// 
//void keyPressed()
//{
//  if (key=='1')
//    mode=1;
//  else if (key=='2')
//    mode=2;
//  else if (key=='3')
//    mode=3;
//  else
//    println(mode);
//}


