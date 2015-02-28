
float[] avgrain = new float [12];
float[] avgtempmax = new float [12];
float[] avgtempmin = new float [12];

void setup()
{
  size (1000,500);
  String url = URLforSite("Durham");

  println(url);

  String[] source = loadStrings(url);
  Table data = loadClimateData(source);

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
  
   String[] jantmaxstring = subsetValues(data, "mm", "1", "tmax");
  float[] jantmax = float(jantmaxstring);
  float avgjantmax = mean(jantmax);
  println(avgjantmax);

  String[] febtmaxstring = subsetValues(data, "mm", "2", "tmax");
  float[] febtmax = float(febtmaxstring);
  float avgfebtmax = mean(febtmax);
  println(avgfebtmax);
  
  String[] martmaxstring = subsetValues(data, "mm", "3", "tmax");
  float[] martmax = float(martmaxstring);
  float avgmartmax = mean(martmax);
  println(avgmartmax);
  
  String[] aprtmaxstring = subsetValues(data, "mm", "4", "tmax");
  float[] aprtmax = float(aprtmaxstring);
  float avgaprtmax = mean(aprtmax);
  println(avgaprtmax);
  
  String[] maytmaxstring = subsetValues(data, "mm", "5", "tmax");
  float[] maytmax = float(maytmaxstring);
  float avgmaytmax = mean(maytmax);
  println(avgmaytmax);
  
  String[] juntmaxstring = subsetValues(data, "mm", "6", "tmax");
  float[] juntmax = float(juntmaxstring);
  float avgjuntmax = mean(juntmax);
  println(avgjuntmax);
  

  String[] jultmaxstring = subsetValues(data, "mm", "7", "tmax");
  float[] jultmax = float(jultmaxstring);
  float avgjultmax = mean(jultmax);
  println(avgjultmax);
  
  String[] augtmaxstring = subsetValues(data, "mm", "8", "tmax");
  float[] augtmax = float(augtmaxstring);
  float avgaugtmax = mean(augtmax);
  println(avgaugtmax);
  
  String[] septmaxstring = subsetValues(data, "mm", "9", "tmax");
  float[] septmax = float(septmaxstring);
  float avgseptmax = mean(septmax);
  println(avgseptmax);
  
  String[] octtmaxstring = subsetValues(data, "mm", "10", "tmax");
  float[] octtmax = float(octtmaxstring);
  float avgocttmax = mean(octtmax);
  println(avgocttmax);
  
  String[] novtmaxstring = subsetValues(data, "mm", "11", "tmax");
  float[] novtmax = float(novtmaxstring);
  float avgnovtmax = mean(novtmax);
  println(avgnovtmax);
  
  String[] dectmaxstring = subsetValues(data, "mm", "12", "tmax");
  float[] dectmax = float(dectmaxstring);
  float avgdectmax = mean(dectmax);
  println(avgdectmax);
  
    String[] jantminstring = subsetValues(data, "mm", "1", "tmin");
  float[] jantmin = float(jantminstring);
  float avgjantmin = mean(jantmin);
  println(avgjantmin);

  String[] febtminstring = subsetValues(data, "mm", "2", "tmin");
  float[] febtmin = float(febtminstring);
  float avgfebtmin = mean(febtmin);
  println(avgfebtmin);
  
  String[] martminstring = subsetValues(data, "mm", "3", "tmin");
  float[] martmin = float(martminstring);
  float avgmartmin = mean(martmin);
  println(avgmartmin);
  
  String[] aprtminstring = subsetValues(data, "mm", "4", "tmin");
  float[] aprtmin = float(aprtminstring);
  float avgaprtmin = mean(aprtmin);
  println(avgaprtmin);
  
  String[] maytminstring = subsetValues(data, "mm", "5", "tmin");
  float[] maytmin = float(maytminstring);
  float avgmaytmin = mean(maytmin);
  println(avgmaytmin);
  
  String[] juntminstring = subsetValues(data, "mm", "6", "tmin");
  float[] juntmin = float(juntminstring);
  float avgjuntmin = mean(juntmin);
  println(avgjuntmin);
  

  String[] jultminstring = subsetValues(data, "mm", "7", "tmin");
  float[] jultmin = float(jultminstring);
  float avgjultmin = mean(jultmin);
  println(avgjultmin);
  
  String[] augtminstring = subsetValues(data, "mm", "8", "tmin");
  float[] augtmin = float(augtminstring);
  float avgaugtmin = mean(augtmin);
  println(avgaugtmin);
  
  String[] septminstring = subsetValues(data, "mm", "9", "tmin");
  float[] septmin = float(septminstring);
  float avgseptmin = mean(septmin);
  println(avgseptmin);
  
  String[] octtminstring = subsetValues(data, "mm", "10", "tmin");
  float[] octtmin = float(octtminstring);
  float avgocttmin = mean(octtmin);
  println(avgocttmin);
  
  String[] novtminstring = subsetValues(data, "mm", "11", "tmin");
  float[] novtmin = float(novtminstring);
  float avgnovtmin = mean(novtmin);
  println(avgnovtmin);
  
  String[] dectminstring = subsetValues(data, "mm", "12", "tmin");
  float[] dectmin = float(dectminstring);
  float avgdectmin = mean(dectmin);
  println(avgdectmin);
  
  avgrain[0] = avgjanrain;
  avgrain[1] = avgfebrain;
  avgrain[2] = avgmarrain;
  avgrain[3] = avgaprrain;
  avgrain[4] = avgmayrain;
  avgrain[5] = avgjunrain;
  avgrain[6] = avgjulrain;
  avgrain[7] = avgaugrain;
  avgrain[8] = avgseprain;
  avgrain[9] = avgoctrain;
  avgrain[10] = avgnovrain;
  avgrain[11] = avgdecrain;
  
  avgtempmax[0] = avgjantmax;
  avgtempmax[1] = avgfebtmax;
  avgtempmax[2] = avgmartmax;
  avgtempmax[3] = avgaprtmax;
  avgtempmax[4] = avgmaytmax;
  avgtempmax[5] = avgjuntmax;
  avgtempmax[6] = avgjultmax;
  avgtempmax[7] = avgaugtmax;
  avgtempmax[8] = avgseptmax;
  avgtempmax[9] = avgocttmax;
  avgtempmax[10] = avgnovtmax;
  avgtempmax[11] = avgdectmax;
  
  avgtempmin[0] = avgjantmin;
  avgtempmin[1] = avgfebtmin;
  avgtempmin[2] = avgmartmin;
  avgtempmin[3] = avgaprtmin;
  avgtempmin[4] = avgmaytmin;
  avgtempmin[5] = avgjuntmin;
  avgtempmin[6] = avgjultmin;
  avgtempmin[7] = avgaugtmin;
  avgtempmin[8] = avgseptmin;
  avgtempmin[9] = avgocttmin;
  avgtempmin[10] = avgnovtmin;
  avgtempmin[11] = avgdectmin;
}

void draw()
{
  for(int i = 0; i < avgrain.length; i++)

  {
   fill(0,0,200);
    ellipse(20+i*50,300-avgrain[i]*2,5,5);
 }
  for(int i = 0; i < avgtempmax.length; i++)
  {
    fill(0,200,0);
    ellipse(20+i*50,300-avgtempmax[i]*2,5,5);
  }
  for(int i = 0; i < avgtempmin.length; i++)
  {
    fill(200,0,0);
    ellipse(20+i*50,300-avgtempmin[i]*2,5,5);
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
// graph key: blue = rainfall, green = maximum temperature, red = minimum temperature
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



