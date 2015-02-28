

Table table;

Table loadClimateData(String site)
{
String raw[] = loadStrings(
"http://www.metoffice.gov.uk/"+
"pub/data/weather/uk/climate/stationdata/"+
site.toLowerCase()+
"data.txt");

//RAIN
//Starts a new table
Table climate = new Table();

//Removes all spaces and leaves data from column 5
String head[] = splitTokens(raw[5]);

//loops through colunm 5 and adds data
for (String h : head) climate.addColumn(h);

//Starts Data from line 7
raw = subset(raw, 7);
for (String r : raw )
{
  
//Adds row 
TableRow row = climate.addRow();
String data[] = splitTokens(r,"#* ");
for (int c=0 ; c<head.length ; c++)
row.setString(head[c], data[c]);
}
return climate;
}


  float mean(float data[])
{
return sum(data)/data.length;
}


  float sum(float data[])
{
float S=0;
for (float v : data) S+=v;
return S;
}


  float stddev(float data[])
{
return sqrt(variance(data));
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
distance[i] = abs(data[i]-m);
return distance;
}




