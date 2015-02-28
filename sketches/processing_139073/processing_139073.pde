
Table loadRainfallData()
{
  String raw[] = loadStrings("durhamdata.txt");
  Table climate  = new Table();
  
  String head[] = splitTokens(raw[5]);
  for (String h : head) 
    climate.addColumn(h);

  raw = subset(raw, 7);
  for (String r : raw )
  {
    TableRow row = climate.addRow();
    String data[] = splitTokens(r, "#* ");
    for ( int c=0 ;  c<head.length ;  c++)
      row.setString(head[c], data[c]);
  }
  return climate;
}

Table weather; 
float[]tempMin = new float[12];
float[]tempMax = new float[12];
float[]tempAverage = new float[12];
String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

void setup()
{
  size(440, 580);
  background(255);
  fill(0,0,0);
  weather= loadRainfallData();
  
  int count = 0;
  for (int i = 1; i < weather.getRowCount(); i++)
  {
    TableRow r = weather.getRow(i);
    int month = r.getInt("mm");
    
    //Gets the min temp in the row.
    float Tmin = r.getFloat("tmin");
    //Only replaces if the number is small 
    if (tempMin[month - 1] > Tmin || i < 12)
      tempMin[month - 1] = Tmin;
    //Gets the max temp in the row.
    float Tmax = r.getFloat("tmax");
    if (tempMax[month - 1] < Tmax || i < 12)
      tempMax[month - 1] = Tmax;
    //Gets the arerage temp for each month.
    if (Tmax > -1000 && Tmin> -1000)
      tempAverage[month - 1] += Tmax + Tmin;
    count++;
  }
  count /= 6;
  for (int i = 0; i < 12; i++)
    tempAverage[i] /= count;
  
  //Text
  for (int i = 0; i < 12; i++)
  {
   //Displays the list of min values.
   text(tempMin[i], 50, (i * 15) + 15); 
   text(months[i], 10, (i * 15) + 15); 
   
   //Displayes the list of max values.
   text(tempMax[i], 50, (i * 15) + 210); 
   text(months[i], 10, (i * 15) + 210); 
   
   //Displays the list of average values.
   text(tempAverage[i], 50, (i * 15) + 405); 
   text(months[i], 10, (i * 15) + 405);    
  }
  
  //Graphs.
  line (100, 150, 430, 150);
  line (100, 345, 430, 345);
  line (100, 540, 430, 540);
  text("Minimum", 200, 15);
  text("Maximum", 200, 210);
  text("Average", 200, 405);
  for (int i = 0; i < 11; i++)
  {
   line((30 * i) + 100 , 150 - (tempMin[i] * 4), (30 * i) + 130, 150 - (tempMin[i + 1] * 4));
   line((30 * i) + 100 , 345 - (tempMax[i] * 4), (30 * i) + 130, 345 - (tempMax[i + 1] * 4));
   line((30 * i) + 100 , 540 - (tempAverage[i] * 4), (30 * i) + 130, 540 - (tempAverage[i + 1] * 4));
  }
}

