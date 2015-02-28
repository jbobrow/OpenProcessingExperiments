
//Stephen Campbell climate data sketch

//Global variables
String[] months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"};
PFont font;
PFont titleFont;

//Rainfall variables
float[] janRainfall,febRainfall,marRainfall,aprRainfall,mayRainfall,junRainfall,julRainfall,augRainfall,septRainfall,octRainfall,novRainfall,decRainfall;
float avgJanRainfall,avgFebRainfall,avgMarRainfall,avgAprRainfall,avgMayRainfall,avgJunRainfall,avgJulRainfall,avgAugRainfall,avgSeptRainfall,avgOctRainfall,avgNovRainfall,avgDecRainfall;
float[] avgRainfall = new float[12];

//Minimum temperature variables
float[] janMinTemp,febMinTemp,marMinTemp,aprMinTemp,mayMinTemp,junMinTemp,julMinTemp,augMinTemp,septMinTemp,octMinTemp,novMinTemp,decMinTemp;
float avgJanMinTemp,avgFebMinTemp,avgMarMinTemp,avgAprMinTemp,avgMayMinTemp,avgJunMinTemp,avgJulMinTemp,avgAugMinTemp,avgSeptMinTemp,avgOctMinTemp,avgNovMinTemp,avgDecMinTemp;
float[] avgMinTemp = new float[12];

//Maximum temperature variables
float[] janMaxTemp,febMaxTemp,marMaxTemp,aprMaxTemp,mayMaxTemp,junMaxTemp,julMaxTemp,augMaxTemp,septMaxTemp,octMaxTemp,novMaxTemp,decMaxTemp;
float avgJanMaxTemp,avgFebMaxTemp,avgMarMaxTemp,avgAprMaxTemp,avgMayMaxTemp,avgJunMaxTemp,avgJulMaxTemp,avgAugMaxTemp,avgSeptMaxTemp,avgOctMaxTemp,avgNovMaxTemp,avgDecMaxTemp;
float[] avgMaxTemp = new float[12];

