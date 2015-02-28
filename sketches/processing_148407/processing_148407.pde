
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

void setup()

{

  size(460, 435);

  background(255);

  fill(0,0,0);


  weather= loadRainfallData();

  int count = 0;

  for (int i = 1; i < weather.getRowCount(); i++)

  {

    TableRow r = weather.getRow(i);

    int month = r.getInt("mm");

    float Tmin = r.getFloat("tmin");

    if (tempMin[month - 1] > Tmin || i < 12)

      tempMin[month - 1] = Tmin;

    float Tmax = r.getFloat("tmax");

    if (tempMax[month - 1] < Tmax || i < 12)

      tempMax[month - 1] = Tmax;

    count++;

  }
 count /= 6;

  for (int i = 0; i < 12; i++)

   
  {

    text(tempMin[i], 50, (i * 15) + 15); 

    text(tempMax[i], 50, (i * 15) + 210); 
 
  }

line (100, 150, 430, 150);

line (100, 345, 430, 345);

text("Minimum", 200, 15);

text("Maximum", 200, 210);

for (int i = 0; i < 11; i++)
  {
line((30 * i) + 100 , 150 - (tempMin[i] * 4), (30 * i) + 130, 150 - (tempMin[i + 1] * 4));
line((30 * i) + 100 , 345 - (tempMax[i] * 4), (30 * i) + 130, 345 - (tempMax[i + 1] * 4));
   
  }
}


