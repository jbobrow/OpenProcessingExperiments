
float[] rainfallavg=new float [12];
float[] tempmax=new float [12];
float[] tempmin=new float [12];

void setup()
{
  size(400,650);
  String url = URLforSite("Durham");

  println(url);
  
//January
  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

  String[] maxtemp1 = subsetValues(data, "mm", "1", "tmax");
  float[] maxtempmonth1 = float(maxtemp1);
  
  String[] mintemp1 = subsetValues(data, "mm", "1", "tmin");
  float[] mintempmonth1 = float(mintemp1);
  
  String[] rainfall1 = subsetValues(data, "mm", "1", "rain");
  float[] monthlyrain1 = float(rainfall1);
  float avgrain1 = mean (monthlyrain1);

  println(avgrain1);
  println(max(maxtempmonth1));
  println(min (mintempmonth1));
  
  
//February
  String[] maxtemp2 = subsetValues(data, "mm", "2", "tmax");
  float[] maxtempmonth2 = float(maxtemp2);
  
  String[] mintemp2 = subsetValues(data, "mm", "2", "tmin");
  float[] mintempmonth2 = float(mintemp2);
  
  String[] rainfall2 = subsetValues(data, "mm", "2", "rain");
  float[] monthlyrain2 = float(rainfall2);
  float avgrain2 = mean (monthlyrain2);

  println(avgrain2);
  println(max(maxtempmonth2));
  println(min (mintempmonth2));
  
  
//March
  String[] maxtemp3 = subsetValues(data, "mm", "3", "tmax");
  float[] maxtempmonth3 = float(maxtemp3);
  
  String[] mintemp3 = subsetValues(data, "mm", "3", "tmin");
  float[] mintempmonth3 = float(mintemp3);
  
  String[] rainfall3 = subsetValues(data, "mm", "3", "rain");
  float[] monthlyrain3 = float(rainfall3);
  float avgrain3 = mean (monthlyrain3);

  println(avgrain3);
  println(max(maxtempmonth3));
  println(min (mintempmonth3));
  
//April
  String[] maxtemp4 = subsetValues(data, "mm", "4", "tmax");
  float[] maxtempmonth4 = float(maxtemp4);
  
  String[] mintemp4 = subsetValues(data, "mm", "4", "tmin");
  float[] mintempmonth4 = float(mintemp4);
  
  String[] rainfall4 = subsetValues(data, "mm", "4", "rain");
  float[] monthlyrain4 = float(rainfall4);
  float avgrain4 = mean (monthlyrain4);

  println(avgrain4);
  println(max(maxtempmonth4));
  println(min (mintempmonth4));
  
//May
  String[] maxtemp5 = subsetValues(data, "mm", "5", "tmax");
  float[] maxtempmonth5 = float(maxtemp5);
  
  String[] mintemp5 = subsetValues(data, "mm", "5", "tmin");
  float[] mintempmonth5 = float(mintemp5);
  
  String[] rainfall5 = subsetValues(data, "mm", "5", "rain");
  float[] monthlyrain5 = float(rainfall5);
  float avgrain5 = mean (monthlyrain5);

  println(avgrain5);
  println(max(maxtempmonth5));
  println(min (mintempmonth5));
  
//June
  String[] maxtemp6 = subsetValues(data, "mm", "6", "tmax");
  float[] maxtempmonth6 = float(maxtemp6);
  
  String[] mintemp6 = subsetValues(data, "mm", "6", "tmin");
  float[] mintempmonth6 = float(mintemp6);
  
  String[] rainfall6 = subsetValues(data, "mm", "6", "rain");
  float[] monthlyrain6 = float(rainfall6);
  float avgrain6 = mean (monthlyrain6);

  println(avgrain6);
  println(max(maxtempmonth6));
  println(min (mintempmonth6));
  
//July
  String[] maxtemp7 = subsetValues(data, "mm", "7", "tmax");
  float[] maxtempmonth7 = float(maxtemp7);
  
  String[] mintemp7 = subsetValues(data, "mm", "7", "tmin");
  float[] mintempmonth7 = float(mintemp7);
  
  String[] rainfall7 = subsetValues(data, "mm", "7", "rain");
  float[] monthlyrain7 = float(rainfall7);
  float avgrain7 = mean (monthlyrain7);

  println(avgrain7);
  println(max(maxtempmonth7));
  println(min (mintempmonth7));
  
//August
  String[] maxtemp8 = subsetValues(data, "mm", "8", "tmax");
  float[] maxtempmonth8 = float(maxtemp8);
  
  String[] mintemp8 = subsetValues(data, "mm", "8", "tmin");
  float[] mintempmonth8 = float(mintemp8);
  
  String[] rainfall8 = subsetValues(data, "mm", "8", "rain");
  float[] monthlyrain8 = float(rainfall8);
  float avgrain8 = mean (monthlyrain8);

  println(avgrain8);
  println(max(maxtempmonth8));
  println(min (mintempmonth8));
  
//September
  String[] maxtemp9 = subsetValues(data, "mm", "9", "tmax");
  float[] maxtempmonth9 = float(maxtemp9);
  
  String[] mintemp9 = subsetValues(data, "mm", "9", "tmin");
  float[] mintempmonth9 = float(mintemp9);
  
  String[] rainfall9 = subsetValues(data, "mm", "9", "rain");
  float[] monthlyrain9 = float(rainfall9);
  float avgrain9 = mean (monthlyrain9);

  println(avgrain9);
  println(max(maxtempmonth9));
  println(min (mintempmonth9));
  
//October
  String[] maxtemp10 = subsetValues(data, "mm", "10", "tmax");
  float[] maxtempmonth10 = float(maxtemp10);
  
  String[] mintemp10 = subsetValues(data, "mm", "10", "tmin");
  float[] mintempmonth10 = float(mintemp10);
  
  String[] rainfall10 = subsetValues(data, "mm", "10", "rain");
  float[] monthlyrain10 = float(rainfall10);
  float avgrain10 = mean (monthlyrain10);

  println(avgrain10);
  println(max(maxtempmonth10));
  println(min (mintempmonth10));
  
//November
  String[] maxtemp11 = subsetValues(data, "mm", "11", "tmax");
  float[] maxtempmonth11 = float(maxtemp11);
  
  String[] mintemp11 = subsetValues(data, "mm", "11", "tmin");
  float[] mintempmonth11 = float(mintemp11);
  
  String[] rainfall11 = subsetValues(data, "mm", "11", "rain");
  float[] monthlyrain11 = float(rainfall11);
  float avgrain11 = mean (monthlyrain11);

  println(avgrain11);
  println(max(maxtempmonth11));
  println(min (mintempmonth11));
  
//December
  String[] maxtemp12 = subsetValues(data, "mm", "12", "tmax");
  float[] maxtempmonth12 = float(maxtemp12);
  
  String[] mintemp12 = subsetValues(data, "mm", "12", "tmin");
  float[] mintempmonth12 = float(mintemp12);
  
  String[] rainfall12 = subsetValues(data, "mm", "12", "rain");
  float[] monthlyrain12 = float(rainfall12);
  float avgrain12 = mean (monthlyrain12);

  println(avgrain12);
  println(max(maxtempmonth12));
  println(min (mintempmonth12));
  
  
  //month 1
  tempmax[0] = max(maxtempmonth1);
  tempmin[0] = min(mintempmonth1);
  rainfallavg[0] = avgrain1;
  
  //month 2
  tempmax[1] = max(maxtempmonth2);
  tempmin[1] = min(mintempmonth2);
  rainfallavg[1] = avgrain2;
  
  //month3
  tempmax[2] = max(maxtempmonth3);
  tempmin[2] = min(mintempmonth3);
  rainfallavg[2] = avgrain3;
  
  //month4
  tempmax[3] = max(maxtempmonth4);
  tempmin[3] = min(mintempmonth4);
  rainfallavg[3] = avgrain4;
  
  //month5
  tempmax[4] = max(maxtempmonth5);
  tempmin[4] = min(mintempmonth5);
  rainfallavg[4] = avgrain5;
  
  //month6
  tempmax[5] = max(maxtempmonth6);
  tempmin[5] = min(mintempmonth6);
  rainfallavg[5] = avgrain6;
  
  //month7
  tempmax[6] = max(maxtempmonth7);
  tempmin[6] = min(mintempmonth7);
  rainfallavg[6] = avgrain7;
  
  //month8
  tempmax[7] = max(maxtempmonth8);
  tempmin[7] = min(mintempmonth8);
  rainfallavg[7] = avgrain8;
  
  //month9
  tempmax[8] = max(maxtempmonth9);
  tempmin[8] = min(mintempmonth9);
  rainfallavg[8] = avgrain9;
  
  //month10
  tempmax[9] = max(maxtempmonth10);
  tempmin[9] = min(mintempmonth10);
  rainfallavg[9] = avgrain10;
  
  //month11
  tempmax[10] = max(maxtempmonth11);
  tempmin[10] = min(mintempmonth11);
  rainfallavg[10] = avgrain11;
  
  //month12
  tempmax[11] = max(maxtempmonth12);
  tempmin[11] = min(mintempmonth12);
  rainfallavg[11] = avgrain12;
  
  
  
}
void draw()
{
  for(int i = 0; i < rainfallavg.length; i++)
  {
    fill(0,0,200);
    rect(20+i*50,300-rainfallavg[i]*2,5,5);
  }
   
  for(int i = 0; i < tempmax.length; i++)
  {
    fill(200,0,0);
    rect(20+i*50,300-tempmax[i]*2,5,5);
  }
   
  for(int i = 0; i < tempmin.length; i++)
  {
    fill(0,200,0);
    rect(20+i*50,300-tempmin[i]*2,5,5);
  }
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




