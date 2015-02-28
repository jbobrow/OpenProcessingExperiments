
float[] avgrainfall = new float[12];
float[] avgmaxtemp = new float[12];
float[] avgmintemp = new float[12];

void setup()
{
  size(700,400);
  String url = URLforSite("Durham");

  println(url);

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

  //rainfall
  String[] janrainstring = subsetValues(data, "mm", "1", "rain");
  float[] janrain = float(janrainstring);
  float avgjanrain = mean(janrain);
  println(avgjanrain);
  
  String[] febrainstring = subsetValues(data, "mm", "2", "rain");
  float[] febrain = float(febrainstring);
  float avgfebrain = mean(febrain);
  println(avgfebrain);
  
  String[] marrainstring = subsetValues(data, "mm", "3", "rain");
  float[] marrain = float(marrainstring);
  float avgmarrain = mean(marrain);
  println(avgmarrain);
  
  String[] aprrainstring = subsetValues(data, "mm", "4", "rain");
  float[] aprrain = float(aprrainstring);
  float avgaprrain = mean(aprrain);
  println(avgaprrain);
  
  String[] mayrainstring = subsetValues(data, "mm", "5", "rain");
  float[] mayrain = float(mayrainstring);
  float avgmayrain = mean(mayrain);
  println(avgmayrain);
  
  String[] junrainstring = subsetValues(data, "mm", "6", "rain");
  float[] junrain = float(junrainstring);
  float avgjunrain = mean(junrain);
  println(avgjunrain);
  
  String[] julrainstring = subsetValues(data, "mm", "7", "rain");
  float[] julrain = float(julrainstring);
  float avgjulrain = mean(julrain);
  println(avgjulrain);
  
  String[] augrainstring = subsetValues(data, "mm", "8", "rain");
  float[] augrain = float(augrainstring);
  float avgaugrain = mean(augrain);
  println(avgaugrain);
  
  String[] seprainstring = subsetValues(data, "mm", "9", "rain");
  float[] seprain = float(seprainstring);
  float avgseprain = mean(seprain);
  println(avgseprain);
  
  String[] octrainstring = subsetValues(data, "mm", "10", "rain");
  float[] octrain = float(octrainstring);
  float avgoctrain = mean(octrain);
  println(avgoctrain);
  
  String[] novrainstring = subsetValues(data, "mm", "11", "rain");
  float[] novrain = float(novrainstring);
  float avgnovrain = mean(novrain);
  println(avgnovrain);
  
  String[] decrainstring = subsetValues(data, "mm", "12", "rain");
  float[] decrain = float(decrainstring);
  float avgdecrain = mean(decrain);
  println(avgdecrain);
  
  //maxtemp
  String[] janmaxstring = subsetValues(data, "mm", "1", "tmax");
  float[] janmax = float(janmaxstring);
  float avgjanmax = mean(janmax);
  println(avgjanmax);
  
  String[] febmaxstring = subsetValues(data, "mm", "2", "tmax");
  float[] febmax = float(febmaxstring);
  float avgfebmax = mean(febmax);
  println(avgfebmax);
  
  String[] marmaxstring = subsetValues(data, "mm", "3", "tmax");
  float[] marmax = float(marmaxstring);
  float avgmarmax = mean(marmax);
  println(avgmarmax);
  
  String[] aprmaxstring = subsetValues(data, "mm", "4", "tmax");
  float[] aprmax = float(aprmaxstring);
  float avgaprmax = mean(aprmax);
  println(avgaprmax);
  
  String[] maymaxstring = subsetValues(data, "mm", "5", "tmax");
  float[] maymax = float(maymaxstring);
  float avgmaymax = mean(maymax);
  println(avgmaymax);
  
  String[] junmaxstring = subsetValues(data, "mm", "6", "tmax");
  float[] junmax = float(junmaxstring);
  float avgjunmax = mean(junmax);
  println(avgjunmax);
  
  String[] julmaxstring = subsetValues(data, "mm", "7", "tmax");
  float[] julmax = float(julmaxstring);
  float avgjulmax = mean(julmax);
  println(avgjulmax);
  
  String[] augmaxstring = subsetValues(data, "mm", "8", "tmax");
  float[] augmax = float(augmaxstring);
  float avgaugmax = mean(augmax);
  println(avgaugmax);
  
  String[] sepmaxstring = subsetValues(data, "mm", "9", "tmax");
  float[] sepmax = float(sepmaxstring);
  float avgsepmax = mean(sepmax);
  println(avgsepmax);
  
  String[] octmaxstring = subsetValues(data, "mm", "10", "tmax");
  float[] octmax = float(octmaxstring);
  float avgoctmax = mean(octmax);
  println(avgoctmax);
  
  String[] novmaxstring = subsetValues(data, "mm", "11", "tmax");
  float[] novmax = float(novmaxstring);
  float avgnovmax = mean(novmax);
  println(avgnovmax);
  
  String[] decmaxstring = subsetValues(data, "mm", "12", "tmax");
  float[] decmax = float(decmaxstring);
  float avgdecmax = mean(decmax);
  println(avgdecmax);
  
  //mintemp
    String[] janminstring = subsetValues(data, "mm", "1", "tmin");
  float[] janmin = float(janminstring);
  float avgjanmin = mean(janmin);
  println(avgjanmin);
  
  String[] febminstring = subsetValues(data, "mm", "2", "tmin");
  float[] febmin = float(febminstring);
  float avgfebmin = mean(febmin);
  println(avgfebmin);
  
  String[] marminstring = subsetValues(data, "mm", "3", "tmin");
  float[] marmin = float(marminstring);
  float avgmarmin = mean(marmin);
  println(avgmarmin);
  
  String[] aprminstring = subsetValues(data, "mm", "4", "tmin");
  float[] aprmin = float(aprminstring);
  float avgaprmin = mean(aprmin);
  println(avgaprmin);
  
  String[] mayminstring = subsetValues(data, "mm", "5", "tmin");
  float[] maymin = float(mayminstring);
  float avgmaymin = mean(maymin);
  println(avgmaymin);
  
  String[] junminstring = subsetValues(data, "mm", "6", "tmin");
  float[] junmin = float(junminstring);
  float avgjunmin = mean(junmin);
  println(avgjunmin);
  
  String[] julminstring = subsetValues(data, "mm", "7", "tmin");
  float[] julmin = float(julminstring);
  float avgjulmin = mean(julmin);
  println(avgjulmin);
  
  String[] augminstring = subsetValues(data, "mm", "8", "tmin");
  float[] augmin = float(augminstring);
  float avgaugmin = mean(augmin);
  println(avgaugmin);
  
  String[] sepminstring = subsetValues(data, "mm", "9", "tmin");
  float[] sepmin = float(sepminstring);
  float avgsepmin = mean(sepmin);
  println(avgsepmin);
  
  String[] octminstring = subsetValues(data, "mm", "10", "tmin");
  float[] octmin = float(octminstring);
  float avgoctmin = mean(octmin);
  println(avgoctmin);
  
  String[] novminstring = subsetValues(data, "mm", "11", "tmin");
  float[] novmin = float(novminstring);
  float avgnovmin = mean(novmin);
  println(avgnovmin);
  
  String[] decminstring = subsetValues(data, "mm", "12", "tmin");
  float[] decmin = float(decminstring);
  float avgdecmin = mean(decmin);
  println(avgdecmin);
  
  avgrainfall[0] = avgjanrain;
  avgrainfall[1] = avgfebrain;
  avgrainfall[2] = avgmarrain;
  avgrainfall[3] = avgaprrain;
  avgrainfall[4] = avgmayrain;
  avgrainfall[5] = avgjunrain;
  avgrainfall[6] = avgjulrain;
  avgrainfall[7] = avgaugrain;
  avgrainfall[8] = avgseprain;
  avgrainfall[9] = avgoctrain;
  avgrainfall[10] = avgnovrain;
  avgrainfall[11] = avgdecrain;
  
  avgmaxtemp[0] = avgjanmax;
  avgmaxtemp[1] = avgfebmax;
  avgmaxtemp[2] = avgmarmax;
  avgmaxtemp[3] = avgaprmax;
  avgmaxtemp[4] = avgmaymax;
  avgmaxtemp[5] = avgjunmax;
  avgmaxtemp[6] = avgjulmax;
  avgmaxtemp[7] = avgaugmax;
  avgmaxtemp[8] = avgsepmax;
  avgmaxtemp[9] = avgoctmax;
  avgmaxtemp[10] = avgnovmax;
  avgmaxtemp[11] = avgdecmax;
  
  avgmintemp[0] = avgjanmin;
  avgmintemp[1] = avgfebmin;
  avgmintemp[2] = avgmarmin;
  avgmintemp[3] = avgaprmin;
  avgmintemp[4] = avgmaymin;
  avgmintemp[5] = avgjunmin;
  avgmintemp[6] = avgjulmin;
  avgmintemp[7] = avgaugmin;
  avgmintemp[8] = avgsepmin;
  avgmintemp[9] = avgoctmin;
  avgmintemp[10] = avgnovmin;
  avgmintemp[11] = avgdecmin;
  
  
}


void draw()
{
  for(int i = 0; i < avgrainfall.length; i++)
  {
    fill(0,0,200);
    ellipse(20+i*50,300-avgrainfall[i]*2,5,5);
  }
  
  for(int i = 0; i < avgmaxtemp.length; i++)
  {
    fill(200,0,0);
    ellipse(20+i*50,300-avgmaxtemp[i]*2,5,5);
  }
  
  for(int i = 0; i < avgmintemp.length; i++)
  {
    fill(0,200,0);
    ellipse(20+i*50,300-avgmintemp[i]*2,5,5);
  }
  
  //key :: rain = blue :: maxtemp = red :: mintemp = green
  
}


float sum(float data[])
{
  float S = 0;
  for(float n : data) S += n;
  return S;
}

float mean(float data[])
{
  return sum(data)/data.length;
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



