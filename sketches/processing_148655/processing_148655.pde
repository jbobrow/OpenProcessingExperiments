
float[] avgrainfall = new float[12];
float[] avgmaxtemp = new float[12];
float[] avgmintemp = new float[12];

void setup()
{
  size(670,480);
  String url = URLforSite("Durham");

  println(url);

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

  String[] Janrainstring = subsetValues(data, "mm", "1", "rain");
  float[] Janrain = float(Janrainstring);
  float avgJanrain = mean(Janrain);
  println(avgJanrain);
  
  String[] Febrainstring = subsetValues(data, "mm", "2", "rain");
  float[] Febrain = float(Febrainstring);
  float avgFebrain = mean(Febrain);
  println(avgFebrain);

  String[] Marrainstring = subsetValues(data, "mm", "3", "rain");
  float[] Marrain = float(Marrainstring);
  float avgMarrain = mean(Marrain);
  println(avgMarrain);

  String[] Aprrainstring = subsetValues(data, "mm", "4", "rain");
  float[] Aprrain = float(Aprrainstring);
  float avgAprrain = mean(Aprrain);
  println(avgAprrain);
  
  String[] Mayrainstring = subsetValues(data, "mm", "5", "rain");
  float[] Mayrain = float(Mayrainstring);
  float avgMayrain = mean(Mayrain);
  println(avgMayrain);

  String[] Junrainstring = subsetValues(data, "mm", "6", "rain");
  float[] Junrain = float(Junrainstring);
  float avgJunrain = mean(Junrain);
  println(avgJunrain);
  
  String[] Julrainstring = subsetValues(data, "mm", "7", "rain");
  float[] Julrain = float(Julrainstring);
  float avgJulrain = mean(Julrain);
  println(avgJulrain);
  
  String[] Augrainstring = subsetValues(data, "mm", "8", "rain");
  float[] Augrain = float(Augrainstring);
  float avgAugrain = mean(Augrain);
  println(avgAugrain);
  
  String[] Seprainstring = subsetValues(data, "mm", "9", "rain");
  float[] Seprain = float(Seprainstring);
  float avgSeprain = mean(Seprain);
  println(avgSeprain);
  
  String[] Octrainstring = subsetValues(data, "mm", "10", "rain");
  float[] Octrain = float(Octrainstring);
  float avgOctrain = mean(Octrain);
  println(avgOctrain);
  
  String[] Novrainstring = subsetValues(data, "mm", "11", "rain");
  float[] Novrain = float(Novrainstring);
  float avgNovrain = mean(Novrain);
  println(avgNovrain);
  
  String[] Decrainstring = subsetValues(data, "mm", "12", "rain");
  float[] Decrain = float(Decrainstring);
  float avgDecrain = mean(Decrain);
  println(avgDecrain);

  String[] Jantmaxstring = subsetValues(data, "mm", "1", "tmax");
  float[] Jantmax = float(Jantmaxstring);
  float avgJantmax = mean(Jantmax);
  println(avgJantmax);
  
  String[] Febtmaxstring = subsetValues(data, "mm", "2", "tmax");
  float[] Febtmax = float(Febtmaxstring);
  float avgFebtmax = mean(Febtmax);
  println(avgFebtmax);

  String[] Martmaxstring = subsetValues(data, "mm", "3", "tmax");
  float[] Martmax = float(Martmaxstring);
  float avgMartmax = mean(Martmax);
  println(avgMartmax);

  String[] Aprtmaxstring = subsetValues(data, "mm", "4", "tmax");
  float[] Aprtmax = float(Aprtmaxstring);
  float avgAprtmax = mean(Aprtmax);
  println(avgAprtmax);
  
  String[] Maytmaxstring = subsetValues(data, "mm", "5", "tmax");
  float[] Maytmax = float(Maytmaxstring);
  float avgMaytmax = mean(Maytmax);
  println(avgMaytmax);

  String[] Juntmaxstring = subsetValues(data, "mm", "6", "tmax");
  float[] Juntmax = float(Juntmaxstring);
  float avgJuntmax = mean(Juntmax);
  println(avgJuntmax);
  
  String[] Jultmaxstring = subsetValues(data, "mm", "7", "tmax");
  float[] Jultmax = float(Jultmaxstring);
  float avgJultmax = mean(Jultmax);
  println(avgJultmax);
  
  String[] Augtmaxstring = subsetValues(data, "mm", "8", "tmax");
  float[] Augtmax = float(Augtmaxstring);
  float avgAugtmax = mean(Augtmax);
  println(avgAugtmax);
  
  String[] Septmaxstring = subsetValues(data, "mm", "9", "tmax");
  float[] Septmax = float(Septmaxstring);
  float avgSeptmax = mean(Septmax);
  println(avgSeptmax);
  
  String[] Octtmaxstring = subsetValues(data, "mm", "10", "tmax");
  float[] Octtmax = float(Octtmaxstring);
  float avgOcttmax = mean(Octtmax);
  println(avgOcttmax);
  
  String[] Novtmaxstring = subsetValues(data, "mm", "11", "tmax");
  float[] Novtmax = float(Novtmaxstring);
  float avgNovtmax = mean(Novtmax);
  println(avgNovtmax);
  
  String[] Dectmaxstring = subsetValues(data, "mm", "12", "tmax");
  float[] Dectmax = float(Dectmaxstring);
  float avgDectmax = mean(Dectmax);
  println(avgDectmax);
  
  String[] Jantminstring = subsetValues(data, "mm", "1", "tmin");
  float[] Jantmin = float(Jantminstring);
  float avgJantmin = mean(Jantmin);
  println(avgJantmin);
  
  String[] Febtminstring = subsetValues(data, "mm", "2", "tmin");
  float[] Febtmin = float(Febtminstring);
  float avgFebtmin = mean(Febtmin);
  println(avgFebtmin);

  String[] Martminstring = subsetValues(data, "mm", "3", "tmin");
  float[] Martmin = float(Martminstring);
  float avgMartmin = mean(Martmin);
  println(avgMartmin);

  String[] Aprtminstring = subsetValues(data, "mm", "4", "tmin");
  float[] Aprtmin = float(Aprtminstring);
  float avgAprtmin = mean(Aprtmin);
  println(avgAprtmin);
  
  String[] Maytminstring = subsetValues(data, "mm", "5", "tmin");
  float[] Maytmin = float(Maytminstring);
  float avgMaytmin = mean(Maytmin);
  println(avgMaytmin);

  String[] Juntminstring = subsetValues(data, "mm", "6", "tmin");
  float[] Juntmin = float(Juntminstring);
  float avgJuntmin = mean(Juntmin);
  println(avgJuntmin);
  
  String[] Jultminstring = subsetValues(data, "mm", "7", "tmin");
  float[] Jultmin = float(Jultminstring);
  float avgJultmin = mean(Jultmin);
  println(avgJultmin);
  
  String[] Augtminstring = subsetValues(data, "mm", "8", "tmin");
  float[] Augtmin = float(Augtminstring);
  float avgAugtmin = mean(Augtmin);
  println(avgAugtmin);
  
  String[] Septminstring = subsetValues(data, "mm", "9", "tmin");
  float[] Septmin = float(Septminstring);
  float avgSeptmin = mean(Septmin);
  println(avgSeptmin);
  
  String[] Octtminstring = subsetValues(data, "mm", "10", "tmin");
  float[] Octtmin = float(Octtminstring);
  float avgOcttmin = mean(Octtmin);
  println(avgOcttmin);
  
  String[] Novtminstring = subsetValues(data, "mm", "11", "tmin");
  float[] Novtmin = float(Novtminstring);
  float avgNovtmin = mean(Novtmin);
  println(avgNovtmin);
  
  String[] Dectminstring = subsetValues(data, "mm", "12", "tmin");
  float[] Dectmin = float(Dectminstring);
  float avgDectmin = mean(Dectmin);
  println(avgDectmin);
  
  avgrainfall[0] = avgJanrain;
  avgrainfall[1] = avgFebrain;
  avgrainfall[2] = avgMarrain;
  avgrainfall[3] = avgAprrain;
  avgrainfall[4] = avgMayrain;
  avgrainfall[5] = avgJunrain;
  avgrainfall[6] = avgJulrain;
  avgrainfall[7] = avgAugrain;
  avgrainfall[8] = avgSeprain;
  avgrainfall[9] = avgOctrain;
  avgrainfall[10] = avgNovrain;
  avgrainfall[11] = avgDecrain;
  
  avgmaxtemp[0] = avgJantmax;
  avgmaxtemp[1] = avgFebtmax;
  avgmaxtemp[2] = avgMartmax;
  avgmaxtemp[3] = avgAprtmax;
  avgmaxtemp[4] = avgMaytmax;
  avgmaxtemp[5] = avgJuntmax;
  avgmaxtemp[6] = avgJultmax;
  avgmaxtemp[7] = avgAugtmax;
  avgmaxtemp[8] = avgSeptmax;
  avgmaxtemp[9] = avgOcttmax;
  avgmaxtemp[10] = avgNovtmax;
  avgmaxtemp[11] = avgDectmax;

  avgmintemp[0] = avgJantmin;
  avgmintemp[1] = avgFebtmin;
  avgmintemp[2] = avgMartmin;
  avgmintemp[3] = avgAprtmin;
  avgmintemp[4] = avgMaytmin;
  avgmintemp[5] = avgJuntmin;
  avgmintemp[6] = avgJultmin;
  avgmintemp[7] = avgAugtmin;
  avgmintemp[8] = avgSeptmin;
  avgmintemp[9] = avgOcttmin;
  avgmintemp[10] = avgNovtmin;
  avgmintemp[11] = avgDectmin;
}

float sum(float data[])
{
  float S = 0;
  for(float n : data) S+= n;
  return S;
}

float mean(float data[])
{
  return sum(data)/data.length;
}

void draw()
{
  for(int i = 0; i < avgrainfall.length; i++)
  {
    fill(0,0,255);
    strokeWeight(0);
    ellipse(20+i*50,300-avgrainfall[i]*2,3,3);
  }
  
  for(int i = 0; i < avgmaxtemp.length; i++)
  {
    fill(150,0,0);
    ellipse(20+i*50,300-avgmaxtemp[i]*2,3,3);
  }
  
  for(int i = 0; i < avgmintemp.length; i++)
  {
    fill(0,200,0);
    ellipse(20+i*50,300-avgmintemp[i]*2,3,3);
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



