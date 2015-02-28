
float[] averageRainFall = new float [12];
float[] averageMaxTemp  = new float [12];
float[] averageMinTemp  = new float [12];

void setup()
{
  size(800,600);
  String url = URLforSite("Durham");

  println(url);

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

  //Rain Data
  String[] JanuaryRain = subsetValues(data, "mm", "1", "rain");
  float[] hoursrainJanuary = float(JanuaryRain);
  
  String[] FebruaryRain = subsetValues(data, "mm", "2", "rain");
  float[] hoursrainFebruary = float(FebruaryRain);
  
  String[] MarchRain = subsetValues(data, "mm", "3", "rain");
  float[] hoursrainMarch = float(MarchRain);

  String[] AprilRain = subsetValues(data, "mm", "4", "rain");
  float[] hoursrainApril = float(AprilRain);
  
  String[] MayRain = subsetValues(data, "mm", "5", "rain");
  float[] hoursrainMay = float(MayRain);
  
  String[] JuneRain = subsetValues(data, "mm", "6", "rain");
  float[] hoursrainJune = float(JuneRain);
  
  String[] JulyRain = subsetValues(data, "mm", "7", "rain");
  float[] hoursrainJuly = float(JulyRain);
  
  String[] AugustRain = subsetValues(data, "mm", "8", "rain");
  float[] hoursrainAugust = float(AugustRain);
  
  String[] SeptemberRain = subsetValues(data, "mm", "9", "rain");
  float[] hoursrainSeptember = float(SeptemberRain);
  
  String[] OctoberRain = subsetValues(data, "mm", "10", "rain");
  float[] hoursrainOctober = float(OctoberRain);
  
  String[] NovemberRain = subsetValues(data, "mm", "11", "rain");
  float[] hoursrainNovember = float(NovemberRain);
  
  String[] DecemberRain = subsetValues(data, "mm", "12", "rain");
  float[] hoursrainDecember = float(DecemberRain);
  
  //MaxTemp Data
  
  String[] JanuaryMaxTemp = subsetValues(data, "mm", "1", "tmax");
  float[] hoursMaxTempJanuary = float(JanuaryMaxTemp);
  
  String[] FebruaryMaxTemp = subsetValues(data, "mm", "2", "tmax");
  float[] hoursMaxTempFebruary = float(FebruaryMaxTemp);
  
  String[] MarchMaxTemp = subsetValues(data, "mm", "3", "tmax");
  float[] hoursMaxTempMarch = float(MarchMaxTemp);

  String[] AprilMaxTemp = subsetValues(data, "mm", "4", "tmax");
  float[] hoursMaxTempApril = float(AprilMaxTemp);
  
  String[] MayMaxTemp = subsetValues(data, "mm", "5", "tmax");
  float[] hoursMaxTempMay = float(MayMaxTemp);
  
  String[] JuneMaxTemp = subsetValues(data, "mm", "6", "tmax");
  float[] hoursMaxTempJune = float(JuneMaxTemp);
  
  String[] JulyMaxTemp = subsetValues(data, "mm", "7", "tmax");
  float[] hoursMaxTempJuly = float(JulyMaxTemp);
  
  String[] AugustMaxTemp = subsetValues(data, "mm", "8", "tmax");
  float[] hoursMaxTempAugust = float(AugustMaxTemp);
  
  String[] SeptemberMaxTemp = subsetValues(data, "mm", "9", "tmax");
  float[] hoursMaxTempSeptember = float(SeptemberMaxTemp);
  
  String[] OctoberMaxTemp = subsetValues(data, "mm", "10", "tmax");
  float[] hoursMaxTempOctober = float(OctoberMaxTemp);
  
  String[] NovemberMaxTemp = subsetValues(data, "mm", "11", "tmax");
  float[] hoursMaxTempNovember = float(NovemberMaxTemp);
  
  String[] DecemberMaxTemp = subsetValues(data, "mm", "12", "tmax");
  float[] hoursMaxTempDecember = float(DecemberMaxTemp);
  
  //MinTemp Data
  
  String[] JanuaryMinTemp = subsetValues(data, "mm", "1", "tmin");
  float[] hoursMinTempJanuary = float(JanuaryMinTemp);
  
  String[] FebruaryMinTemp = subsetValues(data, "mm", "2", "tmin");
  float[] hoursMinTempFebruary = float(FebruaryMinTemp);
  
  String[] MarchMinTemp = subsetValues(data, "mm", "3", "tmin");
  float[] hoursMinTempMarch = float(MarchMinTemp);

  String[] AprilMinTemp = subsetValues(data, "mm", "4", "tmin");
  float[] hoursMinTempApril = float(AprilMinTemp);
  
  String[] MayMinTemp = subsetValues(data, "mm", "5", "tmin");
  float[] hoursMinTempMay = float(MayMinTemp);
  
  String[] JuneMinTemp = subsetValues(data, "mm", "6", "tmin");
  float[] hoursMinTempJune = float(JuneMinTemp);
  
  String[] JulyMinTemp = subsetValues(data, "mm", "7", "tmin");
  float[] hoursMinTempJuly = float(JulyMinTemp);
  
  String[] AugustMinTemp = subsetValues(data, "mm", "8", "tmin");
  float[] hoursMinTempAugust = float(AugustMinTemp);
  
  String[] SeptemberMinTemp = subsetValues(data, "mm", "9", "tmin");
  float[] hoursMinTempSeptember = float(SeptemberMinTemp);
  
  String[] OctoberMinTemp = subsetValues(data, "mm", "10", "tmin");
  float[] hoursMinTempOctober = float(OctoberMinTemp);
  
  String[] NovemberMinTemp = subsetValues(data, "mm", "11", "tmin");
  float[] hoursMinTempNovember = float(NovemberMinTemp);
  
  String[] DecemberMinTemp = subsetValues(data, "mm", "12", "tmin");
  float[] hoursMinTempDecember = float(DecemberMinTemp);
  
  //Rain Print
  println("average" + mean(hoursrainJanuary));
  
  println("average" + mean(hoursrainFebruary));

  println("average" + mean(hoursrainMarch));
  
  println("average" + mean(hoursrainApril));
  
  println("average" + mean(hoursrainMay));

  println("average" + mean(hoursrainJune));
  
  println("average" + mean(hoursrainJuly));
  
  println("average" + mean(hoursrainAugust));
  
  println("average" + mean(hoursrainSeptember));
  
  println("average" + mean(hoursrainOctober));
  
  println("average" + mean(hoursrainNovember));
  
  println("average" + mean(hoursrainDecember));
  
  //MaxTemp Print
  println("average" + mean(hoursMaxTempJanuary));
  
  println("average" + mean(hoursMaxTempFebruary));

  println("average" + mean(hoursMaxTempMarch));
  
  println("average" + mean(hoursMaxTempApril));
  
  println("average" + mean(hoursMaxTempMay));

  println("average" + mean(hoursMaxTempJune));
  
  println("average" + mean(hoursMaxTempJuly));
  
  println("average" + mean(hoursMaxTempAugust));
  
  println("average" + mean(hoursMaxTempSeptember));
  
  println("average" + mean(hoursMaxTempOctober));
  
  println("average" + mean(hoursMaxTempNovember));
  
  println("average" + mean(hoursMaxTempDecember));
  
  //MinTemp Print
  println("average" + mean(hoursMaxTempJanuary));
  
  println("average" + mean(hoursMaxTempFebruary));

  println("average" + mean(hoursMaxTempMarch));
  
  println("average" + mean(hoursMaxTempApril));
  
  println("average" + mean(hoursMaxTempMay));

  println("average" + mean(hoursMaxTempJune));
  
  println("average" + mean(hoursMaxTempJuly));
  
  println("average" + mean(hoursMaxTempAugust));
  
  println("average" + mean(hoursMaxTempSeptember));
  
  println("average" + mean(hoursMaxTempOctober));
  
  println("average" + mean(hoursMaxTempNovember));
  
  println("average" + mean(hoursMaxTempDecember));
  
  //MinTemp Print
  
  println("average" + mean(hoursMinTempJanuary));
  
  println("average" + mean(hoursMinTempFebruary));

  println("average" + mean(hoursMinTempMarch));
  
  println("average" + mean(hoursMinTempApril));
  
  println("average" + mean(hoursMinTempMay));

  println("average" + mean(hoursMinTempJune));
  
  println("average" + mean(hoursMinTempJuly));
  
  println("average" + mean(hoursMinTempAugust));
  
  println("average" + mean(hoursMinTempSeptember));
  
  println("average" + mean(hoursMinTempOctober));
  
  println("average" + mean(hoursMinTempNovember));
  
  println("average" + mean(hoursMaxTempDecember));
  
  //AverageRainFall Plot
  
  averageRainFall[0] = mean(hoursrainJanuary);
  
  averageRainFall[1] = mean(hoursrainFebruary);
  
  averageRainFall[2] = mean(hoursrainMarch);
  
  averageRainFall[3] = mean(hoursrainApril);
  
  averageRainFall[4] = mean(hoursrainMay);
  
  averageRainFall[5] = mean(hoursrainJune);
  
  averageRainFall[6] = mean(hoursrainJuly);
  
  averageRainFall[7] = mean(hoursrainAugust);
  
  averageRainFall[8] = mean(hoursrainSeptember);
  
  averageRainFall[9] = mean(hoursrainOctober);
  
  averageRainFall[10] = mean(hoursrainNovember);
  
  averageRainFall[11] = mean(hoursrainDecember);
  
  //AverageMaxTemp Plot
  
  averageMaxTemp[0] = mean(hoursMaxTempJanuary);
  
  averageMaxTemp[1] = mean(hoursMaxTempFebruary);
  
  averageMaxTemp[2] = mean(hoursMaxTempMarch);
  
  averageMaxTemp[3] = mean(hoursMaxTempApril);
  
  averageMaxTemp[4] = mean(hoursMaxTempMay);
  
  averageMaxTemp[5] = mean(hoursMaxTempJune);
  
  averageMaxTemp[6] = mean(hoursMaxTempJuly);
  
  averageMaxTemp[7] = mean(hoursMaxTempAugust);
  
  averageMaxTemp[8] = mean(hoursMaxTempSeptember);
  
  averageMaxTemp[9] = mean(hoursMaxTempOctober);
  
  averageMaxTemp[10] = mean(hoursMaxTempNovember);
  
  averageMaxTemp[11] = mean(hoursMaxTempDecember);
  
  //MinTempAverage Plot
  
  averageMinTemp[0] = mean(hoursMinTempJanuary);
  
  averageMinTemp[1] = mean(hoursMinTempFebruary);
  
  averageMinTemp[2] = mean(hoursMinTempMarch);
  
  averageMinTemp[3] = mean(hoursMinTempApril);
  
  averageMinTemp[4] = mean(hoursMinTempMay);
  
  averageMinTemp[5] = mean(hoursMinTempJune);
  
  averageMinTemp[6] = mean(hoursMinTempJuly);
  
  averageMinTemp[7] = mean(hoursMinTempAugust);
  
  averageMinTemp[8] = mean(hoursMinTempSeptember);
  
  averageMinTemp[9] = mean(hoursMinTempOctober);
  
  averageMinTemp[10] = mean(hoursMinTempNovember);
  
  averageMinTemp[11] = mean(hoursMinTempDecember);

}

