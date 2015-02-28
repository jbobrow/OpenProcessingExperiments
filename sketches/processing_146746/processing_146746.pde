
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


void setup()
{
  String url = URLforSite("Durham");

  println(url);

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

  String[] rainFall = subsetValues(data, "yyyy", "2012", "rain"); 
  
  
  String[] minTem = subsetValues(data, "yyyy", "2012", "tmin");
 
  float[] avgMinTem = float(minTem); 
  
  float[] rain = float(rainFall);
  
  
  String[] maxTem = subsetValues(data, "yyyy", "2012", "tmax");
  
  float[] avgMaxTem = float(maxTem);
   
  println("Average Rain Fall " + max(rain) /2);
  
  println("Average Minimum Temperate " + max(avgMinTem) /2);
  
  println("Average Maximum Temperate " + max(avgMaxTem) /2);
  
  
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




