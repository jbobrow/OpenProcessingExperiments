
float[] averagerainfall = new float[12];
float[] avgMinTemp = new float[12];
float[] avgtmax = new float[12];

float[] januaryRainfall,februaryRainfall,marchRainfall,aprilRainfall,mayRainfall,juneRainfall,julyRainfall,augustRainfall,septemberRainfall,octRainfall,novemberRainfall,decemberRainfall;

float avgjanuaryRainfall,avgfebruaryRainfall,avgmarchRainfall,avgaprilRainfall,avgMayRainfall,avgjuneRainfall,avgjulyRainfall,avgaugustRainfall,avgseptemberRainfall,avgOctRainfall,avgnovemberRainfall,avgdecemberRainfall;


 

float[] januaryMinTemp,februaryMinTemp,marchMinTemp,aprilMinTemp,mayMinTemp,juneMinTemp,julyMinTemp,augustMinTemp,septemberMinTemp,octoberMinTemp,novemberMinTemp,decemberMinTemp;

float avgjanuaryMinTemp,avgfebruaryMinTemp,avgmarchMinTemp,avgaprilMinTemp,avgmayMinTemp,avgjuneMinTemp,avgjulyMinTemp,avgaugustMinTemp,avgseptemberMinTemp,avgoctoberMinTemp,avgnovemberMinTemp,avgdecemberMinTemp;


 

float[] januarytmax,februarytmax,marchtmax,apriltmax,maytmax,junetmax,julytmax,augustmaxTemp,septembertmax,octmaxTemp,novembertmax,decembertmax;


float avgjanuarytmax,avgfebruarytmax,avgmarchtmax,avgapriltmax,avgMaytmax,avgjunetmax,avgjulytmax,avgaugustmaxTemp,avgseptembertmax,avgOctmaxTemp,avgnovembertmax,avgdecembertmax;



