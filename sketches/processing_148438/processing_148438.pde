
float[] avgrainfall = new float[12];
float[] avgmaxtemp = new float[12];
float[] avgmintemp = new float[12];

void setup()
{
  size(860,400);
  String url = URLforSite("Durham");

  println(url);
  
  String[] source = loadStrings(url);
  Table data = loadClimateData(source);
  
//------------------------MIN TEMP------------------------------\\  
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
//--------------------------MAX TEMP----------------------------\\  
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
//----------------------------RAINFALL----------------------------\\  
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
//----------------------------------------------------------------------\\
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
//---------------------------\\
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
//---------------------------\\  
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
  
}


void draw()
{
  for(int i = 0; i < avgrainfall.length; i++)
  {
    stroke(0,0,220);
    strokeWeight(3);
    line(40+i*20,340 , 40+i*20,340-avgrainfall[i]*4);
  }
  
  for(int i = 0; i < avgmaxtemp.length; i++)
  {
    stroke(220,0,0);
    strokeWeight(3);
    line(320+i*20,340 , 320+i*20,340-avgmaxtemp[i]*4);
  }
  
  for(int i = 0; i < avgmintemp.length; i++)
  {
    stroke(0,220,0);
    strokeWeight(3);
    line(600+i*20,340 , 600+i*20,340-avgmintemp[i]*4);
  }
  
  strokeWeight(2);
  stroke(0,0,0);
  line(20,343.5 , 280,343.5);
  line(20,343.5 , 20, 50);
  line(300,343.5 , 560,343.5);
  line(300,343.5 , 300, 50);
  line(580,343.5 , 840,343.5);
  line(580,343.5 , 580, 50);
  
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