void draw()
{
  for(int i = 0; i < averageRainFall.length; i++)
  {
    fill(0,255,0);
    ellipse(20+i*40,300-averageRainFall[i]*2,10,10);
  }
  for(int i = 0; i < averageMaxTemp.length; i++)
  {
    fill(255,0,0);
    ellipse(20+i*40,300-averageMaxTemp[i]*3,10,10);
  }
  for(int i = 0; i < averageMinTemp.length; i++)
  {
    fill(0,0,255);
    ellipse(20+i*40,300-averageMinTemp[i]*3,10,10);
  }
}


/** Create a URL for a historical climite data file.
 *  This function takes a site name and creates a URL
 *  for the historical climate data file from the MetOffice.
 */
String URLforSite(String site)
{
  return "http://www.metoffice.gov.uk/"+
    "pub/data/weather/uk/climate/stationdata/"+
    site.toLowerCase()+
    "data.txt";
}
/** List of sites.
 *  An array of site names that the Met-Office holds
 *  historical climate data for.  These can be used with 
 *  "URLforSite"
 */
String[] sitelist = {
  "aberporth", "armagh", "ballypatrick", "bradford", 
  "braemar", "camborne", "cambridge", "cardiff", 
  "chivenor", "cwmystwyth", "dunstaffnage", "durham", 
  "eastbourne", "eskdalemuir", "heathrow", "hurn", 
  "lerwick", "leuchars", "lowestoft", "manston", 
  "nairn", "newtonrigg", "oxford", "paisley", 
  "ringway", "rossonwye", "shawbury", "sheffield", 
  "southampton", "stornoway", "suttonbonington", "tiree", 
  "valley", "waddington", "whitby", 
  "wickairport", "yeovilton"
};