void setup()
{
  size(760,660);
  noLoop();
  
  String url = URLforSite("Durham");

  println(url);

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

  //Rainfall
  
  //Average rainfall for January
  String[] rainfallJan = subsetValues(data, "mm", "1", "rain");
  janRainfall = float(rainfallJan);
  avgJanRainfall = mean(janRainfall);
  
  //Average rainfall for February
  String[] rainfallFeb = subsetValues(data, "mm", "2", "rain");
  febRainfall = float(rainfallFeb);
  avgFebRainfall = mean(febRainfall);
  
  //Average rainfall for March
  String[] rainfallMar = subsetValues(data, "mm", "3", "rain");
  marRainfall = float(rainfallMar);
  avgMarRainfall = mean(marRainfall);
  
  //Average rainfall for April
  String[] rainfallApr = subsetValues(data, "mm", "4", "rain");
  aprRainfall = float(rainfallApr);
  avgAprRainfall = mean(aprRainfall);
  
  //Average rainfall for May
  String[] rainfallMay = subsetValues(data, "mm", "5", "rain");
  mayRainfall = float(rainfallMay);
  avgMayRainfall = mean(mayRainfall);
  
  //Average rainfall for June
  String[] rainfallJun = subsetValues(data, "mm", "6", "rain");
  junRainfall = float(rainfallJun);
  avgJunRainfall = mean(junRainfall);
  
  //Average rainfall for July
  String[] rainfallJul = subsetValues(data, "mm", "7", "rain");
  julRainfall = float(rainfallJul);
  avgJulRainfall = mean(julRainfall);
  
  //Average rainfall for August
  String[] rainfallAug = subsetValues(data, "mm", "8", "rain");
  augRainfall = float(rainfallAug);
  avgAugRainfall = mean(augRainfall);
  
  //Average rainfall for September
  String[] rainfallSept = subsetValues(data, "mm", "9", "rain");
  septRainfall = float(rainfallSept);
  avgSeptRainfall = mean(septRainfall);
  
  //Average rainfall for October
  String[] rainfallOct = subsetValues(data, "mm", "10", "rain");
  octRainfall = float(rainfallOct);
  avgOctRainfall = mean(octRainfall);
  
  //Average rainfall for November
  String[] rainfallNov = subsetValues(data, "mm", "11", "rain");
  novRainfall = float(rainfallNov);
  avgNovRainfall = mean(novRainfall);
  
  //Average rainfall for December
  String[] rainfallDec = subsetValues(data, "mm", "12", "rain");
  decRainfall = float(rainfallDec);
  avgDecRainfall = mean(decRainfall);

  avgRainfall[0] = avgJanRainfall;
  avgRainfall[1] = avgFebRainfall;
  avgRainfall[2] = avgMarRainfall;
  avgRainfall[3] = avgAprRainfall;
  avgRainfall[4] = avgMayRainfall;
  avgRainfall[5] = avgJunRainfall;
  avgRainfall[6] = avgJulRainfall;
  avgRainfall[7] = avgAugRainfall;
  avgRainfall[8] = avgSeptRainfall;
  avgRainfall[9] = avgOctRainfall;
  avgRainfall[10] = avgNovRainfall;
  avgRainfall[11] = avgDecRainfall;

  println("average Jan rainfall "+avgJanRainfall);
  println("average Feb rainfall "+avgFebRainfall);
  println("average Mar rainfall "+avgMarRainfall);
  println("average Apr rainfall "+avgAprRainfall);
  println("average May rainfall "+avgMayRainfall);
  println("average Jun rainfall "+avgJunRainfall);
  println("average Jul rainfall "+avgJulRainfall);
  println("average Aug rainfall "+avgAugRainfall);
  println("average Sep rainfall "+avgSeptRainfall);
  println("average Nov rainfall "+avgNovRainfall);
  println("average Dec rainfall "+avgDecRainfall);
  
  //Minimum temperatures
  
  //Average minimum temperature for January
  String[] minTempJan = subsetValues(data, "mm", "1", "tmin");
  janMinTemp = float(minTempJan);
  avgJanMinTemp = mean(janMinTemp);
  
  //Average minimum temperature for February
  String[] minTempFeb = subsetValues(data, "mm", "2", "tmin");
  febMinTemp = float(minTempFeb);
  avgFebMinTemp = mean(febMinTemp);
  
  //Average minimum temperature for March
  String[] minTempMar = subsetValues(data, "mm", "3", "tmin");
  marMinTemp = float(minTempMar);
  avgMarMinTemp = mean(marMinTemp);
  
  //Average minimum temperature for April
  String[] minTempApr = subsetValues(data, "mm", "4", "tmin");
  aprMinTemp = float(minTempApr);
  avgAprMinTemp = mean(aprMinTemp);
  
  //Average minimum temperature for May
  String[] minTempMay = subsetValues(data, "mm", "5", "tmin");
  mayMinTemp = float(minTempMay);
  avgMayMinTemp = mean(mayMinTemp);
  
  //Average minimum temperature for June
  String[] minTempJun = subsetValues(data, "mm", "6", "tmin");
  junMinTemp = float(minTempJun);
  avgJunMinTemp = mean(junMinTemp);
  
  //Average minimum temperature for July
  String[] minTempJul = subsetValues(data, "mm", "7", "tmin");
  julMinTemp = float(minTempJul);
  avgJulMinTemp = mean(julMinTemp);
  
  //Average minimum temperature for August
  String[] minTempAug = subsetValues(data, "mm", "8", "tmin");
  augMinTemp = float(minTempAug);
  avgAugMinTemp = mean(augMinTemp);
  
  //Average minimum temperature for September
  String[] minTempSept = subsetValues(data, "mm", "9", "tmin");
  septMinTemp = float(minTempSept);
  avgSeptMinTemp = mean(septMinTemp);
  
  //Average minimum temperature for October
  String[] minTempOct = subsetValues(data, "mm", "10", "tmin");
  octMinTemp = float(minTempOct);
  avgOctMinTemp = mean(octMinTemp);
  
  //Average minimum temperature for November
  String[] minTempNov = subsetValues(data, "mm", "11", "tmin");
  novMinTemp = float(minTempNov);
  avgNovMinTemp = mean(novMinTemp);
  
  //Average minimum temperature for December
  String[] minTempDec = subsetValues(data, "mm", "12", "tmin");
  decMinTemp = float(minTempDec);
  avgDecMinTemp = mean(decMinTemp);
  
  println("");
  println("average Jan minimum temperature "+avgJanMinTemp);
  println("average Feb minimum temperature "+avgFebMinTemp);
  println("average Mar minimum temperature "+avgMarMinTemp);
  println("average Apr minimum temperature "+avgAprMinTemp);
  println("average May minimum temperature "+avgMayMinTemp);
  println("average Jun minimum temperature "+avgJunMinTemp);
  println("average Jul minimum temperature "+avgJulMinTemp);
  println("average Aug minimum temperature "+avgAugMinTemp);
  println("average Sep minimum temperature "+avgSeptMinTemp);
  println("average Nov minimum temperature "+avgNovMinTemp);
  println("average Dec minimum temperature "+avgDecMinTemp);
  
  avgMinTemp[0] = avgJanMinTemp;
  avgMinTemp[1] = avgFebMinTemp;
  avgMinTemp[2] = avgMarMinTemp;
  avgMinTemp[3] = avgAprMinTemp;
  avgMinTemp[4] = avgMayMinTemp;
  avgMinTemp[5] = avgJunMinTemp;
  avgMinTemp[6] = avgJulMinTemp;
  avgMinTemp[7] = avgAugMinTemp;
  avgMinTemp[8] = avgSeptMinTemp;
  avgMinTemp[9] = avgOctMinTemp;
  avgMinTemp[10] = avgNovMinTemp;
  avgMinTemp[11] = avgDecMinTemp;
    
  //Maximum temperatures
  
  //Average maximum temperature for January
  String[] maxTempJan = subsetValues(data, "mm", "1", "tmax");
  janMaxTemp = float(maxTempJan);
  avgJanMaxTemp = mean(janMaxTemp);
  
  //Average maximum temperature for February
  String[] maxTempFeb = subsetValues(data, "mm", "2", "tmax");
  febMaxTemp = float(maxTempFeb);
  avgFebMaxTemp = mean(febMaxTemp);
  
  //Average maximum temperature for March
  String[] maxTempMar = subsetValues(data, "mm", "3", "tmax");
  marMaxTemp = float(maxTempMar);
  avgMarMaxTemp = mean(marMaxTemp);
  
  //Average maximum temperature for April
  String[] maxTempApr = subsetValues(data, "mm", "4", "tmax");
  aprMaxTemp = float(maxTempApr);
  avgAprMaxTemp = mean(aprMaxTemp);
  
  //Average maximum temperature for May
  String[] maxTempMay = subsetValues(data, "mm", "5", "tmax");
  mayMaxTemp = float(maxTempMay);
  avgMayMaxTemp = mean(mayMaxTemp);
  
  //Average maximum temperature for June
  String[] maxTempJun = subsetValues(data, "mm", "6", "tmax");
  junMaxTemp = float(maxTempJun);
  avgJunMaxTemp = mean(junMaxTemp);
  
  //Average maximum temperature for July
  String[] maxTempJul = subsetValues(data, "mm", "7", "tmax");
  julMaxTemp = float(maxTempJul);
  avgJulMaxTemp = mean(julMaxTemp);
  
  //Average maximum temperature for August
  String[] maxTempAug = subsetValues(data, "mm", "8", "tmax");
  augMaxTemp = float(maxTempAug);
  avgAugMaxTemp = mean(augMaxTemp);
  
  //Average maximum temperature for September
  String[] maxTempSept = subsetValues(data, "mm", "9", "tmax");
  septMaxTemp = float(maxTempSept);
  avgSeptMaxTemp = mean(septMaxTemp);
  
  //Average maximum temperature for October
  String[] maxTempOct = subsetValues(data, "mm", "10", "tmax");
  octMaxTemp = float(maxTempOct);
  avgOctMaxTemp = mean(octMaxTemp);
  
  //Average maximum temperature for November
  String[] maxTempNov = subsetValues(data, "mm", "11", "tmax");
  novMaxTemp = float(maxTempNov);
  avgNovMaxTemp = mean(novMaxTemp);
  
  //Average maximum temperature for December
  String[] maxTempDec = subsetValues(data, "mm", "12", "tmax");
  decMaxTemp = float(maxTempDec);
  avgDecMaxTemp = mean(decMaxTemp);
  
  println("");
  println("average Jan maximum temperature "+avgJanMaxTemp);
  println("average Feb maximum temperature "+avgFebMaxTemp);
  println("average Mar maximum temperature "+avgMarMaxTemp);
  println("average Apr maximum temperature "+avgAprMaxTemp);
  println("average May maximum temperature "+avgMayMaxTemp);
  println("average Jun maximum temperature "+avgJunMaxTemp);
  println("average Jul maximum temperature "+avgJulMaxTemp);
  println("average Aug maximum temperature "+avgAugMaxTemp);
  println("average Sep maximum temperature "+avgSeptMaxTemp);
  println("average Nov maximum temperature "+avgNovMaxTemp);
  println("average Dec maximum temperature "+avgDecMaxTemp);
  
  avgMaxTemp[0] = avgJanMaxTemp;
  avgMaxTemp[1] = avgFebMaxTemp;
  avgMaxTemp[2] = avgMarMaxTemp;
  avgMaxTemp[3] = avgAprMaxTemp;
  avgMaxTemp[4] = avgMayMaxTemp;
  avgMaxTemp[5] = avgJunMaxTemp;
  avgMaxTemp[6] = avgJulMaxTemp;
  avgMaxTemp[7] = avgAugMaxTemp;
  avgMaxTemp[8] = avgSeptMaxTemp;
  avgMaxTemp[9] = avgOctMaxTemp;
  avgMaxTemp[10] = avgNovMaxTemp;
  avgMaxTemp[11] = avgDecMaxTemp;
  
  //Load fonts from data folder.
  font = loadFont("Ubuntu-12.vlw");
  titleFont = loadFont("Ubuntu-Light-24.vlw");
}