String[] monthsofyear = {"January","February","March","April","May","June","July","August","September","October","November","December"};

 
void setup()
{
  size(800,700);

 
 println("Data Source");
  println(url);
   println(" ");
 
  String[] source = loadStrings(url);
  Table data = loadClimateData(source);
 
   

  String[] rainfallJan = subsetValues(data, "mm", "1", "rain");
  januaryRainfall = float(rainfallJan);
  avgjanuaryRainfall = mean(januaryRainfall);
   
  String[] rainfallFeb = subsetValues(data, "mm", "2", "rain");
  februaryRainfall = float(rainfallFeb);
  avgfebruaryRainfall = mean(februaryRainfall);
   

  String[] rainfallMar = subsetValues(data, "mm", "3", "rain");
  marchRainfall = float(rainfallMar);
  avgmarchRainfall = mean(marchRainfall);
  

  String[] rainfallApr = subsetValues(data, "mm", "4", "rain");
  aprilRainfall = float(rainfallApr);
  avgaprilRainfall = mean(aprilRainfall);
   

  String[] rainfallMay = subsetValues(data, "mm", "5", "rain");
  mayRainfall = float(rainfallMay);
  avgMayRainfall = mean(mayRainfall);

  String[] rainfallJun = subsetValues(data, "mm", "6", "rain");
  juneRainfall = float(rainfallJun);
  avgjuneRainfall = mean(juneRainfall);
   
 
  String[] rainfallJul = subsetValues(data, "mm", "7", "rain");
  julyRainfall = float(rainfallJul);
  avgjulyRainfall = mean(julyRainfall);
   

  String[] rainfallAug = subsetValues(data, "mm", "8", "rain");
  augustRainfall = float(rainfallAug);
  avgaugustRainfall = mean(augustRainfall);
   
  
  String[] rainfallSept = subsetValues(data, "mm", "9", "rain");
  septemberRainfall = float(rainfallSept);
  avgseptemberRainfall = mean(septemberRainfall);
   

  String[] rainfallOct = subsetValues(data, "mm", "10", "rain");
  octRainfall = float(rainfallOct);
  avgOctRainfall = mean(octRainfall);
   
  String[] rainfallNov = subsetValues(data, "mm", "11", "rain");
  novemberRainfall = float(rainfallNov);
  avgnovemberRainfall = mean(novemberRainfall);
   
  String[] rainfallDec = subsetValues(data, "mm", "12", "rain");
  decemberRainfall = float(rainfallDec);
  avgdecemberRainfall = mean(decemberRainfall);
 
  averagerainfall[0] = avgjanuaryRainfall;
  averagerainfall[1] = avgfebruaryRainfall;
  averagerainfall[2] = avgmarchRainfall;
  averagerainfall[3] = avgaprilRainfall;
  averagerainfall[4] = avgMayRainfall;
  averagerainfall[5] = avgjuneRainfall;
  averagerainfall[6] = avgjulyRainfall;
  averagerainfall[7] = avgaugustRainfall;
  averagerainfall[8] = avgseptemberRainfall;
  averagerainfall[9] = avgOctRainfall;
  averagerainfall[10] = avgnovemberRainfall;
  averagerainfall[11] = avgdecemberRainfall;

  String[] mintempjanuary = subsetValues(data, "mm", "1", "tmin");
  januaryMinTemp = float(mintempjanuary);
  avgjanuaryMinTemp = mean(januaryMinTemp);
   

  String[] mintempfebruary = subsetValues(data, "mm", "2", "tmin");
  februaryMinTemp = float(mintempfebruary);
  avgfebruaryMinTemp = mean(februaryMinTemp);
   

  String[] mintempmarch = subsetValues(data, "mm", "3", "tmin");
  marchMinTemp = float(mintempmarch);
  avgmarchMinTemp = mean(marchMinTemp);
   

  String[] mintempapril = subsetValues(data, "mm", "4", "tmin");
  aprilMinTemp = float(mintempapril);
  avgaprilMinTemp = mean(aprilMinTemp);
   

  String[] minTempMay = subsetValues(data, "mm", "5", "tmin");
  mayMinTemp = float(minTempMay);
  avgmayMinTemp = mean(mayMinTemp);
   

  String[] mintempjune = subsetValues(data, "mm", "6", "tmin");
  juneMinTemp = float(mintempjune);
  avgjuneMinTemp = mean(juneMinTemp);
   

  String[] mintempjuly = subsetValues(data, "mm", "7", "tmin");
  julyMinTemp = float(mintempjuly);
  avgjulyMinTemp = mean(julyMinTemp);
   

  String[] mintempaugust = subsetValues(data, "mm", "8", "tmin");
  augustMinTemp = float(mintempaugust);
  avgaugustMinTemp = mean(augustMinTemp);
   

  String[] mintempseptember = subsetValues(data, "mm", "9", "tmin");
  septemberMinTemp = float(mintempseptember);
  avgseptemberMinTemp = mean(septemberMinTemp);
   

  String[] mintempoctober = subsetValues(data, "mm", "10", "tmin");
  octoberMinTemp = float(mintempoctober);
  avgoctoberMinTemp = mean(octoberMinTemp);
   

  String[] mintempnovember = subsetValues(data, "mm", "11", "tmin");
  novemberMinTemp = float(mintempnovember);
  avgnovemberMinTemp = mean(novemberMinTemp);
   

  String[] mintempdecember = subsetValues(data, "mm", "12", "tmin");
  decemberMinTemp = float(mintempdecember);
  avgdecemberMinTemp = mean(decemberMinTemp);
   
  avgMinTemp[0] = avgjanuaryMinTemp;
  avgMinTemp[1] = avgfebruaryMinTemp;
  avgMinTemp[2] = avgmarchMinTemp;
  avgMinTemp[3] = avgaprilMinTemp;
  avgMinTemp[4] = avgmayMinTemp;
  avgMinTemp[5] = avgjuneMinTemp;
  avgMinTemp[6] = avgjulyMinTemp;
  avgMinTemp[7] = avgaugustMinTemp;
  avgMinTemp[8] = avgseptemberMinTemp;
  avgMinTemp[9] = avgoctoberMinTemp;
  avgMinTemp[10] = avgnovemberMinTemp;
  avgMinTemp[11] = avgdecemberMinTemp;
     

  String[] tmaxJan = subsetValues(data, "mm", "1", "tmax");
  januarytmax = float(tmaxJan);
  avgjanuarytmax = mean(januarytmax);
   

  String[] tmaxFeb = subsetValues(data, "mm", "2", "tmax");
  februarytmax = float(tmaxFeb);
  avgfebruarytmax = mean(februarytmax);
   

  String[] tmaxMar = subsetValues(data, "mm", "3", "tmax");
  marchtmax = float(tmaxMar);
  avgmarchtmax = mean(marchtmax);
   

  String[] tmaxApr = subsetValues(data, "mm", "4", "tmax");
  apriltmax = float(tmaxApr);
  avgapriltmax = mean(apriltmax);
   

  String[] tmaxMay = subsetValues(data, "mm", "5", "tmax");
  maytmax = float(tmaxMay);
  avgMaytmax = mean(maytmax);
   

  String[] tmaxJun = subsetValues(data, "mm", "6", "tmax");
  junetmax = float(tmaxJun);
  avgjunetmax = mean(junetmax);
   

  String[] tmaxJul = subsetValues(data, "mm", "7", "tmax");
  julytmax = float(tmaxJul);
  avgjulytmax = mean(julytmax);
   

  String[] tmaxAug = subsetValues(data, "mm", "8", "tmax");
  augustmaxTemp = float(tmaxAug);
  avgaugustmaxTemp = mean(augustmaxTemp);
   

  String[] tmaxSept = subsetValues(data, "mm", "9", "tmax");
  septembertmax = float(tmaxSept);
  avgseptembertmax = mean(septembertmax);
   

  String[] tmaxOct = subsetValues(data, "mm", "10", "tmax");
  octmaxTemp = float(tmaxOct);
  avgOctmaxTemp = mean(octmaxTemp);
   

  String[] tmaxNov = subsetValues(data, "mm", "11", "tmax");
  novembertmax = float(tmaxNov);
  avgnovembertmax = mean(novembertmax);
   

  String[] tmaxDec = subsetValues(data, "mm", "12", "tmax");
  decembertmax = float(tmaxDec);
  avgdecembertmax = mean(decembertmax);
   
  avgtmax[0] = avgjanuarytmax;
  avgtmax[1] = avgfebruarytmax;
  avgtmax[2] = avgmarchtmax;
  avgtmax[3] = avgapriltmax;
  avgtmax[4] = avgMaytmax;
  avgtmax[5] = avgjunetmax;
  avgtmax[6] = avgjulytmax;
  avgtmax[7] = avgaugustmaxTemp;
  avgtmax[8] = avgseptembertmax;
  avgtmax[9] = avgOctmaxTemp;
  avgtmax[10] = avgnovembertmax;
  avgtmax[11] = avgdecembertmax;
   
 

}
 