float sum(float data[])
{
     float S=0;
     for (float v : data) S+=v;
     return S;
} 


float mean(float data[])
{
  return sum(data)/data.length;
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

/** Loads MetOffice historical climate data into a Table.
 *  The function takes a String array as returned from 
 *  "loadStrings" applied to the historical station data
 *  from the MetOffice.
 *
 *  The first 5 lines are skipped, the 6th is taken as the
 *  column headings in the table, then a row is skipped.
 *  The rest of the file is taken as the data.
 *  Some processing  of the data occurs:
 *    + the '#' and '*' suffixes on values are stripped
 *    + entries of "---" are replaced with "0"
 *  These changes mean that all the values are capable of being 
 *  converted into int or float data types.
 */
Table loadClimateData(String[] raw)
{
  Table climate = new Table();
  String head[] = splitTokens(raw[5]);
  for (String h : head) climate.addColumn(h);

  raw = subset(raw, 7);
  for (String r : raw ) {
    TableRow row = climate.addRow();
    String data[] = splitTokens(r, "#* ");
    for (int c=0 ; c<head.length ; c++) {
      row.setString(head[c], data[c].equals("---")?"0":data[c]);
    }
  }
  return climate;
}


/** Extracts a subset of data from a table.
 *  A set of rows is found matching a named field to a given value, 
 *  An array is collected of the values in a named field.
 *
 *  Example:
 *      subsetvalues(t, "module", "EN0371", "mark");
 *  finds the rows in table 't' where the column 'module' matches
 *  the value "EN0371", the values of the field 'mark' are 
 *  collected in the array to be returned.
 *
 *  The supplied parameters are
 *  @param tab a   Table containing the data
 *  @param select  The Field name to select the subset on
 *  @param value   The value of the 'select' field to match
 *  @param field   The field whose values are collected.
 *
 *  @return an array of Strings of the collected values
 */
String[] subsetValues(Table tab, String select, String value, String field)
{
  String[] data = new String[0];
  for (TableRow r : tab.findRows(value,select)) {
    data = append(data, r.getString(field));
  }
  return data;
}