void draw()
{
  background(255,255,255);
  
  stroke(200);
  strokeWeight(3);
  fill(0);
  for(int i = 0; i < months.length; i++)
  {
    text(months[i],20+(i*60),640);
    line(15+(i*60),0,15+(i*60),height);
  }
  stroke(0);
  strokeWeight(1);
  noFill();
  rect(5,5,width-15,200);
  rect(5,210,width-15,200);
  rect(5,415,width-15,200);
  
  noStroke();
  fill(255);
  rect(6,6,150,30);
  rect(6,211,320,30);
  rect(6,416,320,30);
  
  fill(0);
  textFont(titleFont,24);
  text("Average rainfall",10,30);
  text("Average minimum temperature",10,235);
  text("Average maximum temperature",10,440);
  
  textFont(font,12);

  for(int i = 0; i < avgRainfall.length; i++)
  {
    pushMatrix();
    translate(15+i*60,200-avgRainfall[i]*2);
    ellipse(0,0,8,8);
    text(avgRainfall[i],10,0);
    popMatrix();
  }

  for(int i = 0; i < avgMinTemp.length; i++)
  {
    pushMatrix();
    translate(15+i*60,400-avgMinTemp[i]*8);
    ellipse(0,0,8,8);
    text(avgMinTemp[i],10,0);
    popMatrix();
  }

  for(int i = 0; i < avgMaxTemp.length; i++)
  {
    pushMatrix();
    translate(15+i*60,600-avgMaxTemp[i]*4);
    ellipse(0,0,8,8);
    text(avgMaxTemp[i],10,0);
    popMatrix();
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