void draw()
{
 background(255, 204, 0);
   
  stroke(200);
  strokeWeight(1);
  fill(0);
  for(int i = 0; i <monthsofyear.length; i++)
  {
    text(monthsofyear[i],20+(i*60),640);
  }
  
    stroke(180);
  strokeWeight(1);
  fill(0);
  for(int i = 0; i <monthsofyear.length; i++)
  {
    text(monthsofyear[i],20+(i*60),440);
  }
  
    for(int i = 0; i <monthsofyear.length; i++)
  {
    text(monthsofyear[i],20+(i*60),240);
  }
  
    
  for (int i = 0; i < 800; i = i+45) {
  line(i, 0, i, 620);
}
 
  
  
  for (int i = 0; i < 800; i = i+10) {
  line(0, i, width, i);
}
  
  stroke(0);
  strokeWeight(2);
  noFill();
 line(0, 220, width, 220);
    line(0, 420, width, 420);
 line(0, 620, width, 620);
   
  fill(0);
  text("Average rainfall for year",340,200);
  text("Average minimum temperature for year",300,400);
  text("Average maximum temperature for year",300,600);
   

  for(int i = 0; i < averagerainfall.length; i++)
  {
    pushMatrix();
    translate(40+i*60,200-averagerainfall[i]*2);
      rect(0,0,4,1);
    text(averagerainfall[i],10,0);
    popMatrix();
  }
 
  for(int i = 0; i < avgMinTemp.length; i++)
  {
    pushMatrix();
    translate(40+i*60,400-avgMinTemp[i]*8);
  rect(0,0,4,1);
    text(avgMinTemp[i],10,0);
    popMatrix();
  }
 
  for(int i = 0; i < avgtmax.length; i++)
  {
    pushMatrix();
    translate(40+i*60,600-avgtmax[i]*4);
       rect(0,0,4,1);
    text(avgtmax[i],10,0);
    popMatrix();
  }
  



 
}
/** Create a URL for a historical climite data file.
 *  This function takes a site name and creates a URL
 *  for the historical climate data file from the MetOffice.
 */
 
String url = URLforSite("Durham");
 
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
 
float mean(float data[])
{
  return sum(data) / data.length;
}
 
float sum(float data[])
{
  float S = 0;
  for(float v : data) S += v;
  return S;
}
 
float stddev(float data[])
{
  return sqrt(variance(data));
}
 
float variance(float data[])
{
  return mean(sq(distance(data,mean(data))));
}
 
float[] sq(float data[])
{
  float x[] = new float[data.length];
  for(int i = 0; i < data.length; i++)
  {
    x[i] = sq(data[i]);
  }
  return x;
}
 
float[] distance(float data[], float m)
{
  float distance[] = new float[data.length];
  for(int i = 0; i < data.length; i++)
  {
    distance[i] = abs(data[i]-m);
  }
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

