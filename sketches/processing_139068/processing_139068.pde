
Table data;

float[] getDayData(String day, String value)
{
  float[] values = new float[0];
  for ( TableRow r : data.findRows(day, "day"))
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

String[] week = {
  "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"
};
float[] means = new float[5];
float[] maxes = new float[5];
float[] mins  = new float[5];
float low,high;
float floor(float n, float s) { return floor(n/s)*s; }
float  ceil(float n, float s) { return ceil(n/s)*s; }

void setup()
{
  data = loadTable("ftseday.csv", "header, tsv");
  for (int d=0 ; d<week.length ; d++){
    means[d] = mean(getDayData(week[d], "open"));
    maxes[d] = max(getDayData(week[d], "high"));
    mins[d] = min(getDayData(week[d], "low"));
  }
  low = floor(min(mins),1000);
  high = ceil(max(maxes),1000);
}
float barheight(float val)
{
  return map(val,low,high, height,0);
}
void draw()
{
  for(int d=0 ; d<week.length ; d++)
  {
    rect(d*20,0,20,barheight(means[d]));
  }
}



