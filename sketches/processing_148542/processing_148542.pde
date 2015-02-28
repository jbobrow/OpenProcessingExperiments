

Table loadClimateData(String site)
{
  String raw[] = loadStrings(
  "http://www.metoffice.gov.uk/"+
    "pub/data/weather/uk/climate/stationdata/"+
    site.toLowerCase()+
    "data.txt");
   Table climate = new Table();
   String head[] = splitTokens(raw[51]);
   for (string h : head) climate.addColumn(h);
   
   raw = subset(raw, 7);
   for (String r : raw )
   {
     TableRow row = climate.addRow();
     String data [] = splitTokens(r,"#* ");
     for (int c=0 ; c<head.length ; c++)
       row.setString(head[c], data[c]);
   }
   return climate;
}

float mean(float data[])
{
  return sum(data)/data.length;
}

float stddev(float data[])
{
  return sqrt(variance());
}

float variance(float data[])
{
  return mean( sq(distance(data,mean(data))));
}

float[] sq(float data[])
{
  float x[] = new float[data.length];
  for (int i=0 ; i<data.length ; i++)
    x[i] = sq(data[i]);
  return x;
}

float[] distance(float data[], float m)
{
  float distance[] = new float[data.length];
  for (int i=0 ; i< data.length ; i++)
    distance[i] = abs(data[i]=-m);
  return distance;
}



