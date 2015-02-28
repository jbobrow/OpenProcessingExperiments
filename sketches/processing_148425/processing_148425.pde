
float[] avgrainfall = new float[12];
float[] maxtempmonth = new float[12];
float[] mintempmonth = new float[12];



void setup()
{
  size(700,500);
  String url = URLforSite("Durham");

  println(url);
  println("");

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

  //month 1(January)
  String[] tmax = subsetValues(data, "mm", "1", "tmax");
  float[] mmtmax = float(tmax);
  
  String[] tmin = subsetValues(data, "mm", "1", "tmin");
  float[] mmtmin = float(tmin);
  
  String[] rain = subsetValues(data, "mm", "1", "rain");
  float[] mmrain = float(rain);
  float avgmmrain = mean(mmrain);

  println(max(mmtmax));
  println(min(mmtmin));
  println(avgmmrain);
  
  
  
  

  //month 2 (February)
  String[] tmax2 = subsetValues(data, "mm", "2", "tmax");
  float[] mmtmax2 = float(tmax2);
  
  String[] tmin2 = subsetValues(data, "mm", "2", "tmin");
  float[] mmtmin2 = float(tmin2);
  
  String[] rain2 = subsetValues(data, "mm", "2", "rain");
  float[] mmrain2 = float(rain2);
  float avgmmrain2 = mean(mmrain2);

  println(max(mmtmax2));
  println(min(mmtmin2));
  println(avgmmrain2);
  
  
  
  
  
  //month 3 (March)
  String[] tmax3 = subsetValues(data, "mm", "3", "tmax");
  float[] mmtmax3 = float(tmax3);
  
  String[] tmin3 = subsetValues(data, "mm", "3", "tmin");
  float[] mmtmin3 = float(tmin3);
  
  String[] rain3 = subsetValues(data, "mm", "3", "rain");
  float[] mmrain3 = float(rain3);
  float avgmmrain3 = mean(mmrain3);

  println(max(mmtmax3));
  println(min(mmtmin3));
  println(avgmmrain3);
  
  
  
  
  
  //month 4 (April)
  String[] tmax4 = subsetValues(data, "mm", "4", "tmax");
  float[] mmtmax4 = float(tmax4);
  
  String[] tmin4 = subsetValues(data, "mm", "4", "tmin");
  float[] mmtmin4 = float(tmin4);
  
  String[] rain4 = subsetValues(data, "mm", "4", "rain");
  float[] mmrain4 = float(rain4);
  float avgmmrain4 = mean(mmrain4);

  println(max(mmtmax4));
  println(min(mmtmin4));
  println(avgmmrain4);
  
  
  
  
  
  //month 5 (May)
  String[] tmax5 = subsetValues(data, "mm", "5", "tmax");
  float[] mmtmax5 = float(tmax5);
  
  String[] tmin5 = subsetValues(data, "mm", "5", "tmin");
  float[] mmtmin5 = float(tmin5);
  
  String[] rain5 = subsetValues(data, "mm", "5", "rain");
  float[] mmrain5 = float(rain5);
  float avgmmrain5 = mean(mmrain5);
  
  println(max(mmtmax5));
  println(min(mmtmin5));
  println(avgmmrain5);
  
  
  
  
  
  //month 6 (June)
  String[] tmax6 = subsetValues(data, "mm", "6", "tmax");
  float[] mmtmax6 = float(tmax6);
  
  String[] tmin6 = subsetValues(data, "mm", "6", "tmin");
  float[] mmtmin6 = float(tmin6);
  
  String[] rain6 = subsetValues(data, "mm", "6", "rain");
  float[] mmrain6 = float(rain6);
  float avgmmrain6 = mean(mmrain6);
  
  println(max(mmtmax6));
  println(min(mmtmin6));
  println(avgmmrain6);
  
  
  
  

  //month 7 (July)
  String[] tmax7 = subsetValues(data, "mm", "7", "tmax");
  float[] mmtmax7 = float(tmax7);
  
  String[] tmin7 = subsetValues(data, "mm", "7", "tmin");
  float[] mmtmin7 = float(tmin7);
  
  String[] rain7 = subsetValues(data, "mm", "7", "rain");
  float[] mmrain7 = float(rain7);
  float avgmmrain7 = mean(mmrain7);
  
  println(max(mmtmax7));
  println(min(mmtmin7));
  println(avgmmrain7);
  
  
  
  
  //month 8 (August)
  String[] tmax8 = subsetValues(data, "mm", "8", "tmax");
  float[] mmtmax8 = float(tmax8);
  
  String[] tmin8 = subsetValues(data, "mm", "8", "tmin");
  float[] mmtmin8 = float(tmin8);
  
  String[] rain8 = subsetValues(data, "mm", "8", "rain");
  float[] mmrain8 = float(rain8);
  float avgmmrain8 = mean(mmrain8);
  
  println(max(mmtmax8));
  println(min(mmtmin8));
  println(avgmmrain8);
  
  
  
  
  
  //month 9 (September)
  String[] tmax9 = subsetValues(data, "mm", "9", "tmax");
  float[] mmtmax9 = float(tmax9);
  
  String[] tmin9 = subsetValues(data, "mm", "9", "tmin");
  float[] mmtmin9 = float(tmin9);
  
  String[] rain9 = subsetValues(data, "mm", "9", "rain");
  float[] mmrain9 = float(rain9);
  float avgmmrain9 = mean(mmrain9);
  
  println(max(mmtmax9));
  println(min(mmtmin9));
  println(avgmmrain9);
  
  
  
  
  
  //month 10 (October)
  String[] tmax10 = subsetValues(data, "mm", "10", "tmax");
  float[] mmtmax10 = float(tmax10);
  
  String[] tmin10 = subsetValues(data, "mm", "10", "tmin");
  float[] mmtmin10 = float(tmin10);
  
  String[] rain10 = subsetValues(data, "mm", "10", "rain");
  float[] mmrain10 = float(rain10);
  float avgmmrain10 = mean(mmrain10);
  
  println(max(mmtmax10));
  println(min(mmtmin10));
  println(avgmmrain10);
  
  
  
  
  
  //month 11 (November)
  String[] tmax11 = subsetValues(data, "mm", "11", "tmax");
  float[] mmtmax11 = float(tmax11);
  
  String[] tmin11 = subsetValues(data, "mm", "11", "tmin");
  float[] mmtmin11 = float(tmin11);
  
  String[] rain11 = subsetValues(data, "mm", "11", "rain");
  float[] mmrain11 = float(rain11);
  float avgmmrain11 = mean(mmrain11);
  
  println(max(mmtmax11));
  println(min(mmtmin11));
  println(avgmmrain11);
  
  
  
  
  
  //month 12 (December)
  String[] tmax12 = subsetValues(data, "mm", "12", "tmax");
  float[] mmtmax12 = float(tmax12);
  
  String[] tmin12 = subsetValues(data, "mm", "12", "tmin");
  float[] mmtmin12 = float(tmin12);
  
  String[] rain12 = subsetValues(data, "mm", "12", "rain");
  float[] mmrain12 = float(rain12);
  float avgmmrain12 = mean(mmrain12);
  
  println(max(mmtmax12));
  println(min(mmtmin12));
  println(avgmmrain12);
  
  
  //add the max tempuratures reached to the maxtempmonth array
  maxtempmonth[0] = min(mmtmax);
  maxtempmonth[1] = min(mmtmax2);
  maxtempmonth[2] = min(mmtmax3);
  maxtempmonth[3] = min(mmtmax4);
  maxtempmonth[4] = min(mmtmax5);
  maxtempmonth[5] = min(mmtmax6);
  maxtempmonth[6] = min(mmtmax7);
  maxtempmonth[7] = min(mmtmax8);
  maxtempmonth[8] = min(mmtmax9);
  maxtempmonth[9] = min(mmtmax10);
  maxtempmonth[10] = min(mmtmax11);
  maxtempmonth[11] = min(mmtmax12);
 
  
  //add the min tempuratures reached to the maxtempmonth array
  mintempmonth[0] = max(mmtmin);
  mintempmonth[1] = max(mmtmin2);
  mintempmonth[2] = max(mmtmin3);
  mintempmonth[3] = max(mmtmin4);
  mintempmonth[4] = max(mmtmin5);
  mintempmonth[5] = max(mmtmin6);
  mintempmonth[6] = max(mmtmin7);
  mintempmonth[7] = max(mmtmin8);
  mintempmonth[8] = max(mmtmin9);
  mintempmonth[9] = max(mmtmin10);
  mintempmonth[10] = max(mmtmin11);
  mintempmonth[11] = max(mmtmin12);
  
  
  //add the average rain fall to the array called avgrainfall
  avgrainfall[0] = avgmmrain;
  avgrainfall[1] = avgmmrain2;
  avgrainfall[2] = avgmmrain3;
  avgrainfall[3] = avgmmrain4;
  avgrainfall[4] = avgmmrain5;
  avgrainfall[5] = avgmmrain6;
  avgrainfall[6] = avgmmrain7;
  avgrainfall[7] = avgmmrain8;
  avgrainfall[8] = avgmmrain9;
  avgrainfall[9] = avgmmrain10;
  avgrainfall[10] = avgmmrain11;
  avgrainfall[11] = avgmmrain12;
 
 
}

void draw()
//average rain = blue, maxtemp = red and mintemp = green
{
  for(int i = 0; i < avgrainfall.length; i++)
  {
    fill(0,0,200);
    rect(20+i*50,300-avgrainfall[i]*2,5,5);
  }
  
  for(int i = 0; i < maxtempmonth.length; i++)
  {
    fill(200,0,0);
    rect(20+i*50,300-maxtempmonth[i]*2,5,5);
  }
  
  for(int i = 0; i < mintempmonth.length; i++)
  {
    fill(0,200,0);
    rect(20+i*50,300-mintempmonth[i]*2,5,5);
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



