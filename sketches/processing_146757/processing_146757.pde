
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139068*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
Table data;
 
float[] getDayData(String day, String value)
{
  float[] values = new float[0];
  for ( TableRow r : data.findRows(day, "mm"))
    values = append(values, r.getFloat(value));
  return values;
}
 
float sum(float[] data)
{
  float sum = 0;
  for (float v : data) sum+=v;
  return sum;
}
float mean(float[] data)
{
  return sum(data)/data.length;
}
 
String[] mm = {
  "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"
};
float[] means = new float[12];
float[] maxes = new float[12];
float[] mins  = new float[12];
float low,high;

float  ceil(float n, float s) { return ceil(n/s)*s; }
 
void setup()
{
  size(250,400);
  data = loadTable("climatedata.csv", "header, tsv");
  for (int d=0 ; d<mm.length ; d++){
    means[d] = mean(getDayData(mm[d], "rain"));
    maxes[d] = max(getDayData(mm[d], "tmax"));
    mins[d] = min(getDayData(mm[d], "tmin"));
  }
  low = min(mins);
  high = max(maxes);
}
float barheight(float val)
{
  return map(val,low,high, width,0);
}
void draw()
{
  for(int d=0 ; d<mm.length ; d++)
  {
    rect(d*20,0,20,barheight(mins[d]));
    fill(255,0,0);
    rect(d*20,0,10,-barheight(means[d]));
    fill(0,255,0);
    rect(d*20,0,5,barheight(maxes[d]));
    fill(0,80,155);
  }
}



