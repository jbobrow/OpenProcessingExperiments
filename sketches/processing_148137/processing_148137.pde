
/*supposed to be used to create the graph
int[] temp;*/

void setup()
{
  String url = URLforSite("Durham");

  println(url);
  println("");

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

  String[] tmax = subsetValues(data, "mm", "1", "tmax");
  float[] mmtmax = float(tmax);
  
  String[] tmin = subsetValues(data, "mm", "1", "tmin");
  float[] mmtmin = float(tmin);
  
  String[] rain = subsetValues(data, "mm", "1", "rain");
  float[] mmrain = float(rain);

  println("Month 1");
  println("max temp "+ max(mmtmax));
  println("min temp "+ min(mmtmin));
  
  //the print rain can be used to calualte the mean
  //println("rain " + _____(mmrain))

//month 2
String[] tmax2 = subsetValues(data, "mm", "2", "tmax");
  float[] mmtmax2 = float(tmax2);
  
  String[] tmin2 = subsetValues(data, "mm", "2", "tmin");
  float[] mmtmin2 = float(tmin2);
  
  String[] rain2 = subsetValues(data, "mm", "2", "rain");
  float[] mmrain2 = float(rain2);

  println("");
  println("Month 2");
  println("max temp "+ max(mmtmax2));
  println("min temp "+ min(mmtmin2));
  
  //month 3
  String[] tmax3 = subsetValues(data, "mm", "3", "tmax");
  float[] mmtmax3 = float(tmax3);
  
  String[] tmin3 = subsetValues(data, "mm", "3", "tmin");
  float[] mmtmin3 = float(tmin3);
  
  String[] rain3 = subsetValues(data, "mm", "3", "rain");
  float[] mmrain3 = float(rain3);

  println("");
  println("Month 3");
  println("max temp "+ max(mmtmax3));
  println("min temp "+ min(mmtmin3));
  
  //month 4
  String[] tmax4 = subsetValues(data, "mm", "4", "tmax");
  float[] mmtmax4 = float(tmax4);
  
  String[] tmin4 = subsetValues(data, "mm", "4", "tmin");
  float[] mmtmin4 = float(tmin4);
  
  String[] rain4 = subsetValues(data, "mm", "4", "rain");
  float[] mmrain4 = float(rain4);

  println("");
  println("Month 4");
  println("max temp "+ max(mmtmax4));
  println("min temp "+ min(mmtmin4));
  
  //month 5
  String[] tmax5 = subsetValues(data, "mm", "5", "tmax");
  float[] mmtmax5 = float(tmax5);
  
  String[] tmin5 = subsetValues(data, "mm", "5", "tmin");
  float[] mmtmin5 = float(tmin5);
  
  String[] rain5 = subsetValues(data, "mm", "5", "rain");
  float[] mmrain5 = float(rain5);
  
  println("");
  println("Month 5");
  println("max temp "+ max(mmtmax5));
  println("min temp "+ min(mmtmin5));
  
  //month 6
  String[] tmax6 = subsetValues(data, "mm", "6", "tmax");
  float[] mmtmax6 = float(tmax6);
  
  String[] tmin6 = subsetValues(data, "mm", "6", "tmin");
  float[] mmtmin6 = float(tmin6);
  
  String[] rain6 = subsetValues(data, "mm", "6", "rain");
  float[] mmrain6 = float(rain6);
  
  println("");
  println("Month 6");
  println("max temp "+ max(mmtmax6));
  println("min temp "+ min(mmtmin6));

  //month 7
  String[] tmax7 = subsetValues(data, "mm", "7", "tmax");
  float[] mmtmax7 = float(tmax7);
  
  String[] tmin7 = subsetValues(data, "mm", "7", "tmin");
  float[] mmtmin7 = float(tmin7);
  
  String[] rain7 = subsetValues(data, "mm", "7", "rain");
  float[] mmrain7 = float(rain7);
  
  println("");
  println("Month 7");
  println("max temp "+ max(mmtmax7));
  println("min temp "+ min(mmtmin7));
  
  //month 8
  String[] tmax8 = subsetValues(data, "mm", "8", "tmax");
  float[] mmtmax8 = float(tmax8);
  
  String[] tmin8 = subsetValues(data, "mm", "8", "tmin");
  float[] mmtmin8 = float(tmin8);
  
  String[] rain8 = subsetValues(data, "mm", "8", "rain");
  float[] mmrain8 = float(rain8);
  
  println("");
  println("Month 8");
  println("max temp "+ max(mmtmax8));
  println("min temp "+ min(mmtmin8));
  
  //month 9
  String[] tmax9 = subsetValues(data, "mm", "9", "tmax");
  float[] mmtmax9 = float(tmax9);
  
  String[] tmin9 = subsetValues(data, "mm", "9", "tmin");
  float[] mmtmin9 = float(tmin9);
  
  String[] rain9 = subsetValues(data, "mm", "9", "rain");
  float[] mmrain9 = float(rain9);
  
  println("");
  println("Month 9");
  println("max temp "+ max(mmtmax9));
  println("min temp "+ min(mmtmin9));
  
  //month 10
  String[] tmax10 = subsetValues(data, "mm", "10", "tmax");
  float[] mmtmax10 = float(tmax10);
  
  String[] tmin10 = subsetValues(data, "mm", "10", "tmin");
  float[] mmtmin10 = float(tmin10);
  
  String[] rain10 = subsetValues(data, "mm", "10", "rain");
  float[] mmrain10 = float(rain10);
  
  println("");
  println("Month 10");
  println("max temp "+ max(mmtmax10));
  println("min temp "+ min(mmtmin10));
  
  //month 11
  String[] tmax11 = subsetValues(data, "mm", "11", "tmax");
  float[] mmtmax11 = float(tmax11);
  
  String[] tmin11 = subsetValues(data, "mm", "11", "tmin");
  float[] mmtmin11 = float(tmin11);
  
  String[] rain11 = subsetValues(data, "mm", "11", "rain");
  float[] mmrain11 = float(rain11);
  
  println("");
  println("Month 11");
  println("max temp "+ max(mmtmax11));
  println("min temp "+ min(mmtmin11));
  
  //month 12
  String[] tmax12 = subsetValues(data, "mm", "12", "tmax");
  float[] mmtmax12 = float(tmax12);
  
  String[] tmin12 = subsetValues(data, "mm", "12", "tmin");
  float[] mmtmin12 = float(tmin12);
  
  String[] rain12 = subsetValues(data, "mm", "12", "rain");
  float[] mmrain12 = float(rain12);
  
  println("");
  println("Month 12");
  println("max temp "+ max(mmtmax12));
  println("min temp "+ min(mmtmin12));
  
  /*
  attempt to find the average rain
  float[] means = mmrain; 

// set a new float with 12 value for each month
means = new float[12];

//start a count for the values in the table
for ( int i = 0; i < means.length; ++i )
{
 means[i] =  ____(mmrain);
}

// The average is then calculated 
float average = 0; 
for ( int i = 0; i < means.length; ++i ) 
{ 
 //add the value of means to averag
 average += means[i]; 
} 
//divide the average by 12 for the number of months
average /= (12); 

println("Average rain fall "+ average );*/
  
  
  /* size(200,200);
  //make a set of strings for the mintemperature
  String[] tempmin= loadStrings(url);
  datamin = int(split(tempmin[0],','));
  
  this was to be duplicated for max temp and average rainfall
  */

}

/*void draw() {
  background(255);
  stroke(0);
  for (int i = 0; i < datamin.length; i++) {
    fill(datamin[i]);
    rect(i*20,0,20,datamin[i]);
  }
}*/



String URLforSite(String site)
{
  return "http://www.metoffice.gov.uk/"+
    "pub/data/weather/uk/climate/stationdata/"+
    site.toLowerCase()+
    "data.txt";
}

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


String[] subsetValues(Table tab, String select, String value, String field)
{
  String[] data = new String[0];
  for (TableRow r : tab.findRows(value,select)) {
    data = append(data, r.getString(field));
  }
  return data;
}



